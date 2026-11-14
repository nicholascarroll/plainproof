# Certified English for ACL2: project plan

*A hobby project with a slim chance of becoming something more. Working name: Plain Proof.*

## Core concept

The project builds a controlled-English layer over ACL2 in which every sentence is certified:
the sentence states exactly what a proved theorem states, and the correspondence is checked
mechanically. Theorems written in plain English are thereby known to be true. This is of most
value where an agentic AI writes most of the code and develops the theorems in ACL2, and people
review the English.

ACL2 is used unmodified. The work of the project is the English layer: its vocabulary, its
grammar, and the tools that relate English to ACL2.

## Goals

1. A dictionary maps words to ACL2 functions. Each entry has a one-line meaning, checked
   examples, provenance and a version.
2. The grammar has two parts: a core fragment of Attempto Controlled English (ACE), and a
   surface grammar above it that reads as technical prose.
3. A compiler translates English to ACL2, and a generator translates ACL2 to English. A sentence
   is certified when generating and compiling it returns exactly the original theorem.
4. A corpus of certified sentences is searchable by people and by the agent. It begins with
   ACL2's standard libraries.
5. Programs are written in ACL2 from small functions, each carrying certified sentences, and run
   at compiled-Lisp speed.
6. A concordance binds statements in a design document to the certified sentences that support
   them.
7. One command rechecks everything from scratch and prints PASS or FAIL for each check.

## Architecture

```
   design document (prose)          architect, analyst
          |                                 |
          |  each assured statement   asks for assurances,
          |  cites certified sentences   reads the English
          v                                 |
   +------------------------------------------v-----+
   |  English layer                                 |
   |    surface grammar  -> core ACE (rewriting)    |
   |    Attempto parser (APE, pinned fork)          |
   |    dictionary: word -> ACL2 function,          |
   |      meaning, examples, provenance, version    |
   |    compiler: DRS -> ACL2                       |
   |    generator: ACL2 -> English                  |
   +----------+-------------------------------------+
              |  certified only if the round trip is exact
   +----------v-------------------------------------+
   |  ACL2 (unmodified)                             |
   |    library and program definitions             |
   |    claims (generated, no hints, not rules)     |
   |    proof support (lemmas, kept separate)       |
   +----------+-------------------------------------+
              |
           check: certify from clean, strict audit,
           round trip, non-vacuity, planted bugs
```

The object level comprises programs and their claims; the meta level comprises the tools that
check them. From stage 3 the tools are also a subject: the compiler is treated as an object-level
program, and claims about it are checked by a version of the tools fixed before the work began
(Rule 7). Each work session addresses one level and is labelled accordingly.

### The dictionary entry

Each word has exactly one meaning in each dictionary version.

| Field | Example |
|---|---|
| Word and class | `append`: result noun, two arguments ("an append of X and Y") |
| ACL2 function | `append` |
| Meaning, one line | the elements of X followed by Y |
| Examples, checked at certification | append of (1 2) and (3) is (1 2 3) |
| Provenance | ACL2 primitive / library definition / reference definition / decision-log entry |
| Version | the dictionary version that introduced it |

Word classes and their logical meaning:

| Class | Meaning in ACL2 | Example |
|---|---|---|
| Classifying noun | a type check | "a natural number X" |
| Result noun | a function | "Y is a reverse of X" |
| Adjective | a test on one value | "X is sorted" |
| Comparison | a test on two values | "Y is as long as X" |
| Transitive verb | a relation | "X contains Y" |
| Preposition (stage 3) | an argument role | "the removal of A from X" |
| Action verb (later) | relates a state before and a state after | "inserting X into S gives T" |

### Reference definitions

Reference definitions turn claims about behaviour into claims about intent.

- The reference version of a concept is short, slow and evidently correct, and serves as the
  dictionary meaning. For example, "an occurrence of P in S" is defined by checking every
  position.
- The fast version is the one that programs use.
- A certified sentence ties the two together: "Every result of the fast search is an
  occurrence, and every occurrence is a result of the fast search."

People review the reference definitions. The proofs hold the fast code to them.

## Rules

1. The agent proposes and ACL2 decides. Nothing enters the corpus unless it is proved and its
   round trip is exact.
2. A word is defined only from words already in the dictionary. ACL2 enforces this order.
3. Each word has exactly one meaning. Where two meanings are needed, there are two words, and
   the difference between them becomes a claim. The rule applies to function words in the
   surface grammar as well as to content words (see 3.2).
4. Every claim is stored with `:rule-classes nil`, so that claims cannot assist each other's
   proofs.
5. The strict audit admits no skipped proofs, axioms or trust tags anywhere in the include tree.
6. Every claim is shown to have consequences and to be non-vacuous. A planted bug shows what the
   claim excludes, and a count of test inputs shows that its conditions occur.
7. No tool checks itself while it is being changed. A new compiler or generator takes over only
   after exact agreement with its predecessor on the whole corpus.
8. Each claim cites the dictionary version against which it was compiled.
9. Contested words are entered in the decision log, with agreed cases, open cases, the decision,
   its author and its date.
