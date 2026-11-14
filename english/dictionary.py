"""Reads english/dictionary.pl, the single source of truth for the vocabulary."""
import os, re
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
KINDS = ["type_noun", "result_noun", "relation_noun", "relation_adjective",
         "adjective", "comparison", "constant"]

def load(path=os.path.join(ROOT, "english/dictionary.pl")):
    """{kind: [[word, function, ...], ...]} in the order of the file."""
    kinds = {k: [] for k in KINDS}
    for line in open(path):
        line = line.split("%")[0].strip()
        m = re.match(r"(\w+)\((.*)\)\.$", line)
        if not m or m.group(1) not in kinds: continue
        kinds[m.group(1)].append([a.strip().strip("'") for a in m.group(2).split(",")])
    return kinds

def known_functions(kinds=None):
    """Upper-case names of the functions and tests that have a word."""
    kinds = kinds or load()
    return {r[1].upper() for k in ["type_noun", "result_noun", "relation_noun",
                                   "relation_adjective", "adjective"] for r in kinds[k]}
