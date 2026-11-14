#!/usr/bin/env python3
"""Why theorems don't certify: for each one that didn't, list the words and the
grammar it would need.  Writes OUT/causes.md.   analyse.py OUT_DIR"""
import collections, os, re, sys
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "english"))
from sexp import parse
from dictionary import known_functions

out = sys.argv[1]
known = known_functions()
# Logical structure.  None: supported by the grammar.  Otherwise: what it would need.
GRAMMAR = {"IMPLIES": None, "AND": None, "NOT": None, "EQUAL": None, "IFF": None, "OR": None,
           "IF": None, "<": None, "QUOTE": "quoted constants",
           "SYNP": "syntaxp: a rewriting directive with no meaning as a fact",
           "LET": "let", "LET*": "let",
           "MBE": "mbe (executable variants)", "RETURN-LAST": "mbe (executable variants)"}

def symbols(t, acc):
    if isinstance(t, list):
        if not t: return
        if t[0] == "QUOTE": acc.add("QUOTE"); return
        if isinstance(t[0], list): acc.add("LET"); symbols(t[0], acc)
        else: acc.add(t[0])
        for a in t[1:]: symbols(a, acc)

status = {}
for line in open(os.path.join(out, "report.md")):
    if line.startswith("| `"):
        cells = [x.strip() for x in line.strip().strip("|").split("|")]
        status[cells[0].strip("`")] = cells[2]
formulas = {}
for line in open(os.path.join(out, "formulas.txt")):
    n, f = [x.strip() for x in line.split("|", 1)]
    formulas[n] = parse(f)

need_words, need_grammar = {}, {}
for n, st in status.items():
    if st.startswith("CERTIFIED") or n not in formulas: continue
    syms = set(); symbols(formulas[n], syms)
    need_words[n] = sorted(s.lower() for s in syms if s not in known and s not in GRAMMAR)
    need_grammar[n] = sorted({GRAMMAR[s] for s in syms if GRAMMAR.get(s)})

notfound = [n for n, st in status.items() if n not in formulas]
cert = [n for n, st in status.items() if st.startswith("CERTIFIED")]
failing = [n for n in need_words]
vocab_only = [n for n in failing if need_words[n] and not need_grammar[n]]
grammar_only = [n for n in failing if need_grammar[n] and not need_words[n]]
both = [n for n in failing if need_words[n] and need_grammar[n]]
neither = [n for n in failing if not need_words[n] and not need_grammar[n]]

word_total = collections.Counter(w for n in failing for w in need_words[n])
word_alone = collections.Counter(need_words[n][0] for n in vocab_only if len(need_words[n]) == 1)
gram_total = collections.Counter(g for n in failing for g in need_grammar[n])
gram_alone = collections.Counter(need_grammar[n][0] for n in grammar_only if len(need_grammar[n]) == 1)

with open(os.path.join(out, "causes.md"), "w") as f:
    f.write("# Why theorems don't certify yet\n\n")
    f.write(f"Of {len(status)} theorem names found in `std/lists/*.lisp`:\n\n")
    f.write(f"- **{len(cert)} certified.**\n")
    f.write(f"- **{len(notfound)} not available** after including `std/lists/top`: local lemmas, "
            "or books that `top` doesn't include.\n")
    f.write(f"- **{len(failing)} not yet certified.** Of these:\n")
    f.write(f"  - {len(vocab_only)} need only new words\n")
    f.write(f"  - {len(grammar_only)} need only new grammar\n")
    f.write(f"  - {len(both)} need both\n")
    f.write(f"  - {len(neither)} have all their words and grammar, and fail for another reason "
            "(see the report)\n\n")
    f.write("## Grammar, by how many theorems need it\n\n| Construct | Needed by | Would unlock on its own |\n|---|---|---|\n")
    for g, k in gram_total.most_common():
        f.write(f"| {g} | {k} | {gram_alone.get(g, 0)} |\n")
    f.write("\n## Words, by how many theorems need them\n\n"
            "'Would unlock on its own' counts theorems where this word is the only thing missing.\n\n"
            "| ACL2 function | Needed by | Would unlock on its own |\n|---|---|---|\n")
    for w, k in word_total.most_common(40):
        f.write(f"| `{w}` | {k} | {word_alone.get(w, 0)} |\n")
    f.write("\n## Failing for another reason\n\n")
    for n in neither:
        f.write(f"- `{n}`: {status[n]}\n")
print(f"certified {len(cert)}, not available {len(notfound)}, failing {len(failing)}: "
      f"words only {len(vocab_only)}, grammar only {len(grammar_only)}, both {len(both)}, other {len(neither)}")