10. ACL2 is not modified. Trust is improved by reducing and auditing what is relied upon, not by
    changing the prover.

## Stages

Each stage is small, has a measurable result, and ends with a decision to continue or stop.

### Stage 0: Toolchain (complete)

ACL2, SBCL and APE are pinned. APE is frozen at ACE 6.7, and a fork is kept. The repository,
the notebook, and a `check` script running certification and the strict audit were created.
The stage was complete when `check` passed on an empty corpus and on one hand-written claim.

### Stage 1: ACL2 to English on `std/lists` (complete, four rounds)

1. Twenty-five theorems were chosen by hand: lengths, appends, reverses and membership.
2. A generator from theorem to Attempto was written, using the dictionary in reverse.
3. Each generated sentence was compiled and compared with the original.
4. Grammar was added only when a theorem required it.
5. All available theorems were attempted, and every failure was recorded by cause.

Of 467 available theorems, 318 are certified. Of the remainder, 130 require only new words.
Details are in `stage1/all/`.

### Stage 2: The English tools in ACL2 (complete)

The compiler and generator were ported to ACL2 logic mode, and the originals retired after exact
agreement. Vocabulary soundness and the structural guards are proved for the compiler.

The general round-trip theorem is deferred until the grammar stabilises, which is a deviation
from the original plan. Each certified sentence is an individually checked round trip
(NOTEBOOK.md, 2026-11-13).

### Stage 3: Readable English, self-description and the concordance

#### Objective

Stage 3 is to show that certified sentences can read as careful technical prose reads, on a
subject of genuine interest, and that a design document can be bound to them.

#### Scope

- ACL2 is used unmodified (Rule 10).
- The logic remains first-order. Expressiveness is added to the surface language only.
- The subject is the project's own English tools. Their functions operate on lists and so
  largely use the existing vocabulary. The `std/lists` vocabulary is extended only where the
  subject requires it.
- The measure is the quality of sentences, not coverage.

#### 3.0 Gate (one week)

1. A small set of functions from `acl2/compiler.lisp` is selected as the subject. The
   candidates are `pp-subst`, `flatten-conds` and `substitute-definitions`.
2. Before any grammar work, ten target sentences about the subject are written in the register of
   a technical text and recorded in `stage3/targets.md`.
3. For each target, the constructs it requires beyond the current grammar are listed.

Work continues if most targets are reachable with the constructs in 3.2. Otherwise the finding
is recorded and the project stops.

#### 3.1 Preliminaries

- The generator writes "an union" in 7 sentences. The article becomes a field of the dictionary
  entry rather than a spelling rule.
- Only the identity route has a planted check. A planted claim strictly weaker than its library
  theorem must also fail to certify by the equivalence route.
- `english/tests/constructs.txt` names two cases `equality-kept`. The runner keys cases by name,
  so the first is never checked. The case is renamed, and the runner refuses duplicate names.
- Rule 6 is applied to every stage 3 claim: planted bugs and counts of test inputs.
- Rule 8 is implemented: the dictionary gains version and provenance fields, and each claim
  records its version.
- Review cards show the meaning of every word a sentence uses.

#### 3.2 Surface grammar

The constructs are listed in order of priority.

| Construct | Surface form | Core ACE |
|---|---|---|
| Definite article on result nouns | "the length of X" | "a length of X" |
| Possessive | "X's length" | "a length of X" |
| Argument role by preposition | "the removal of A from X" | "a removal of A and X" |
| Distributive plural | "the sum of the lengths of X and Y" | named intermediates |

The definite article is admissible before a result noun because a result noun denotes a
function, so its value is unique. In core ACE, "the" refers back to something already
mentioned. To keep one meaning per word (Rule 3), the surface grammar admits "the" only before a
result noun with an "of" phrase, and refuses it elsewhere; anaphoric "the" is not part of the
surface language. APE supports the possessive (Saxon genitive). Whether it accepts a variable as
possessor is to be tested first.

The rewriting from surface to core ACE determines what a sentence means, and is therefore part
of the trusted base, together with the compiler. It is implemented in ACL2 logic mode.
Vocabulary soundness is extended to cover it, and it has a construct suite with hand-written
expected core sentences. The generator emits surface forms. Certification is unchanged: the
surface sentence is rewritten into core ACE, parsed into a DRS and compiled into ACL2, and the
result must be the original theorem.

The rewriting is either an extension of the grammar in the APE fork (option A) or a rewriting
step in ACL2 before parsing (option B). Option B is the default. Option A is used only for
constructs that ACE already supports, such as the possessive. The choice is recorded in the
notebook.

Two measures are recorded: words per text and named intermediates per text, both on the targets
and on the `std/lists` corpus. The number of certified `std/lists` theorems must not fall.

#### 3.3 Compiler faithfulness

The round trip shows that the generator and the compiler agree. It does not show that the
compiler reads a DRS as ACE's semantics prescribe, and a misreading shared by both would pass.
The compiler is therefore checked against APE's own translation.

