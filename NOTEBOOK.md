# Lab notebook

One entry per session: date, level (object or meta), stage, goal, what was tried, what
certified or failed and why, the `check` lines, and what's next.

## 2026-11-13: stage 0 and the first round of stage 1 (meta level)

**Goal.** Set up the project, and get the ACL2-to-English direction working on a first set
of library theorems.

**Tried.**
- Pinned ACL2, SBCL, SWI-Prolog and the Attempto parser (`versions.env`).
- A dictionary of 17 words, for lists and arithmetic, with 25 checked examples.
- A new compiler, Attempto parse to ACL2, which now handles two-argument nouns
  ("an append of X and Y"), numbers, constants and negation.
- A generator, ACL2 to Attempto. 25 theorems from `std/lists`, picked by hand, including
  some expected to fail.

**Result.** 19 of 25 certified: proved, and checked by ACL2 to be identical to the library
theorem. The six that don't fit, and why:
- `true-listp-of-append`, `consp-of-append` and `member-of-append` need "if and only if".
- `take-of-append` and `car-of-append` need "if ... then ... else" inside a term.
- `take-of-len-free` has an equality hypothesis, which the compiler substitutes away, so the
  compiled form differs from the library's even though it means the same.

**Learned.** Four traps, all now guarded against:
1. **Bracketing.** "a sum of a length of X and a length of Y" parses as "a sum of [a length of
   [X and a length of Y]]", and Attempto's paraphrase doesn't show it. So two-argument nouns
   take only variables and constants, compound arguments are named first ("U is a length of
   X"), and the compiler refuses a noun with the wrong number of arguments.
2. **Late introduction.** A variable first mentioned after "then" means "there is some Y",
   which weakens the claim without any error. The compiler refuses it.
3. **Paraphrase numbering.** Attempto's paraphrase can reorder clauses, so its X1, X2 don't
   always match the compiler's numbering. Review cards show the library theorem's own
   variable names instead.
4. **Prolog copies variables.** `findall` and lambda expressions copy the parse's referents,
   which cuts them off from their conditions. The compiler uses plain recursion throughout.

**Check.** All six checks pass.

**Next.**
- Add "if and only if" to the grammar. That's three of the six failures.
- Try all 493 theorems in `std/lists`, and sort the failures by cause.
- Decide whether the compiler should keep an equality hypothesis rather than substitute it.

## 2026-11-13: stage 1, round 2, all of `std/lists` (meta level)

**Goal.** Run every theorem in ACL2's list library through the pipeline, and sort the
failures by cause.

**Tried.**
- All 540 theorem names in `std/lists/*.lisp`. 73 aren't available after including
  `std/lists/top` (local lemmas, or books it doesn't include), leaving 467.
- First pass, with the round 1 dictionary: **36 certified.**
- The analysis showed many theorems are about macros like `member` and `subsetp`, whose
  stored form is wrapped in executable-variant code (`let`, `mbe`, `prog2$`). A normaliser
  (`english/normalize.py`) now strips that before generating. Such theorems can't be checked
  by identity, so they're certified another way: the claim is proved from the library
  theorem, and the library theorem from the claim, each using basic logic only.
- 23 new words: relation nouns ("A is a member of X", subset, prefix, suffix, sublist),
  relation adjectives ("X is set-equivalent-to Y", list-equivalent-to), three-argument
  nouns (update-nth), and 15 result nouns and adjectives. Each has checked examples.

**Result.** **141 of 467 available theorems certified** (113 identical, 28 equivalent), up
from 36. All 141 are proved from their library theorems by basic logic, and the strict audit
passes. Details: `stage1/all/report.md` and `stage1/all/causes.md`.

**What blocks the rest.** Grammar is now the bottleneck, not words:
- **If and only if:** the first blocker for 79 theorems.
- **Comparisons** (less than, at most): needed by 79, and the only thing missing for 45.
- **If-then-else inside a term:** needed by 62, and the only thing missing for 24.
- The words still missing are mostly specialised (`zp`, `all-equalp`, `intersectp-equal`).

**Learned.**
1. **A fourth trap: introduced inside "not".** In "If A is not a member of X then ...", with X
   new, Attempto quantifies X inside the negation: "A is a member of nothing". The compiler
   would have read "A is not a member of this X". It now refuses a thing first mentioned
   inside "not", and the generator puts positive hypotheses first.
2. **A fifth guard: nested arguments.** The compiler refuses a several-argument noun inside
   another's arguments. That's where Attempto's bracketing could go wrong while every
   argument count still looks right.
3. **Prove claims from the library theorem directly.** Some library theorems are rewrite rules
   that don't fire as stated (one under `set-equiv`), so "identical" claims must be proved by
   using the theorem itself, with basic logic only.
4. **Restate a theorem in ACL2's internal form,** not its readable form. The readable form
   doesn't always translate back to the same term.
5. **Hand-picked samples flatter.** Round 1 certified 76% of a chosen set. The first honest
   run certified 8%. Measurement has to be on the whole population.

**Check.** All six checks pass from clean in about 90 seconds.

**Next.**
- "If and only if". Possibly as two sentences, "If A then B. If B then A.", certified
  jointly by the equivalence route.
- Comparisons ("N is less than M"), using Attempto's comparative adjectives.
- Look at the 7 theorems that need "equal" as a test, and the 2 that Attempto couldn't parse.

## 2026-11-13: stage 1, round 3, equivalences, comparisons, readability (meta level)

**Goal.** Add "if and only if" and comparisons, which the round 2 analysis ranked as the
largest blockers. Then a first readability pass.

**Tried.**
- **"If and only if" as two sentences.** "If A then B. If B then A." The compiler translates
  each sentence on its own, and the claim is their conjunction. Each sentence is renamed onto
  the library's variables separately, because each is its own universal claim.
- **"Or"**, in antecedents and conclusions.
- **Comparisons:** "N is smaller than M" for `<`. ACL2 writes `<=` as "not (M < N)", so it
  reads "M is not smaller than N".
- **"There is something N"**, to introduce a variable that appears in no term before "then".
- **A wider certification route.** A library theorem stated as `(equal P Q)` is "if and only
  if" only when P and Q are true/false values. The two-way proof may now also use facts about
  which types of values functions return (type-prescriptions), and nothing else. A claim that
  really is weaker than its library theorem would still fail to certify.

**Result.** **237 of 467 certified, about half**, up from 141. Round 1 is now 22 of 25.
- 53 of the certified texts are two-sentence equivalences.
- 36 use "smaller than", and 10 use "or".
- All are proved from their library theorems both ways by basic logic, and the strict audit
  passes.

**Learned.**
1. **"Or" binds more loosely than "and".** "If P and Q or R" is "(P and Q) or R". A comma
   before "and" lowers its precedence: "If P, and Q or R" is "P and (Q or R)".
2. **The clause-joining "and" can be swallowed by a noun phrase.** "Y is a cons of A and Nil
   and a removal of A and X is a pair" was read with "Nil and a removal …" as one group. The
   compiler refused it on argument count, as it should. The generator now separates every
   clause with ", and", which fixed all four cases. That's also easier to read.
3. **Things first mentioned inside "or"** exist only on that side, like with "not". The
   compiler refuses them. `check.sh` now tests six traps.
4. **"If and only if" isn't always "equal".** `(equal P Q)` needs both sides to be true/false
   values. Certification proves that, rather than assuming it.

**Readability** (`stage1/all/readability.md`):
- Median 25 words per text, mean 28.3, longest 88.
- 34 of 237 texts need no named intermediates. The mean is 1.5 per text.
- Fixed: the same term was sometimes named twice. Each term is now named once.
- Renamed: rev to *reversal*, natural-fix to *natural-value*, and last to *last-pair*, since
  it returns the last pair, not the last element.
- **What limits readability:** two-argument nouns can only take plain names, because of the
  bracketing trap. So any arithmetic or nested list operation needs named intermediates, with
  letters like P, Q and R. That's the main cost, and it's structural. Possible fixes are a
  safe way to nest phrases, and better single-letter conventions, such as N and M for numbers.

**Check.** All six checks pass from clean.

**Next.**
- Stage 2: port the compiler to ACL2, and build a systematic test suite of Attempto
  constructs against their expected logic. The compiler now has six guards, and is what
  decides what English means.
- The remaining blockers are if-then-else inside terms (17 alone), more comparisons (12 alone),
  and specialised words. Diminishing returns, so not before stage 2.

## 2026-11-13: stage 2, the compiler in ACL2 (meta level)

**Goal.** The compiler decides what English means, and had grown to six guards in unverified
Prolog. Move it into ACL2, test it systematically, and prove things about it.

**Tried.**
- **A construct suite** (`english/tests/constructs.txt`): 32 cases, one per grammar construct
  plus each trap, with the expected statement written by hand rather than copied from the
  compiler.
- **The split.** Prolog now only parses: `english/parse.pl` calls Attempto and prints the
  parse as an s-expression. The translation is `acl2/compiler.lisp`, every function in logic
  mode, mirroring the Prolog clause for clause.
- **The dictionary as ACL2 data,** generated from `english/dictionary.pl`, so there's still
  one source.
- **A differential test** of both compilers on every sentence the pipeline has generated,
  plus the suite.

**Result.**
- The construct suite passes on both compilers.
- **The compilers agree on all 294 sentences:** 281 identical statements, and 13 refused for
  the same reason. So the ACL2 compiler took over the pipeline. Prolog stays only as the
  reference in `check.sh`.
- **Theorems about the compiler** (`acl2/compiler-theorems.lisp`):
  - The structural guards. A parse in which something is first mentioned after "then",
    inside "not", or inside "or" is refused. A text is refused if any sentence in it is.
  - **Vocabulary soundness.** For any text the compiler accepts, every function in the
    statement it produces is the meaning of a dictionary word, or one of implies, and, or,
    not, equal. The compiler can never introduce anything else, so the reviewed dictionary
    bounds what any certified sentence can mean.
- Strict audit passes.

**Learned.**
1. **Writing the suite by hand found my own mistake.** I first wrote "If A is a member of X,
   and A is not a member of Y then …", with Y new. That's the inside-"not" trap, and the
   compiler refused it. It's now a case in the suite.
2. **Stating a theorem exposed two unchecked assumptions in the code.** The compiler took
   `(int N)` on trust, so a malformed parse could have slipped any term into a statement. And
   one branch took a classifying noun's dictionary entry without checking it was there. Both
   are now checked, and the vocabulary theorem would fail without those checks.
3. **For proofs about code, close things.** Each time a proof stalled, ACL2 had unfolded
   something: a lookup into a constant table, membership in a 40-element list, or a
   definition it should have left closed. Wrapping those in their own disabled predicates, and
   stating the facts about them once, made every step go through.

**Stage 2 status.** Partly done. The compiler is in ACL2 with theorems about it. Still to do,
from the plan:
- Port the generator to ACL2.
- Prove the round trip: for the supported fragment, generating then compiling gives back
  the original theorem.
- Retire the Prolog compiler.

**Check.** All eight checks pass from clean.

## 2026-11-13: stage 2 completed, the generator in ACL2, and the round trip (meta level)

**Goal.** Finish stage 2: port the generator to ACL2, prove the round trip, retire the
originals.

**Tried.**
- **The generator and normaliser in ACL2** (`acl2/generator.lisp`), every function in logic
  mode. It's a function-for-function port of the Python, down to the error messages and the
  order in which letters are handed out. That's so the two could be compared exactly.
- **An exact comparison** on all 565 theorems tried so far (25 in round 1, 540 in
  `std/lists`), for both the normalised formula and the sentence.
- **A construct suite for the generator** (`english/tests/generator.txt`): 25 formulas, each
  with the expected sentence or refusal written by hand. It covers every grammar construct,
  the normaliser's rewrites (translated `binary-+`, a `let`, an `(if a b 'nil)`), and every
  refusal.
- **Thinking through the round-trip theorem** before starting it.

**Result.**
- **The ACL2 generator agrees with the Python one on all 565 theorems:** identical formulas,
  sentences and intended statements. It took over the pipeline, and both rounds regenerate
  byte for byte.
- **The generator's construct suite passed first time,** 25 of 25.
- **Retired:** the Prolog compiler, the Python generator and normaliser, and the test
  comparing the two compilers. They did their job: each was the reference until its ACL2
  replacement agreed with it everywhere. Keeping them would mean writing every new grammar
  construct twice. The construct suites, which state intent rather than copy an
  implementation, now carry the testing. The last versions are in the earlier zips.
- `check.sh` now takes about 3 minutes, down from 9.
- **The round-trip theorem is not proved. The plan is changed: it waits until the grammar
  settles.** The reasons:
  1. **One link is outside ACL2.** Generating then compiling goes through Attempto's parser,
     a Prolog program. A theorem can only be about a model of the parser: a function
     predicting the DRS Attempto will produce for each sentence the generator writes. The
     theorem would then say "compiling the predicted parse gives back the theorem". A check
     on every sentence would still be needed to show Attempto agrees with the prediction.
  2. **It's big, and it would be redone often.** The 237 certified sentences have 160
     distinct shapes. A proof must go through the whole compiler, including referent
     numbering, the guards and substitution of definitions. I estimate several days. Every
     construct added to the grammar would reopen it, and the grammar is still growing:
     if-then-else inside terms is the largest blocker in stage 1.
  3. **What we have already covers each sentence the reader sees.** Every certified sentence
     is a round trip that ACL2 checks: generated, parsed by Attempto itself, compiled, and
     proved identical (or equivalent) to the theorem. For those sentences this is stronger
     than the theorem would be, because it includes the real parser and not a model. What the
     theorem would add is a guarantee for sentences not yet generated. Nothing needs that
     until the system starts writing sentences nobody checks one by one.
- **What stage 2 delivers instead:** both English tools in ACL2 logic mode, so they're things
  the system can state facts about. Vocabulary soundness and the guards are proved for the
  compiler. The originals are retired. The round trip is checked on every certified sentence.

**Learned.**
1. **Porting for exact agreement is cheap insurance.** Matching error messages and letter
   order seemed fussy, but it turned "does the port work?" into a byte-for-byte diff over
   565 theorems, with nothing to judge.
2. **A theorem's cost depends on how often its subject changes.** Vocabulary soundness
   survives new words and constructs almost untouched, because it's about what the output
   can contain. The round trip is about exactly what each construct means, so every new
   construct reopens it. Prove the stable properties now and the fragile ones later.
3. **Write the expected results before running.** All 25 hand-written generator cases matched.
   That's a real result only because they were written from the rules and not pasted from
   the output.

**Next.**
- Stage 3 (a module written in ACL2 with certified sentences), or more grammar for stage 1
  first: if-then-else inside terms (17 theorems blocked by it alone) and more comparisons (12).
- The round-trip theorem, when the grammar settles. The design is a predicted DRS from the
  generator, checked against Attempto on every sentence, and a theorem that compiling the
  prediction gives back the original.

**Check.** All eight checks pass from clean.

## 2026-11-13: stage 1, round 4, more grammar (meta level)

**Goal.** Add the grammar that blocks the most theorems. Round 3's analysis named
if-then-else inside a term (17 theorems on its own) and comparisons (12).

**Tried.**
- **First, an honest list.** The analysis table in `causes.md` was stale: it still counted
  "or", "if and only if" and comparisons as missing, though round 3 added them. So I listed
  every theorem whose words are all known, with the generator's reason for refusing it.
  The real gaps were:
  - choices between values (about 32);
  - conjunctions of tests (about 8);
  - equalities between true/false values, which are "if and only if" (about 8);
  - values used as truth values (about 10).
- **The compiler already accepted every new sentence shape.** I checked first, with sample
  sentences: several sentences that aren't an equivalence, "then A and B", "A is not B",
  "Y is not Nil", and equality conditions. All the work was in the generator.
- **New in the generator:**
  - **Cases.** A choice `(if c a b)`, anywhere in a hypothesis or conclusion, splits the
    claim into one sentence assuming c and one assuming not c. Where a value is wanted,
    `(and c v)` is the choice `(if c v nil)`. Nesting is allowed, up to four sentences.
  - **Conjunctions.** "then A and B" in conclusions. In hypotheses, conjunctions are
    flattened into clauses.
  - **Equalities as tests:** "A is B", "A is not B". An equality between two tests is
    "if and only if". So are equalities with T or NIL: `(equal p t)` is p, and
    `(equal p nil)` is "not p".
  - **Truth values.** Where a test is wanted, a value V means "V is not Nil", and `(not V)`
    means "V is Nil".
  - **Tidying.** A case that assumes false or concludes true says nothing, and is dropped.
    "V is <compound term>" in a hypothesis would be read as a definition of V and substituted
    away, so it's written the other way round ("a length of X is N"). Before, it was refused.
- **Expected sentences written by hand before running:** 15 new generator cases, and all
  matched first time.

**Result.**
- **318 of 467 available theorems certified (68%), up from 237.** Round 1 is now 25 of 25.
  No previously certified theorem changed.
- **Twelve theorems compiled correctly but failed to match.** Every one contained a
  difference. The library writes `(+ n (- (len x)))`. The generator writes "a difference of
  N and P". The matcher compared the compiled statement before applying the same rewrite.
  One of these, `len-of-remove-exact`, had been failing for this reason since round 2. The
  matcher now applies the rewrite to both sides. The matcher is untrusted (ACL2 proves
  every claim), so the fix can't let anything wrong through.
- **The grammar is nearly complete for `std/lists`.** Of the 149 not certified, 130 need
  only new words. The other 19:
  - 12 contain rewriting directives (`syntaxp`), which have no meaning as a fact, so they
    should stay formal-only;
  - 3 are about `member-equal` returning a tail and not true/false;
  - 2 need "X and X", which Attempto forbids (a coordination may not refer to itself);
  - 2 are an "or" containing an "and", and "or" used as a value.
- Sentences got longer: median 29 words (was 25), longest 138. Each case is one sentence, so
  a case split reads as two or three short claims, not one long one.

**Learned.**
1. **Check the measuring instrument before trusting what it measures.** The causes table had
   been stale since round 3 and pointed at work already done. Listing the actual refusals
   took one script and showed the real gaps.
2. **A choice between values is a case split, and English handles case splits well.**
   "If X is a pair then the head of Z is the head of X. If X is not a pair then …" is how a
   person would explain `car-of-append`.
3. **The compiler is the stable part.** Every new construct this round needed only the
   generator. That supports deferring the round-trip theorem: the compiler's meaning barely
   moved while the grammar grew a lot.
4. **A failing match can hide a near-miss.** All twelve "compiled but not identical" cases
   were correct, and the bug was in the matcher. It's worth reading each one and not
   counting them as failures.

**Next.** Words: `zp` (17 theorems on its own), `all-equalp` (11), `intersectp-equal` (9),
`resize-list` (6). Each needs a dictionary entry with checked examples, which is the slow,
careful part.

**Check.** All eight checks pass from clean.


## 2026-11-14: direction review and stage 3 plan (meta level)

### Goal

The session decided the direction of the project after stage 2 and planned stage 3.

### Considerations

- The sentences certified in stage 1 are correct but stiff, with a median of 29 words, a longest
  text of 138 words, and vocabulary taken from ACL2 function names. Most of the stiffness comes
  from core ACE, which has no definite article for result nouns and is subject to the bracketing
  trap, rather than from the method.
- The round trip shows that the generator and the compiler agree. It does not show that the
  compiler follows ACE's semantics, and a misreading shared by both would pass.
- The planted check covers the identity route but not the equivalence route.
- ACL2 is a large prover without a small kernel. Improving its reliability directly is work on
  the scale of a research programme (compare Milawa), whereas reducing and auditing what is
  relied upon is feasible.
- ACL2's first-order logic matches the first-order semantics of ACE. This favours ACL2 as the
  setting in which to develop the method, although the method itself does not depend on ACL2.

### Decisions

1. ACL2 is used unmodified (PLAN.md, Rule 10).
2. The logic remains first-order. A surface grammar is added above core ACE and rewritten into
   it, and the rewriting is part of the trusted base.
3. The compiler is checked against APE's own first-order translation (`-solo tptp`) by an
   independent first-order prover.
4. The subject of stage 3 is the project's own compiler, and the measure is the quality of
   sentences rather than coverage.
5. A concordance binds design documents to certified sentences in two directions: the agent
   offers certified sentences, and a reader requests assurances, each of which ends certified,
   refuted with a counterexample, or open.
6. Stage 3 begins with a one-week gate, in which ten target sentences are written before any
   grammar work.
7. Publication is planned through the ACL2 community books and the ACL2 Workshop.

### Defects found

The generator writes "an union". The compiler construct suite names two cases `equality-kept`,
so one of them is never checked. Both are scheduled in PLAN.md, section 3.1.

### Check

The check was not run, because only documentation changed.

### Next

Stage 3.0 is next: the subject functions are to be selected and `stage3/targets.md` written.
