#!/usr/bin/env python3
"""Stage 1: ACL2 theorem -> English -> ACL2, on theorems from std/lists.

  1. ACL2 prints each theorem's formula.
  2. The generator (acl2/generator.lisp, run by english/generate_acl2.py) writes an
     Attempto sentence, or says why it can't.
  3. Attempto parses it and the compiler (acl2/compiler.lisp, run by
     english/compile_acl2.py) compiles it back to an ACL2 statement.
  4. The compiled statement is matched against the original, up to renaming of
     variables, and written to acl2/stage1-claims.lisp.  Certifying that book
     proves each claim AND checks, inside ACL2, that its formula is identical
     to the library theorem's.  Only then is the sentence certified.
Writes stage1/report.md and stage1/cards.md.
"""
import os, re, subprocess, sys
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "english"))
from sexp import parse
TOOLS = os.environ.get("TOOLS_DIR", os.path.expanduser("~/tools"))
ACL2 = os.path.join(TOOLS, "acl2/saved_acl2")
APE = os.environ.get("APE", os.path.expanduser("~/ape/ape.exe"))
S1 = os.path.join(ROOT, "stage1")

def acl2(script):
    r = subprocess.run([ACL2], input=script, capture_output=True, text=True)
    return r.stdout

PRE = """(include-book "std/lists/top" :dir :system)
(set-fmt-hard-right-margin 100000 state)
(set-fmt-soft-right-margin 100000 state)
"""

def show(t): return t if isinstance(t, str) else "(" + " ".join(map(show, t)) + ")"

def main():
    global S1
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--theorems", default=os.path.join(S1, "theorems.txt"))
    ap.add_argument("--out", default=S1)
    ap.add_argument("--book", default="stage1-claims")
    a = ap.parse_args()
    S1 = os.path.abspath(a.out)
    os.makedirs(S1, exist_ok=True)
    names = [l.strip() for l in open(a.theorems) if l.strip() and not l.startswith("#")]
    # 1. Formulas.
    out = acl2(PRE + """(defun show-thms (names state)
  (declare (xargs :mode :program :stobjs state))
  (if (endp names) state
    (let ((f (formula (car names) nil (w state))))
      (prog2$ (cw "FORMULA|~x0|~x1|~x2~%%" (car names) (untranslate f t (w state)) f)
              (show-thms (cdr names) state)))))
(show-thms '(%s) state)
""" % " ".join(names))
    formulas = {}
    for m in re.finditer(r"FORMULA\|(\S+)\|(.*)\|(.*)", out):
        formulas[m.group(1).lower()] = (m.group(2), m.group(3))
    missing = [n for n in names if n not in formulas or formulas[n][1] == "NIL"]
    # 2. Generate (this also writes the normalised formulas the generator read).
    subprocess.run([sys.executable, os.path.join(ROOT, "english/generate_acl2.py"),
                    os.path.join(a.theorems), os.path.join(S1, "formulas.txt"),
                    os.path.join(S1, "sentences.txt")], check=True)
    gen, intended = {}, {}
    for line in open(os.path.join(S1, "sentences.txt")):
        parts = [x.strip() for x in line.split("|")]
        gen[parts[0]] = parts[1:]
        if parts[1] != "UNSUPPORTED": intended[parts[0]] = parse(parts[2])
    sentences = os.path.join(S1, "to-compile.txt")
    with open(sentences, "w") as f:
        for n, p in gen.items():
            if p[0] != "UNSUPPORTED": f.write(f"{n} | {p[0]}\n")
    # 3. Compile.
    subprocess.run([sys.executable, os.path.join(ROOT, "english/compile_acl2.py"), APE,
                    os.path.join(ROOT, "english/lexicon.pl"), sentences,
                    os.path.join(S1, "compiled.txt")], check=True, cwd=os.path.join(ROOT, "english"))
    comp = {}
    for line in open(os.path.join(S1, "compiled.txt")):
        n, para, stmt = [x.strip() for x in line.split("|", 2)]
        comp[n] = (para, stmt)
    # 4. Translate each compiled statement, and find the renaming onto the original.
    ok = {n: c for n, c in comp.items() if c[0] != "REJECTED"}
    out = acl2(PRE + f'(include-book "{ROOT}/acl2/generator")\n' + """(defun tr-all (pairs state)
  (declare (xargs :mode :program :stobjs state))
  (if (endp pairs) state
    (mv-let (erp val state) (translate (cdar pairs) t nil t 'top (w state) state)
      (prog2$ (if erp (cw "TRANSLATED|~x0|:ERROR~%%" (caar pairs))
                (cw "TRANSLATED|~x0|~x1~%%NORMALISED|~x0|~s2~%%" (caar pairs) val (show (difference-normal (norm val 1000)))))
              (tr-all (cdr pairs) state)))))
(tr-all '(%s) state)
""" % " ".join(f"({n} . {s})" for n, (p, s) in ok.items()))
    translated = {m.group(1).lower(): m.group(2) for m in re.finditer(r"TRANSLATED\|(\S+)\|(.*)", out)}
    normalised = {m.group(1).lower(): m.group(2) for m in re.finditer(r"NORMALISED\|(\S+)\|(.*)", out)}
    claims, mapping, how = {}, {}, {}
    for n in ok:
        tr = parse(translated.get(n, ":ERROR"))
        m = alpha(tr, parse(formulas[n][1]))
        if m is not None:
            how[n] = "identical"
        else:
            m = alpha_sentences(parse(normalised[n]), intended[n]) if n in normalised else None
            if m is not None: how[n] = "equivalent"
        if m is not None:
            mapping[n] = m
            claims[n] = show(rename(parse(ok[n][1].upper()), m)).lower()
    with open(os.path.join(ROOT, f"acl2/{a.book}.lisp"), "w") as f:
        f.write(f"; GENERATED by stage1/run.py from {os.path.relpath(S1, ROOT)}/to-compile.txt. Do not edit.\n")
        f.write("; Each claim is the compiled English, with variables renamed to the library's.\n")
        f.write("; Every claim is proved from its library theorem using basic logic only.\n")
        f.write("; Identical: the assert-event checks its formula is the library theorem's.\n")
        f.write("; Equivalent: the claim is proved from the library theorem, and the library\n")
        f.write("; theorem from the claim, each using basic logic only: minimal-theory, plus\n")
        f.write("; facts about which types of values functions return (type-prescriptions).\n")
        f.write('(in-package "ACL2")\n(include-book "std/lists/top" :dir :system)\n')
        f.write("(defconst *basic-logic*\n  '((:definition return-last) (:definition iff) (:definition implies) (:definition not)))\n")
        for n, s in claims.items():
            th = "(union-theories (theory 'minimal-theory) (append *basic-logic* (rules-of-class :type-prescription :here)))"
            if how[n] == "identical":
                f.write(f"\n(defthm {n}-in-english\n  {s}\n  :rule-classes nil\n"
                        f"  :hints ((\"Goal\" :use {n} :in-theory {th})))\n")
                f.write(f"(assert-event (equal (formula '{n}-in-english nil (w state))\n"
                        f"                     (formula '{n} nil (w state))))\n")
            else:
                f.write(f"\n(defthm {n}-in-english\n  {s}\n  :rule-classes nil\n"
                        f"  :hints ((\"Goal\" :use {n} :in-theory {th})))\n")
                f.write(f"(defthm {n}-from-english\n  {formulas[n][1].lower()}\n  :rule-classes nil\n"
                        f"  :hints ((\"Goal\" :use {n}-in-english :in-theory {th})))\n")
                f.write(f"(assert-event (equal (formula '{n}-from-english nil (w state))\n"
                        f"                     (formula '{n} nil (w state))))\n")
    # 5. Report and cards.
    rows, cards = [], []
    for n in names:
        if n in missing:
            rows.append((n, "", "not found or not a single theorem")); continue
        g = gen.get(n)
        if g[0] == "UNSUPPORTED":
            rows.append((n, "", "unsupported: " + g[1])); continue
        para, stmt = comp[n]
        if para == "REJECTED":
            rows.append((n, g[0], "rejected by compiler: " + stmt)); continue
        if n not in claims:
            rows.append((n, g[0], "compiled, but not identical to the library theorem")); continue
        rows.append((n, g[0], "CERTIFIED" + (" (equivalent)" if how[n] == "equivalent" else "")))
        cards.append(f"### `{n}`\n\n- **English:** {g[0]}\n- **Attempto's reading:** {para}\n"
                     f"- **Compiled:** `{claims[n]}`\n- **Library theorem:** `{formulas[n][0].lower()}`\n")
    cert = sum(1 for r in rows if r[2].startswith("CERTIFIED"))
    with open(os.path.join(S1, "report.md"), "w") as f:
        f.write(f"# Stage 1 report\n\n**{cert} of {len(rows)} theorems certified.** "
                "Certified means: the English compiles to a statement that is identical to the library "
                "theorem, up to the names of variables. The match is found here, and confirmed inside "
                f"ACL2 when `acl2/{a.book}.lisp` certifies, which also proves each claim.\n\n")
        f.write("| Theorem | English | Result |\n|---|---|---|\n")
        for n, e, r in rows:
            f.write(f"| `{n}` | {e} | {r} |\n")
    with open(os.path.join(S1, "cards.md"), "w") as f:
        f.write("# Review cards for certified sentences\n\n" + "\n".join(cards))
    print(f"{cert} of {len(rows)} theorems matched")