- For each certified sentence, APE's first-order translation is obtained with `-solo tptp`.
- The compiled statement is translated to TPTP, a functionality axiom is added for each result
  noun, and an independent first-order prover, such as E or Vampire, shows the two equivalent.
- A planted miscompilation must be refused.

#### 3.4 The subject module

- Reference definitions are written where a function has no evidently correct counterpart.
- The ten targets are certified, each as written or with a recorded deviation.
- Every claim has planted bugs and counts of test inputs.
- After a change to a function, `check` reports in English which sentences have ceased to hold.
  This report is the semantic diff.

#### 3.5 Concordance prototype

The concordance has three layers: a design document in prose, the certified sentences it cites,
and the ACL2 statements they compile to.

- Each assured statement in the document cites sentence identifiers, and `check` fails when a
  cited sentence is no longer certified.
- In one direction, the agent proposes certified sentences about a module, from which the author
  of the document selects.
- In the other direction, a reader asks a question such as "Is X always Y?". The agent drafts a
  candidate sentence, which is compiled, tested on inputs and then attempted as a proof. The
  outcome is that the sentence is certified, that it is refused with a concrete counterexample
  reported in the document, or that it remains open.
- The document lists what is not claimed: the functions of the module that have no certified
  sentence.

The second direction counters the tendency of the first toward what is easy to prove.

#### Completion

Stage 3 is complete when:

- the gate has passed and its result is recorded;
- the ten targets are certified, each as written or with a recorded deviation;
- the number of certified `std/lists` theorems has not fallen;
- the compiler agrees with APE's first-order translation on every certified sentence, and a
  planted miscompilation is refused;
- a design document for the subject module cites certified sentences, and `check` reports a
  planted code change as a broken assurance.

Stage 3 excludes changes to ACL2, vocabulary added for coverage alone, higher-order logic, and
the replacement of APE.

### Stage 4: An outside user

The subject is a small rules calculator, for example a simplified tax offset or benefit rule.
Its rules are ACL2 functions, and its terms are dictionary words in the vocabulary of the
domain. It has a concordance: a design document whose assurances cite certified sentences, a
computed list of what is not claimed, and the decision log for contested terms such as "income
for a period". A `check` command that anyone can run accompanies it.

Where another implementation of the same rules exists, for example an OpenFisca model, the ACL2
version is tested against it. Each disagreement is a bug or an ambiguity in the rules.

The stage is complete when someone other than the author reproduces every PASS line.

## Publication

The certified books are to be offered to the ACL2 community books. For that, they must stand
alone: the dependency on SWI-Prolog and APE is confined to regeneration, or replaced by a parser
for the fragment written in ACL2.

The method, comprising certified controlled English, the round trip and the concordance, is to
be described in a paper for the ACL2 Workshop.

The method does not depend on ACL2. Its application to the first-order fragment of another
prover is left to a later note.

## How the agent works

The agent follows the same sequence for every task.

1. It proposes a definition, a claim in English, or a grammar rule.
2. It compiles the proposal and shows the review card: the English, Attempto's reading, the
   ACL2 statement and the meanings of the words used.
3. It tests the claim on inputs. A false claim is found in seconds, before any proof attempt.
4. It proves the claim, adding lemmas only to the proof-support books.
5. It records the count of test inputs satisfying the conditions, runs the planted bugs, and
   runs the full `check`.
6. It records the outcome in the notebook, including failures and their causes.

When answering questions, the agent cites certified sentences and labels anything else as tested
or unproved. A new statement that combines certified sentences is compiled and proved before it
is offered as certified.

## Notes

### Attempto

- In core ACE, "the X" refers back to an X already mentioned. Claims therefore write "a string
  X" and refer back to "X". The surface grammar admits "the" before result nouns (3.2).
- Result nouns compile to functions: "Y is an upcase of X" becomes `(equal y (upcase x))`.
  Because the noun is functional, "there is a Y" in a conclusion can be eliminated soundly.
- The lexicon file is always passed, and guessing of unknown words is disabled, so that an
  unknown word is an error.
- The paraphrase is read for every sentence. "Something X1" means that the parser assumed no
  type, which may be intended or may indicate a missing word.

### Process

- A false claim found by testing costs seconds; one found by a failed proof costs an hour.
  Claims are therefore tested before proof is attempted.
- Every comparison has its own planted failure, to show that it can fail.
- Check scripts are linear in the number of failures.

## References

- ACL2: https://www.cs.utexas.edu/~moore/acl2/ (BSD-style licence)
- Attempto Controlled English and APE: http://attempto.ifi.uzh.ch and https://github.com/Attempto/APE
- ACE in Grammatical Framework: https://www.grammaticalframework.org
- Milawa: Jared Davis, *A Self-Verifying Theorem Prover*, PhD thesis, University of Texas, 2009.
  Myreen and Davis, *The Reflective Milawa Theorem Prover is Sound (Down to the Machine Code
  that Runs It)*, ITP 2014
- Lakatos, *Proofs and Refutations*, 1976
