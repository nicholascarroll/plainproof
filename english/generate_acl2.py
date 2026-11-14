#!/usr/bin/env python3
"""Generate Attempto sentences with the ACL2 generator (acl2/generator.lisp).
   generate_acl2.py THEOREMS FORMULAS-OUT SENTENCES-OUT
THEOREMS      one std/lists theorem name per line ('#' starts a comment)
FORMULAS-OUT  lines "name | normalised formula"
SENTENCES-OUT lines "name | sentence | intended"  or  "name | UNSUPPORTED | reason"
generate(items) is also used by tests/run_generator.py, with formulas written out."""
import os, re, subprocess, sys
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.environ.get("TOOLS_DIR", os.path.expanduser("~/tools"))
ACL2 = os.path.join(TOOLS, "acl2/saved_acl2")

def generate(items):
    """items: [(name, formula text or None)].  None means: the std/lists theorem of
    that name.  Every formula goes through the normaliser, then the generator.
    Returns ({name: normalised}, {name: (sentence or "UNSUPPORTED", intended or reason)})."""
    pairs = " ".join(f"({n} . {f if f else ':theorem'})" for n, f in items)
    script = f'''(include-book "std/lists/top" :dir :system)
(include-book "{ROOT}/acl2/generator")
(set-fmt-hard-right-margin 100000 state)
(set-fmt-soft-right-margin 100000 state)
(defun gen-all (pairs state)
  (declare (xargs :mode :program :stobjs state))
  (if (endp pairs) state
    (let* ((name (caar pairs))
           (f (if (eq (cdar pairs) :theorem) (formula name nil (w state)) (cdar pairs)))
           (n (string-downcase (symbol-name name))))
      (prog2$
       (if (not f) (cw "MISSING|~s0~%" n)
         (let ((x (norm f 1000)))
           (prog2$
            (cw "NORM|~s0|~s1~%" n (show x))
            (mv-let (err text intended) (generate x)
              (if err (cw "GEN|~s0|UNSUPPORTED|~s1~%" n err)
                (cw "GEN|~s0|~s1|~s2~%" n text (show intended)))))))
       (gen-all (cdr pairs) state)))))
(gen-all '({pairs}) state)
'''
    r = subprocess.run([ACL2], input=script, capture_output=True, text=True)
    norms = dict(m.groups() for m in re.finditer(r"NORM\|([^|\s]+)\|(.*)$", r.stdout, re.M))
    gens = {m.group(1): tuple(m.group(2).split("|", 1))
            for m in re.finditer(r"GEN\|([^|\s]+)\|(.*)$", r.stdout, re.M)}
    if items and not norms and "MISSING|" not in r.stdout:
        sys.exit("generate_acl2.py: ACL2 printed nothing\n" + r.stdout[-3000:])
    return norms, gens

def main(theorems, formulas_out, sentences_out):
    names = [l.strip() for l in open(theorems) if l.strip() and not l.startswith("#")]
    norms, gens = generate([(n, None) for n in names])
    with open(formulas_out, "w") as f:
        for n in names:
            if n in norms: f.write(f"{n} | {norms[n]}\n")
    with open(sentences_out, "w") as f:
        for n in names:
            if n in gens: f.write(f"{n} | {gens[n][0]} | {gens[n][1]}\n")

if __name__ == "__main__":
    main(*sys.argv[1:4])