def alpha(a, b, m=None):
    """A renaming of a's variables onto b's that makes them equal, or None."""
    m = {} if m is None else m
    if isinstance(a, str) and isinstance(b, str):
        if is_var(a) and is_var(b):
            if a in m: return m if m[a] == b else None
            if b in m.values(): return None
            m[a] = b; return m
        return m if a == b else None
    if isinstance(a, list) and isinstance(b, list) and len(a) == len(b):
        if a[0] != b[0]: return None
        for x, y in zip(a[1:], b[1:]):
            if alpha(x, y, m) is None: return None
        return m
    return None

def alpha_sentences(a, b):
    """Like alpha, but for a text of several sentences, ('AND' s1 s2 ...), each
    sentence is renamed on its own: each is a separate universal claim."""
    if isinstance(a, list) and isinstance(b, list) and a and b and a[0] == b[0] == "AND" \
            and len(a) == len(b) and all(isinstance(x, list) and x[0] == "IMPLIES" for x in a[1:]):
        maps = []
        for x, y in zip(a[1:], b[1:]):
            mi = alpha(x, y)
            if mi is None: return None
            maps.append(mi)
        return ("per-sentence", maps)
    return alpha(a, b)

def is_var(s): return re.fullmatch(r"[A-Z][A-Z0-9-]*", s) is not None and s not in ("NIL", "T")

def rename(t, m):
    if isinstance(m, tuple):        # one map per sentence
        return [t[0]] + [rename(x, mi) for x, mi in zip(t[1:], m[1])]
    if isinstance(t, str): return m.get(t, t)
    return [t[0]] + [rename(a, m) for a in t[1:]]

if __name__ == "__main__":
    main()
