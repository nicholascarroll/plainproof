# Plain Proof

Plain Proof provides certified English for ACL2. Each sentence in the corpus states exactly what a proved ACL2
theorem states, and the correspondence is checked mechanically.

> If Z is an append of X and Y, and U is a length of X, and V is a length of Y then a length
> of Z is a sum of U and V.

This sentence compiles to `(equal (len (append x y)) (+ (len x) (len y)))`. ACL2 proves the
compiled statement and confirms that it is identical to `len-of-append` in the ACL2 list library.

The plan is in [`PLAN.md`](PLAN.md); the record of work is in [`NOTEBOOK.md`](NOTEBOOK.md).

## Status

| Stage | State |
|---|---|
| 0. Toolchain | Complete; versions are pinned in `versions.env`. |
| 1. ACL2 to English | Complete after four rounds; 318 of 467 available theorems in `std/lists` are certified (68%). |
| 2. The English tools in ACL2 | Complete, with one deviation from the plan. |
| 3. Readable English, self-description, concordance | Planned in [`PLAN.md`](PLAN.md). |
| 4. An outside user | Not started. |

### Stage 1

Results are in [`stage1/all/report.md`](stage1/all/report.md), causes of failure in
[`stage1/all/causes.md`](stage1/all/causes.md), review cards in
[`stage1/all/cards.md`](stage1/all/cards.md), and sentence lengths in
[`stage1/all/readability.md`](stage1/all/readability.md). All 25 theorems selected for round 1
are certified ([`stage1/report.md`](stage1/report.md)).

The grammar covers the following constructs:

- equivalences ("If A then B. If B then A.");
- "or", and "and" in conclusions;
- comparisons ("N is smaller than M");
- equalities as conditions ("A is B", "A is not B");
- case splits, with one sentence for each branch of an if-then-else within a term;
- values as truth values ("Y is not Nil").

Of the 149 theorems not certified, 130 require only new vocabulary.

### Stage 2

Both English tools are ACL2 programs in logic mode. Only the Attempto parser lies outside ACL2.

The compiler is `acl2/compiler.lisp`, and the theorems about it are in
`acl2/compiler-theorems.lisp`. The principal theorem is vocabulary soundness: every function in
any compiled statement is the meaning of a dictionary word or a logical connective, so the
reviewed dictionary bounds the meaning of every certified sentence. Further theorems show that a
sentence introducing an individual after "then", inside "not" or inside "or" is refused.

The generator and normaliser are `acl2/generator.lisp`.

Each tool replaced its predecessor, a Prolog compiler and a Python generator respectively, only
after exact agreement: on 294 sentences for the compiler and on 565 theorems for the generator.
Each has a construct suite with hand-written expectations
([`english/tests/constructs.txt`](english/tests/constructs.txt), 36 cases;
[`english/tests/generator.txt`](english/tests/generator.txt), 40 cases).

The general round-trip theorem is deferred until the grammar stabilises, which is a deviation
from the plan. Each certified sentence remains an individually checked round trip. The rationale
is in [`NOTEBOOK.md`](NOTEBOOK.md).

## Method

```
ACL2 theorem --generate--> Attempto sentence --parse--> DRS --compile--> ACL2 statement
                                                                              |
                         certified only if this is identical to the theorem <-+
```

1. `acl2/generator.lisp` writes an Attempto sentence for a theorem, using the dictionary in
   reverse. The generator is not trusted; its output is checked.
2. The Attempto parser (APE) produces a discourse representation structure (DRS). Its
   paraphrase records the reading. `english/parse.pl` prints the DRS for ACL2.
3. `acl2/compiler.lisp` translates the DRS into an ACL2 statement, condition by condition.
   Unrecognised input is refused.
4. Each compiled statement becomes a claim in an ACL2 book, proved from its library theorem by
   basic logic only. ACL2 then confirms that the claim is identical to the library theorem.
   Where identity is impossible (an equivalence stated as two sentences, or a theorem wrapped in
   executable variants), ACL2 instead proves the library theorem from the claim. Both directions
   use basic logic and type-prescription rules only.

## Dictionary

`english/dictionary.pl` maps words to ACL2 functions. `english/lexicon.pl` is the Attempto
lexicon. `acl2/dictionary.lisp` gives each word a meaning and examples checked at certification.

| Kind | Words |
|---|---|
| Classifying nouns ("X is a true-list") | true-list, pair |
| Result nouns ("Y is a reversal of X") | length, reversal, reverse, list-fix, natural-value, head, tail, last-pair, final-cdr, flattening, deduplication |
| Two- and three-argument result nouns ("Z is an append of X and Y") | append, revappend, cons, take, nthcdr, repeat, sum, difference, nth, rcons, removal, duplicity, intersection, union, set-difference, index, listpos, update-nth |
| Relation nouns ("A is a member of X") | member, subset, prefix, suffix, sublist |
| Relation adjectives ("X is set-equivalent-to Y") | set-equivalent-to, list-equivalent-to |
| Comparisons ("N is smaller than M") | smaller than |
| Adjectives ("X is atomic") | atomic, duplicate-free, natural |
| Constants | Nil |

## Verification

```
TOOLS_DIR=~/tools APE=~/ape/ape.exe sh check.sh
```

The expected output, after approximately three minutes, is:

```
PASS  1. dictionary: 55 examples hold
PASS  2. compiler and generator certify, with 50 theorems about the compiler, including vocabulary soundness; strict audit passes
PASS  3. compiler construct suite: 36 of 36 constructs as expected
PASS  4. generator construct suite: 40 of 40 generator constructs as expected
PASS  5. both rounds regenerate identically: 25 of 25 theorems matched (round 1), 318 of 540 theorems matched (all of std/lists)
PASS  6. certified: 25 claims (round 1), 318 claims (all of std/lists)
PASS  7. strict audit of both claim books: 100 books in include tree
PASS  8. a planted non-identical claim is refused by the identity check
ALL CHECKS PASSED
```

Check 5 counts all 540 theorem names in the source files. Of these, 73 are unavailable after
including `std/lists/top`, leaving 467.

Installation is described in [`docs/setup.md`](docs/setup.md).

## Layout

| Path | Contents |
|---|---|
| `english/` | dictionary, lexicon, the parser wrapper (Prolog, calls APE), and scripts that run the ACL2 tools |
| `english/tests/` | construct suites for the compiler and the generator |
| `acl2/compiler.lisp`, `acl2/compiler-theorems.lisp` | the compiler and theorems about it |
| `acl2/generator.lisp` | the generator and normaliser |
| `acl2/` | in addition, the dictionary's checked examples and the generated stage 1 claims |
| `stage1/` | the theorems attempted, the pipeline, and its outputs |
| `scripts/cert-audit.py` | the strict audit |
| `check.sh` | the script that rechecks everything |
