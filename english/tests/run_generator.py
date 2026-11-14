#!/usr/bin/env python3
"""Run the generator's construct suite (tests/generator.txt) through
acl2/generator.lisp and compare with the hand-written expectations."""
import os, sys
here = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.dirname(here))
from generate_acl2 import generate

cases = []
for line in open(os.path.join(here, "generator.txt")):
    if line.startswith("#") or not line.strip(): continue
    n, f, e = [x.strip() for x in line.split("|", 2)]
    cases.append((n, f, e))
_, gens = generate([(n, f) for n, f, _ in cases])
bad = 0
for n, f, e in cases:
    g = gens.get(n)
    got = None if g is None else ("UNSUPPORTED " + g[1] if g[0] == "UNSUPPORTED" else g[0])
    if got != e:
        bad += 1
        print(f"MISMATCH {n}\n  expected: {e}\n  got:      {got}")
print(f"{len(cases) - bad} of {len(cases)} generator constructs as expected")
sys.exit(1 if bad else 0)
