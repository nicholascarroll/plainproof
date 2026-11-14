#!/usr/bin/env python3
"""Run the construct suite through a compiler's output and compare with the
hand-written expectations.   run_constructs.py COMPILED_FILE
COMPILED_FILE has lines  name | paraphrase | statement   or  name | REJECTED | reason."""
import os, re, sys
here = os.path.dirname(os.path.abspath(__file__))
expect = {}
for line in open(os.path.join(here, "constructs.txt")):
    if line.startswith("#") or not line.strip(): continue
    n, _, e = [x.strip() for x in line.split("|", 2)]
    expect[n] = e
got = {}
for line in open(sys.argv[1]):
    n, a, b = [x.strip() for x in line.split("|", 2)]
    if a == "REJECTED":
        r = "unparsed" if b.startswith("Attempto could not parse") else re.match(r"[a-z_]+", b).group(0)
        got[n] = "REJECTED " + r
    else:
        got[n] = b
bad = [n for n in expect if got.get(n) != expect[n]]
for n in bad:
    print(f"MISMATCH {n}\n  expected: {expect[n]}\n  got:      {got.get(n)}")
print(f"{len(expect) - len(bad)} of {len(expect)} constructs as expected")
sys.exit(1 if bad else 0)
