#!/bin/sh
# Recheck everything from scratch.  One PASS or FAIL line per check.
#   TOOLS_DIR=~/tools APE=~/ape/ape.exe sh check.sh
set -u
HERE=$(cd "$(dirname "$0")" && pwd); cd "$HERE"
TOOLS_DIR=${TOOLS_DIR:-$HOME/tools}; export TOOLS_DIR
APE=${APE:-$HOME/ape/ape.exe}; export APE
ACL2=$TOOLS_DIR/acl2/saved_acl2
FAILED=0
pass() { echo "PASS  $1"; }
fail() { echo "FAIL  $1"; FAILED=1; }
TMP=$(mktemp -d)

# 1. The dictionary's examples hold.
( cd acl2 && rm -f dictionary.cert && printf '(certify-book "dictionary" ?)\n' | "$ACL2" > dictionary.log 2>&1 )
if [ -f acl2/dictionary.cert ]; then
  pass "1. dictionary: $(grep -c '^(assert-event' acl2/dictionary.lisp) examples hold"
else fail "1. dictionary examples (see acl2/dictionary.log)"; fi

# 2. The English tools: the dictionary data regenerates from english/dictionary.pl, and
#    the compiler, the theorems about it, and the generator certify, all in logic mode,
#    with nothing skipped or assumed.
cp acl2/dictionary-data.lisp "$TMP/dictionary-data.lisp"
python3 english/dictionary_to_acl2.py > /dev/null
( cd acl2 && rm -f dictionary-data.cert compiler.cert compiler-theorems.cert generator.cert &&
  printf '(certify-book "dictionary-data" ?)\n(u)\n(certify-book "compiler" ?)\n(u)\n(certify-book "compiler-theorems" ?)\n(u)\n(certify-book "generator" ?)\n' | "$ACL2" > tools.log 2>&1 )
if cmp -s acl2/dictionary-data.lisp "$TMP/dictionary-data.lisp" &&
   [ -f acl2/compiler-theorems.cert ] && [ -f acl2/generator.cert ] &&
   python3 scripts/cert-audit.py acl2/compiler-theorems.lisp --strict > "$TMP/caudit" 2>&1 &&
   python3 scripts/cert-audit.py acl2/generator.lisp --strict >> "$TMP/caudit" 2>&1; then
  pass "2. compiler and generator certify, with $(grep -cE '^ *\((local \()?defthm ' acl2/compiler-theorems.lisp) theorems about the compiler, including vocabulary soundness; strict audit passes"
else fail "2. English tools (see acl2/tools.log)"; cat "$TMP/caudit"; fi

# 3. The compiler's construct suite: every construct compiles to its hand-written
#    expected statement, and every trap is refused.
grep -v '^#' english/tests/constructs.txt | cut -d'|' -f1,2 > "$TMP/suite.txt"
python3 english/compile_acl2.py "$APE" english/lexicon.pl "$TMP/suite.txt" "$TMP/suite-acl2.out"
if python3 english/tests/run_constructs.py "$TMP/suite-acl2.out" > "$TMP/s2"; then
  pass "3. compiler construct suite: $(tail -1 $TMP/s2)"
else fail "3. compiler construct suite"; cat "$TMP/s2"; fi

# 4. The generator's construct suite: every formula gives its hand-written expected
#    sentence, or is refused for the expected reason.
if python3 english/tests/run_generator.py > "$TMP/g" 2>&1; then
  pass "4. generator construct suite: $(tail -1 $TMP/g)"
else fail "4. generator construct suite"; cat "$TMP/g"; fi

# 5. Both rounds regenerate exactly what's committed: formulas, sentences, compiled
#    claims, reports, cards.  Each certified sentence is a checked round trip: generated,
#    parsed by Attempto, compiled, and (in 6) confirmed by ACL2 to be the theorem.
FILES="stage1/formulas.txt stage1/sentences.txt stage1/compiled.txt stage1/report.md stage1/cards.md
       acl2/stage1-claims.lisp stage1/all/formulas.txt stage1/all/sentences.txt
       stage1/all/compiled.txt stage1/all/report.md stage1/all/cards.md stage1/all/causes.md
       stage1/all/readability.md
       acl2/stage1-all-claims.lisp"
for f in $FILES; do mkdir -p "$TMP/old/$(dirname $f)"; cp "$f" "$TMP/old/$f"; done
python3 stage1/run.py > "$TMP/run1.out" 2>&1
python3 stage1/run.py --theorems stage1/all/theorems.txt --out stage1/all --book stage1-all-claims > "$TMP/run2.out" 2>&1
python3 stage1/analyse.py stage1/all > "$TMP/causes.out" 2>&1
python3 stage1/readability.py stage1/all > "$TMP/read.out" 2>&1
SAME=1
for f in $FILES; do cmp -s "$f" "$TMP/old/$f" || { SAME=0; echo "      changed: $f"; }; done
[ $SAME -eq 1 ] && pass "5. both rounds regenerate identically: $(cat $TMP/run1.out) (round 1), $(cat $TMP/run2.out) (all of std/lists)" \
                || fail "5. output differs from what's committed"

# 6. Every matched sentence becomes a certified claim: proved from its library
#    theorem by basic logic, with ACL2 checking the identity (or, for theorems
#    wrapped in executable variants, proving the library theorem back from it).
( cd acl2 && rm -f stage1-claims.cert stage1-all-claims.cert &&
  printf '(certify-book "stage1-claims" ?)\n(u)\n(certify-book "stage1-all-claims" ?)\n' | "$ACL2" > stage1-cert.log 2>&1 )
if [ -f acl2/stage1-claims.cert ] && [ -f acl2/stage1-all-claims.cert ]; then
  pass "6. certified: $(grep -c 'in-english$' acl2/stage1-claims.lisp) claims (round 1), $(grep -c 'in-english$' acl2/stage1-all-claims.lisp) claims (all of std/lists)"
else fail "6. claims (see acl2/stage1-cert.log)"; fi

# 7. No skipped proofs, axioms or trust tags in either include tree.
if python3 scripts/cert-audit.py acl2/stage1-claims.lisp --strict > "$TMP/audit" 2>&1 &&
   python3 scripts/cert-audit.py acl2/stage1-all-claims.lisp --strict >> "$TMP/audit" 2>&1; then
  pass "7. strict audit of both claim books: $(tail -1 $TMP/audit | sed 's/.*: //')"
else fail "7. strict audit"; cat "$TMP/audit"; fi

# 8. The identity check can fail: a true claim with its sides swapped is refused.
mkdir -p "$TMP/p" && cp acl2/cert.acl2 "$TMP/p/" && cat > "$TMP/p/planted.lisp" <<'LISP'
(in-package "ACL2")
(include-book "std/lists/top" :dir :system)
(defthm len-of-rev-in-english (equal (len x) (len (rev x))) :rule-classes nil)
(assert-event (equal (formula 'len-of-rev-in-english nil (w state)) (formula 'len-of-rev nil (w state))))
LISP
( cd "$TMP/p" && printf '(certify-book "planted" ?)\n' | "$ACL2" > planted.log 2>&1 )
if [ ! -f "$TMP/p/planted.cert" ] && grep -q "Assertion failed" "$TMP/p/planted.log"; then
  pass "8. a planted non-identical claim is refused by the identity check"
else fail "8. the planted non-identical claim was accepted"; fi

rm -rf "$TMP"
[ $FAILED -eq 0 ] && echo "ALL CHECKS PASSED" || echo "SOME CHECKS FAILED"
exit $FAILED
