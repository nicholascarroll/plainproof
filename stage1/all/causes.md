# Why theorems don't certify yet

Of 540 theorem names found in `std/lists/*.lisp`:

- **318 certified.**
- **73 not available** after including `std/lists/top`: local lemmas, or books that `top` doesn't include.
- **149 not yet certified.** Of these:
  - 130 need only new words
  - 6 need only new grammar
  - 6 need both
  - 7 have all their words and grammar, and fail for another reason (see the report)

## Grammar, by how many theorems need it

| Construct | Needed by | Would unlock on its own |
|---|---|---|
| quoted constants | 12 | 0 |
| syntaxp: a rewriting directive with no meaning as a fact | 12 | 0 |

## Words, by how many theorems need them

'Would unlock on its own' counts theorems where this word is the only thing missing.

| ACL2 function | Needed by | Would unlock on its own |
|---|---|---|
| `zp` | 22 | 17 |
| `all-equalp` | 12 | 11 |
| `intersectp-equal` | 11 | 9 |
| `acl2-count` | 8 | 5 |
| `element-fix` | 8 | 1 |
| `hons-remove-duplicates` | 7 | 5 |
| `resize-list` | 7 | 6 |
| `subseq-list` | 6 | 4 |
| `duplicity-badguy1` | 6 | 6 |
| `element-equiv` | 5 | 0 |
| `element-p` | 5 | 0 |
| `remove1-equal` | 4 | 3 |
| `duplicity-badguy` | 4 | 4 |
| `index-of-aux` | 4 | 0 |
| `element-list-final-cdr-p` | 3 | 2 |
| `stringp` | 3 | 3 |
| `add-to-set-equal` | 3 | 3 |
| `integerp` | 3 | 2 |
| `outelement-list-final-cdr-p` | 3 | 2 |
| `posp` | 2 | 0 |
| `duplicity-hyp` | 2 | 0 |
| `duplicity-lhs` | 2 | 0 |
| `duplicity-rhs` | 2 | 0 |
| `equal-by-nths-hyp` | 2 | 0 |
| `equal-by-nths-lhs` | 2 | 0 |
| `equal-by-nths-rhs` | 2 | 0 |
| `intersectp-witness` | 2 | 0 |
| `make-list-ac` | 2 | 2 |
| `outelement-list-p` | 2 | 1 |
| `outelement-p` | 2 | 0 |
| `set-unequal-witness` | 2 | 1 |
| `subsetp-witness` | 2 | 1 |
| `acl2-numberp` | 1 | 1 |
| `assoc-equal` | 1 | 0 |
| `duplicity-exec` | 1 | 1 |
| `element-example` | 1 | 0 |
| `case-split` | 1 | 1 |
| `acons` | 1 | 1 |
| `hons-acons` | 1 | 1 |
| `fast-alist-fork` | 1 | 1 |

## Failing for another reason

- `cancel-append-self-under-set-equiv`: rejected by compiler: unparsed
- `index-of-append-split`: unsupported: no word for the function or
- `member-of-car`: unsupported: an equality between two tests needs 'if and only if'
- `member-of-cons`: unsupported: an equality between two tests needs 'if and only if'
- `member-of-repeat`: unsupported: an equality between two tests needs 'if and only if'
- `prefixp-of-append-arg2`: unsupported: hypothesis or conclusion (AND (EQUAL (TRUE-LIST-FIX Y) (TAKE (LEN Y) X)) (PREFIXP (NTHCDR (LEN Y) X) Z)) is not a test on one term
- `set-difference-equal-of-self`: rejected by compiler: unparsed
