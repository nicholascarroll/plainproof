#!/usr/bin/env python3
"""Readability measures for certified sentences.   readability.py OUT_DIR"""
import os, re, statistics, sys
out = sys.argv[1]
rows = []
for line in open(os.path.join(out, "report.md")):
    if line.startswith("| `") and "CERTIFIED" in line:
        c = [x.strip() for x in line.strip().strip("|").split("|")]
        rows.append((c[0].strip("`"), c[1]))
def clauses(sentence):
    body = re.sub(r"^If ", "", sentence)
    ante, _, concl = body.partition(" then ")
    return [x.strip() for x in ante.split(", and ")], concl
stats = []
for n, text in rows:
    sents = [s.strip() + "." for s in text.split(".") if s.strip()]
    words = len(text.split())
    named = sum(1 for s in sents for c in clauses(s)[0] if re.match(r"[A-Z] is an? \S+ of ", c))
    stats.append((words, len(sents), named, n, text))
w = [s[0] for s in stats]
with open(os.path.join(out, "readability.md"), "w") as f:
    f.write("# Readability of certified sentences\n\n")
    f.write(f"- Certified texts: {len(stats)}\n")
    f.write(f"- Words per text: median {statistics.median(w)}, mean {statistics.mean(w):.1f}, longest {max(w)}\n")
    f.write(f"- Texts with no named intermediate (no \"Y is an F of X\" clause): "
            f"{sum(1 for s in stats if s[2] == 0)}\n")
    f.write(f"- Texts of two sentences (equivalences): {sum(1 for s in stats if s[1] == 2)}\n")
    f.write(f"- Named intermediates per text: mean {statistics.mean(s[2] for s in stats):.1f}\n\n")
    f.write("## Shortest five\n\n")
    for s in sorted(stats)[:5]: f.write(f"- `{s[3]}` ({s[0]} words): {s[4]}\n")
    f.write("\n## Longest five\n\n")
    for s in sorted(stats)[-5:]: f.write(f"- `{s[3]}` ({s[0]} words): {s[4]}\n")
print(f"median words {statistics.median(w)}, mean {statistics.mean(w):.1f}, longest {max(w)}")
