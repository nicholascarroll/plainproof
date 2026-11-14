# Stage 1 report

**318 of 540 theorems certified.** Certified means: the English compiles to a statement that is identical to the library theorem, up to the names of variables. The match is found here, and confirmed inside ACL2 when `acl2/stage1-all-claims.lisp` certifies, which also proves each claim.

| Theorem | English | Result |
|---|---|---|
| `acl2-count-of-car` |  | not found or not a single theorem |
| `acl2-count-of-cdr` |  | not found or not a single theorem |
| `acl2-count-of-cdr-weak` |  | not found or not a single theorem |
| `acl2-count-of-cons-greater` |  | not found or not a single theorem |
| `acl2-count-of-consp-positive` |  | not found or not a single theorem |
| `acl2-count-of-hons-remove-duplicates` |  | unsupported: no word for the function acl2-count |
| `acl2-count-of-nth-linear` |  | unsupported: no word for the function acl2-count |
| `acl2-count-of-nth-linear-weak` |  | unsupported: no word for the function acl2-count |
| `acl2-count-of-nth-rewrite` |  | unsupported: no word for the function acl2-count |
| `acl2-count-of-nthcdr-linear` |  | unsupported: no word for the test zp |
| `acl2-count-of-nthcdr-linear-weak` |  | unsupported: no word for the function acl2-count |
| `acl2-count-of-nthcdr-rewrite` |  | unsupported: no word for the function acl2-count |
| `acl2-count-of-sum` |  | not found or not a single theorem |
| `acl2-count-when-member` |  | unsupported: no word for the function acl2-count |
| `acl2-numberp-of-listpos` |  | unsupported: an equality between two tests needs 'if and only if' |
| `all-equalp-by-superset` |  | unsupported: hypothesis or conclusion (ALL-EQUALP A Y) is not a test on one term |
| `all-equalp-of-append` |  | unsupported: hypothesis or conclusion (ALL-EQUALP A X) is not a test on one term |
| `all-equalp-of-cdr-when-all-equalp` |  | unsupported: hypothesis or conclusion (ALL-EQUALP A X) is not a test on one term |
| `all-equalp-of-cons` |  | unsupported: no word for the function all-equalp |
| `all-equalp-of-list-fix` |  | unsupported: no word for the function all-equalp |
| `all-equalp-of-nthcdr` |  | unsupported: hypothesis or conclusion (ALL-EQUALP A X) is not a test on one term |
| `all-equalp-of-repeat` |  | unsupported: no word for the function all-equalp |
| `all-equalp-of-rev` |  | unsupported: no word for the function all-equalp |
| `all-equalp-of-take` |  | unsupported: hypothesis or conclusion (ALL-EQUALP A X) is not a test on one term |
| `all-equalp-when-atom` |  | unsupported: hypothesis or conclusion (ALL-EQUALP A X) is not a test on one term |
| `append-atom-under-list-equiv` | If Z is an append of X and Y, and Y is atomic then Z is list-equivalent-to X. | CERTIFIED |
| `append-nonempty-list` |  | not found or not a single theorem |
| `append-of-cons` | If Z is a cons of A and X, and U is an append of Z and Y, and V is an append of X and Y then U is a cons of A and V. | CERTIFIED |
| `append-of-nil` | If Y is an append of X and Nil then Y is a list-fix of X. | CERTIFIED |
| `append-of-rcons` | If Z is a rcons of A and X, and U is an append of Z and Y, and V is a cons of A and Y then U is an append of X and V. | CERTIFIED |
| `append-of-repeat-to-cons-of-same` | If Y is a repeat of N and A, and Z is a cons of A and X, and U is an append of Y and X then an append of Y and Z is a cons of A and U. | CERTIFIED |
| `append-of-take-and-nthcdr` | If Y is a take of N and X, and Z is an nthcdr of N and X, and a length of X is not smaller than a natural-value of N then an append of Y and Z is X. | CERTIFIED |
| `append-self-onto-final-cdr` | If Y is a final-cdr of X then an append of X and Y is X. | CERTIFIED |
| `append-singleton-under-set-equiv` | If Z is a cons of A and Nil, and Y is an append of X and Z then Y is set-equivalent-to a cons of A and X. | CERTIFIED |
| `append-under-iff` | If Z is an append of X and Y, and Z is not Nil then X is a pair or Y is not Nil. If Z is an append of X and Y, and X is a pair or Y is not Nil then Z is not Nil. | CERTIFIED (equivalent) |
| `append-update-nth` |  | not found or not a single theorem |
| `append-when-not-consp` | If Z is an append of X and Y, and X is not a pair then Z is Y. | CERTIFIED |
| `assoc-equal-of-remove1-equal` |  | unsupported: no word for the function assoc-equal |
| `associativity-of-append` | If X is an append of A and B, and Y is an append of X and C, and Z is an append of B and C then Y is an append of A and Z. | CERTIFIED |
| `butlast-redefinition` |  | not found or not a single theorem |
| `cancel-append-self-2-under-set-equiv` | If Z is an append of X and Y then an append of X and Z is set-equivalent-to Z. | CERTIFIED |
| `cancel-append-self-under-set-equiv` | If Y is an append of X and X then Y is set-equivalent-to X. | rejected by compiler: unparsed |
| `car-of-append` | If Z is an append of X and Y, and X is a pair then a head of Z is a head of X. If Z is an append of X and Y, and X is not a pair then a head of Z is a head of Y. | CERTIFIED (equivalent) |
| `car-of-append-when-consp` | If Z is an append of X and Y, and X is a pair then a head of Z is a head of X. | CERTIFIED |
| `car-of-list-fix` | If Y is a list-fix of X then a head of Y is a head of X. | CERTIFIED |
| `car-of-nthcdr` | If Y is an nthcdr of I and X then a head of Y is an nth of I and X. | CERTIFIED |
| `car-of-repeat-increment` | If Z is a sum of 1 and N, and Y is a repeat of Z and X, and N is natural then a head of Y is X. | CERTIFIED |
| `car-of-take` | If Y is a take of N and X, and a natural-value of N is not smaller than 1 then a head of Y is a head of X. | CERTIFIED |
| `car-of-update-nth` |  | unsupported: no word for the test zp |
| `car-when-all-equalp` |  | unsupported: hypothesis or conclusion (ALL-EQUALP A X) is not a test on one term |
| `cdr-of-append` | If Z is an append of X and Y, and U is a tail of X, and X is a pair then a tail of Z is an append of U and Y. If Z is an append of X and Y, and X is not a pair then a tail of Z is a tail of Y. | CERTIFIED (equivalent) |
| `cdr-of-append-when-consp` | If Z is an append of X and Y, and U is a tail of X, and X is a pair then a tail of Z is an append of U and Y. | CERTIFIED |
| `cdr-of-list-fix` | If Y is a list-fix of X then a tail of Y is a list-fix of a tail of X. | CERTIFIED |
| `cdr-of-repeat-increment` | If Z is a sum of 1 and N, and Y is a repeat of Z and X, and N is natural then a tail of Y is a repeat of N and X. | CERTIFIED |
| `cdr-of-update-nth` |  | unsupported: no word for the test zp |
| `commutativity-2-of-append-under-set-equiv` | If V is an append of Y and Z, and U is an append of X and V, and W is an append of X and Z then U is set-equivalent-to an append of Y and W. | CERTIFIED |
| `commutativity-2-of-append-under-set-equiv-corollary-1` | If U is a cons of X and Z, and Y is set-equivalent-to a cons of W and Z then a cons of W and U is set-equivalent-to a cons of X and Y. | CERTIFIED |
| `commutativity-2-of-append-under-set-equiv-corollary-2` | If U is a tail of Y, and Z is a cons of X and U, and V is a head of Y, and Y is a pair then a cons of V and Z is set-equivalent-to a cons of X and Y. | CERTIFIED |
| `commutativity-of-append-under-set-equiv` | If Z is an append of X and Y then Z is set-equivalent-to an append of Y and X. | CERTIFIED |
| `cons-under-set-equiv-1` | If Z is a cons of X and Y then a cons of X and Z is set-equivalent-to Z. | CERTIFIED |
| `consp-by-len` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (QUOTEP N))) (QUOTE (IF (QUOTEP N) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `consp-of-append` | If an append of X and Y is a pair then X is a pair or Y is a pair. If Z is an append of X and Y, and X is a pair or Y is a pair then Z is a pair. | CERTIFIED (equivalent) |
| `consp-of-cdddr-by-len` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (QUOTEP N))) (QUOTE (IF (QUOTEP N) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `consp-of-cddr-by-len` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (QUOTEP N))) (QUOTE (IF (QUOTEP N) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `consp-of-cdr-by-len` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (QUOTEP N))) (QUOTE (IF (QUOTEP N) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `consp-of-intersection$` |  | unsupported: an equality between two tests needs 'if and only if' |
| `consp-of-last` | If a last-pair of L is a pair then L is a pair. If L is a pair then a last-pair of L is a pair. | CERTIFIED (equivalent) |
| `consp-of-list-fix` | If a list-fix of X is a pair then X is a pair. If X is a pair then a list-fix of X is a pair. | CERTIFIED (equivalent) |
| `consp-of-nthcdr` | If an nthcdr of N and X is a pair then a natural-value of N is smaller than a length of X. If a natural-value of N is smaller than a length of X then an nthcdr of N and X is a pair. | CERTIFIED (equivalent) |
| `consp-of-remove` | If Y is a cons of A and Nil, and a removal of A and X is a pair then X is not a subset of Y. If Y is a removal of A and X, and Z is a cons of A and Nil, and X is not a subset of Z then Y is a pair. | CERTIFIED (equivalent) |
| `consp-of-remove-duplicates-equal` | If a deduplication of X is a pair then X is a pair. If X is a pair then a deduplication of X is a pair. | CERTIFIED (equivalent) |
| `consp-of-repeat` |  | unsupported: no word for the test zp |
| `consp-of-rev` | If a reversal of X is a pair then X is a pair. If X is a pair then a reversal of X is a pair. | CERTIFIED (equivalent) |
| `consp-of-revappend` | If a revappend of X and Y is a pair then X is a pair or Y is a pair. If Z is a revappend of X and Y, and X is a pair or Y is a pair then Z is a pair. | CERTIFIED (equivalent) |
| `consp-of-subseq-list` |  | unsupported: an equality between two tests needs 'if and only if' |
| `consp-of-take` |  | unsupported: no word for the test zp |
| `consp-under-iff-when-true-listp` | If X is a true-list, and X is a pair then X is not Nil. If X is a true-list, and X is not Nil then X is a pair. | CERTIFIED (equivalent) |
| `constraint` |  | not found or not a single theorem |
| `duplicity-badguy-exists` |  | unsupported: no word for the test duplicity-badguy |
| `duplicity-badguy-has-high-duplicity` |  | unsupported: no word for the test duplicity-badguy |
| `duplicity-badguy-is-complete` |  | unsupported: no word for the test duplicity-badguy |
| `duplicity-badguy-under-iff` |  | unsupported: no word for the test duplicity-badguy |
| `duplicity-badguy1-exists-in-dom` |  | unsupported: hypothesis or conclusion (DUPLICITY-BADGUY1 DOM X) is not a test on one term |
| `duplicity-badguy1-exists-in-list` |  | unsupported: hypothesis or conclusion (DUPLICITY-BADGUY1 DOM X) is not a test on one term |
| `duplicity-badguy1-has-high-duplicity` |  | unsupported: hypothesis or conclusion (DUPLICITY-BADGUY1 DOM X) is not a test on one term |
| `duplicity-badguy1-is-complete-for-domain` |  | unsupported: hypothesis or conclusion (DUPLICITY-BADGUY1 DOM X) is not a test on one term |
| `duplicity-badguy1-need-only-consider-the-list` |  | unsupported: hypothesis or conclusion (DUPLICITY-BADGUY1 DOM X) is not a test on one term |
| `duplicity-constraint` |  | unsupported: hypothesis or conclusion (DUPLICITY-HYP) is not a test on one term |
| `duplicity-exec-removal` |  | unsupported: no word for the function duplicity-exec |
| `duplicity-in-of-hons-remove-duplicates` |  | unsupported: no word for the function hons-remove-duplicates |
| `duplicity-in-of-remove-duplicates-equal` | If Y is a deduplication of X, and A is a member of X then a duplicity of A and Y is 1. If Z is a deduplication of X, and Y is a duplicity of A and Z, and A is not a member of X then Y is 0. | CERTIFIED (equivalent) |
| `duplicity-of-append` | If U is an append of X and Y, and Z is a duplicity of A and U, and V is a duplicity of A and X, and W is a duplicity of A and Y then Z is a sum of V and W. | CERTIFIED |
| `duplicity-of-cons` | If Y is a cons of B and X, and Z is a duplicity of A and X, and A is B then a duplicity of A and Y is a sum of 1 and Z. If Z is a cons of B and X, and Y is a duplicity of A and Z, and A is not B then Y is a duplicity of A and X. | CERTIFIED (equivalent) |
| `duplicity-of-flatten-of-rev` | If Z is a flattening of a reversal of X, and Y is a duplicity of A and Z, and U is a flattening of X then Y is a duplicity of A and U. | CERTIFIED |
| `duplicity-of-list-fix` | If Z is a list-fix of X, and Y is a duplicity of A and Z then Y is a duplicity of A and X. | CERTIFIED |
| `duplicity-of-remove` | If Y is a removal of B and X, and A is B then a duplicity of A and Y is 0. If Z is a removal of B and X, and Y is a duplicity of A and Z, and A is not B then Y is a duplicity of A and X. | CERTIFIED (equivalent) |
| `duplicity-of-rev` | If Z is a reversal of X, and Y is a duplicity of A and Z then Y is a duplicity of A and X. | CERTIFIED |
| `duplicity-of-revappend` | If U is a revappend of X and Y, and Z is a duplicity of A and U, and V is a duplicity of A and X, and W is a duplicity of A and Y then Z is a sum of V and W. | CERTIFIED |
| `duplicity-of-reverse` | If Z is a reverse of X, and Y is a duplicity of A and Z then Y is a duplicity of A and X. | CERTIFIED |
| `duplicity-when-member-equal` | If A is a member of X then 0 is smaller than a duplicity of A and X. | CERTIFIED |
| `duplicity-when-non-member-equal` | If Y is a duplicity of A and X, and A is not a member of X then Y is 0. | CERTIFIED |
| `duplicity-when-not-consp` | If Y is a duplicity of A and X, and X is not a pair then Y is 0. | CERTIFIED |
| `duplicity-zero-to-member-equal` | If 0 is a duplicity of A and X then A is not a member of X. If Y is a duplicity of A and X, and A is not a member of X then 0 is Y. | CERTIFIED (equivalent) |
| `element-equiv-of-element-fix-1-forward` |  | unsupported: hypothesis or conclusion (ELEMENT-EQUIV (ELEMENT-FIX X) Y) is not a test on one term |
| `element-equiv-of-element-fix-2-forward` |  | unsupported: hypothesis or conclusion (ELEMENT-EQUIV X (ELEMENT-FIX Y)) is not a test on one term |
| `element-fix-idempotent` |  | unsupported: no word for the function element-fix |
| `element-fix-under-element-equiv` |  | unsupported: hypothesis or conclusion (ELEMENT-EQUIV (ELEMENT-FIX X) X) is not a test on one term |
| `element-fix-when-element-p` |  | unsupported: no word for the test element-p |
| `element-list-final-cdr-p-of-nil` |  | unsupported: no word for the test element-list-final-cdr-p |
| `element-list-final-cdr-p-rewrite` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (AND (NOT (EQUAL X (QUOTE (QUOTE T)))) (NOT (EQUAL X (QUOTE (QUOTE NIL))))))) (QUOTE (IF (IF (NOT (EQUAL X (QUOTE (QUOTE T)))) (NOT (EQUAL X (QUOTE (QUOTE NIL)))) (QUOTE NIL)) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `element-list-final-cdr-p-type` |  | unsupported: no word for the function element-list-final-cdr-p |
| `element-list-p-of-take-nil` |  | not found or not a single theorem |
| `element-p-of-element-fix` |  | unsupported: no word for the test element-p |
| `empty-intersect-with-difference-of-self` |  | unsupported: hypothesis or conclusion (INTERSECTP-EQUAL A @X) is not a test on one term |
| `equal-by-nths` |  | unsupported: hypothesis or conclusion (EQUAL-BY-NTHS-HYP) is not a test on one term |
| `equal-by-nths-constraint` |  | unsupported: hypothesis or conclusion (EQUAL-BY-NTHS-HYP) is not a test on one term |
| `equal-final-cdr-nil` | If a final-cdr of X is Nil then X is a true-list. If X is a true-list then a final-cdr of X is Nil. | CERTIFIED (equivalent) |
| `equal-len-0` |  | not found or not a single theorem |
| `equal-of-append-and-append-same-arg2` | If an append of X and Y is an append of Z and Y then a list-fix of X is a list-fix of Z. If U is an append of X and Y, and a list-fix of X is a list-fix of Z then U is an append of Z and Y. | CERTIFIED (equivalent) |
| `equal-of-append-repeat` |  | unsupported: no word for the test case-split |
| `equal-of-booleans-to-iff` |  | not found or not a single theorem |
| `equal-of-element-fix-1-forward-to-element-equiv` |  | unsupported: no word for the function element-fix |
| `equal-of-element-fix-2-forward-to-element-equiv` |  | unsupported: no word for the function element-fix |
| `equal-of-final-cdr-and-self` | If X is a final-cdr of X then X is atomic. If X is atomic then X is a final-cdr of X. | CERTIFIED (equivalent) |
| `equal-of-list-fix-and-self` | If X is a list-fix of X then X is a true-list. If X is a true-list then X is a list-fix of X. | CERTIFIED (equivalent) |
| `equal-of-resize-list-and-self` |  | unsupported: no word for the function resize-list |
| `equal-of-rev-and-rev` | If a reversal of X is a reversal of Y then a list-fix of X is a list-fix of Y. If a list-fix of X is a list-fix of Y then a reversal of X is a reversal of Y. | CERTIFIED (equivalent) |
| `equal-of-revappends-when-true-listps` | If X is a true-list, and Z is a true-list, and a revappend of X and Y is a revappend of Z and Y then X is Z. If U is a revappend of X and Y, and X is a true-list, and Z is a true-list, and X is Z then U is a revappend of Z and Y. | CERTIFIED (equivalent) |
| `equal-of-reverses` |  | unsupported: no word for the test stringp |
| `equal-of-take-and-list-fix` | If a take of N and X is a list-fix of X then a length of X is a natural-value of N. If a length of X is a natural-value of N then a take of N and X is a list-fix of X. | CERTIFIED (equivalent) |
| `equal-when-append-same` | If an append of X and Y is an append of X and Z then Y is Z. If U is an append of X and Y, and Y is Z then U is an append of X and Z. | CERTIFIED (equivalent) |
| `equal-when-revappend-same` | If a revappend of X and Y is a revappend of X and Z then Y is Z. If U is a revappend of X and Y, and Y is Z then U is a revappend of X and Z. | CERTIFIED (equivalent) |
| `fast-list-equiv-removal` |  | not found or not a single theorem |
| `final-cdr-of-acons` |  | unsupported: no word for the function acons |
| `final-cdr-of-add-to-set-equal` |  | unsupported: no word for the function add-to-set-equal |
| `final-cdr-of-append` | If Z is an append of X and Y then a final-cdr of Z is a final-cdr of Y. | CERTIFIED |
| `final-cdr-of-cons` | If Y is a cons of A and X then a final-cdr of Y is a final-cdr of X. | CERTIFIED |
| `final-cdr-of-hons-acons` |  | unsupported: no word for the function hons-acons |
| `final-cdr-of-hons-shrink-alist` |  | unsupported: no word for the function fast-alist-fork |
| `final-cdr-of-last` | If Y is a last-pair of X then a final-cdr of Y is a final-cdr of X. | CERTIFIED |
| `final-cdr-of-nthcdr` | If Y is an nthcdr of N and X, and a length of X is not smaller than a natural-value of N then a final-cdr of Y is a final-cdr of X. If a length of X is smaller than a natural-value of N then a final-cdr of an nthcdr of N and X is Nil. | CERTIFIED (equivalent) |
| `final-cdr-of-revappend` | If Z is a revappend of X and Y then a final-cdr of Z is a final-cdr of Y. | CERTIFIED |
| `final-cdr-of-union-equal` | If Z is an union of X and Y then a final-cdr of Z is a final-cdr of Y. | CERTIFIED |
| `final-cdr-of-update-nth` | If Y is an update-nth of N and V and X, and a natural-value of N is smaller than a length of X then a final-cdr of Y is a final-cdr of X. If Y is an update-nth of N and V and X, and a natural-value of N is not smaller than a length of X then a final-cdr of Y is Nil. | CERTIFIED (equivalent) |
| `final-cdr-when-atom` | If X is atomic then a final-cdr of X is X. | CERTIFIED |
| `final-cdr-when-true-listp` | If X is a true-list then a final-cdr of X is Nil. | CERTIFIED |
| `flatten-of-append` | If Z is an append of X and Y, and U is a flattening of X, and V is a flattening of Y then a flattening of Z is an append of U and V. | CERTIFIED |
| `flatten-of-cons` | If Y is a cons of A and X, and Z is a flattening of X then a flattening of Y is an append of A and Z. | CERTIFIED |
| `flatten-of-list-fix` | If Y is a list-fix of X then a flattening of Y is a flattening of X. | CERTIFIED |
| `flatten-when-not-consp` | If Y is a flattening of X, and X is not a pair then Y is Nil. | CERTIFIED |
| `foo` |  | not found or not a single theorem |
| `fourth-of-take` | If Y is a take of N and X, and a natural-value of N is not smaller than 4 then a head of a tail of a tail of a tail of Y is a head of a tail of a tail of a tail of X. | CERTIFIED |
| `hons-remove-duplicates-of-list-fix` |  | unsupported: no word for the function hons-remove-duplicates |
| `hons-remove-duplicates-under-set-equiv` |  | unsupported: no word for the function hons-remove-duplicates |
| `hons-remove-duplicates-when-atom` |  | unsupported: no word for the function hons-remove-duplicates |
| `hons-remove-duplicates1-acl2-count` |  | not found or not a single theorem |
| `hons-remove-duplicates1-of-nil` |  | unsupported: no word for the function hons-remove-duplicates1 |
| `hons-remove-duplicates1-redef` |  | not found or not a single theorem |
| `index-of-<-len` | If K is a member of X then an index of K and X is smaller than a length of X. | CERTIFIED (equivalent) |
| `index-of-append-first` | If U is an append of X and Y, and Z is an index of K and U, and an index of K and X is not Nil then Z is an index of K and X. | CERTIFIED (equivalent) |
| `index-of-append-neither` | If Z is an append of X and Y, and an index of K and X is Nil, and an index of K and Y is Nil then an index of K and Z is Nil. | CERTIFIED (equivalent) |
| `index-of-append-second` | If Z is an append of X and Y, and U is a length of X, and V is an index of K and Y, and an index of K and X is Nil, and an index of K and Y is not Nil then an index of K and Z is a sum of U and V. | CERTIFIED (equivalent) |
| `index-of-append-split` |  | unsupported: no word for the function or |
| `index-of-aux-eq-normalize` |  | unsupported: no word for the function index-of-aux-eq |
| `index-of-aux-eql-normalize` |  | unsupported: no word for the function index-of-aux-eql |
| `index-of-aux-removal` |  | unsupported: no word for the function index-of-aux |
| `index-of-iff-member` | If Y is an index of K and X, and Y is not Nil then K is a member of X. If K is a member of X then an index of K and X is not Nil. | CERTIFIED (equivalent) |
| `integerp-of-index-of` |  | unsupported: no word for the test integerp |
| `integerp-of-listpos` |  | unsupported: an equality between two tests needs 'if and only if' |
| `intersect-equal-of-cons-left` |  | unsupported: no word for the function intersectp-equal |
| `intersection$-commutes-under-set-equiv` | If Z is an intersection of X and Y then Z is set-equivalent-to an intersection of Y and X. | CERTIFIED (equivalent) |
| `intersection$-of-cons-left` | If Z is a cons of A and X, and U is an intersection of X and Y, and A is a member of Y then an intersection of Z and Y is a cons of A and U. If Z is a cons of A and X, and U is an intersection of Z and Y, and A is not a member of Y then U is an intersection of X and Y. | CERTIFIED (equivalent) |
| `intersection$-of-cons-right-under-set-equiv` | If Z is a cons of A and Y, and U is an intersection of X and Y, and A is a member of X then an intersection of X and Z is set-equivalent-to a cons of A and U. If U is a cons of A and Y, and Z is an intersection of X and U, and A is not a member of X then Z is set-equivalent-to an intersection of X and Y. | CERTIFIED (equivalent) |
| `intersection$-under-iff` |  | unsupported: hypothesis or conclusion (INTERSECTP-EQUAL X Y) is not a test on one term |
| `intersection$-when-atom-left` | If Z is an intersection of X and Y, and X is atomic then Z is Nil. | CERTIFIED (equivalent) |
| `intersection$-when-atom-right` | If Z is an intersection of X and Y, and Y is atomic then Z is Nil. | CERTIFIED (equivalent) |
| `intersectp-equal-of-atom-left` |  | unsupported: no word for the function intersectp-equal |
| `intersectp-equal-of-atom-right` |  | unsupported: no word for the function intersectp-equal |
| `intersectp-equal-of-cons-right` |  | unsupported: no word for the function intersectp-equal |
| `intersectp-iff-intersection-equal` |  | not found or not a single theorem |
| `intersectp-member` |  | unsupported: no word for the function intersectp-equal |
| `intersectp-of-self` |  | unsupported: an equality between two tests needs 'if and only if' |
| `intersectp-witness-correct` |  | unsupported: no word for the function intersectp-witness |
| `intersectp-witness-rw` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (REWRITING-NEGATIVE-LITERAL-FN (CONS (QUOTE INTERSECTP-EQUAL) (CONS X (CONS Y (QUOTE NIL)))) MFC STATE))) (QUOTE (IF (REWRITING-NEGATIVE-LITERAL-FN (CONS (QUOTE INTERSECTP-EQUAL) (CONS X (CONS Y (QUOTE NIL)))) MFC STATE) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `l0` |  | not found or not a single theorem |
| `l1` |  | not found or not a single theorem |
| `l2` |  | not found or not a single theorem |
| `l3` |  | not found or not a single theorem |
| `l5` |  | not found or not a single theorem |
| `l6` |  | not found or not a single theorem |
| `last-of-append` | If Z is an append of X and Y, and Y is a pair then a last-pair of Z is a last-pair of Y. If Z is an append of X and Y, and U is a last-pair of X, and Y is not a pair then a last-pair of Z is an append of U and Y. | CERTIFIED (equivalent) |
| `last-of-cons` | If Y is a cons of A and X, and X is a pair then a last-pair of Y is a last-pair of X. If Y is a cons of A and X, and X is not a pair then a last-pair of Y is Y. | CERTIFIED (equivalent) |
| `last-of-list-fix` | If Y is a list-fix of X then a last-pair of Y is a list-fix of a last-pair of X. | CERTIFIED |
| `last-of-rev` | If Y is a head of X, and X is a pair then a last-pair of a reversal of X is a cons of Y and Nil. If Y is a reversal of X, and X is not a pair then a last-pair of Y is Nil. | CERTIFIED (equivalent) |
| `last-of-revappend` | If Z is a revappend of X and Y, and Y is a pair then a last-pair of Z is a last-pair of Y. If Z is a revappend of X and Y, and U is a head of X, and X is a pair, and Y is not a pair then a last-pair of Z is a cons of U and Y. If Z is a revappend of X and Y, and Y is not a pair, and X is not a pair then a last-pair of Z is Y. | CERTIFIED (equivalent) |
| `last-when-atom` | If X is atomic then a last-pair of X is X. | CERTIFIED |
| `last-when-atom-of-cdr` | If a tail of X is atomic then a last-pair of X is X. | CERTIFIED |
| `lemma` |  | not found or not a single theorem |
| `lemma1` |  | not found or not a single theorem |
| `lemma2` |  | not found or not a single theorem |
| `lemma3` |  | not found or not a single theorem |
| `lemma5` |  | not found or not a single theorem |
| `len-of-append` | If Z is an append of X and Y, and U is a length of X, and V is a length of Y then a length of Z is a sum of U and V. | CERTIFIED |
| `len-of-cons` | If Y is a cons of A and X, and Z is a length of X then a length of Y is a sum of 1 and Z. | CERTIFIED |
| `len-of-intersection$-upper-bound` | If Z is a length of X, and U is an intersection of X and Y then Z is not smaller than a length of U. | CERTIFIED (equivalent) |
| `len-of-last` | If L is a pair then a length of a last-pair of L is 1. If X is a last-pair of L, and L is not a pair then a length of X is 0. | CERTIFIED (equivalent) |
| `len-of-list-fix` | If Y is a list-fix of X then a length of Y is a length of X. | CERTIFIED |
| `len-of-nthcdr` | If X is an nthcdr of N and L, and Y is a length of L, and Z is a natural-value of N then a length of X is a natural-value of a difference of Y and Z. | CERTIFIED |
| `len-of-rcons` | If Y is a rcons of A and X, and Z is a length of X then a length of Y is a sum of 1 and Z. | CERTIFIED |
| `len-of-remove-duplicates-equal` | If Y is a length of X then Y is not smaller than a length of a deduplication of X. | CERTIFIED |
| `len-of-remove-exact` | If Y is a removal of A and X, and Z is a length of X, and U is a duplicity of A and X then a length of Y is a difference of Z and U. | CERTIFIED (equivalent) |
| `len-of-remove1-equal` |  | unsupported: no word for the function remove1-equal |
| `len-of-repeat` | If Y is a repeat of N and X then a length of Y is a natural-value of N. | CERTIFIED |
| `len-of-resize-list` |  | unsupported: no word for the function resize-list |
| `len-of-rev` | If Y is a reversal of X then a length of Y is a length of X. | CERTIFIED |
| `len-of-revappend` | If Z is a revappend of X and Y, and U is a length of X, and V is a length of Y then a length of Z is a sum of U and V. | CERTIFIED |
| `len-of-subseq-list` |  | unsupported: no word for the function subseq-list |
| `len-of-take` | If Y is a take of N and X then a length of Y is a natural-value of N. | CERTIFIED |
| `len-of-update-nth` |  | unsupported: no word for the function max |
| `len-when-atom` | If X is atomic then a length of X is 0. | CERTIFIED |
| `len-when-consp` |  | not found or not a single theorem |
| `len-when-prefixp` | If X is a prefix of Y then a length of Y is not smaller than a length of X. | CERTIFIED (equivalent) |
| `len-zero` |  | not found or not a single theorem |
| `list-equiv-of-append-and-append` | If an append of A and X is list-equivalent-to an append of A and Y then X is list-equivalent-to Y. If Z is an append of A and X, and X is list-equivalent-to Y then Z is list-equivalent-to an append of A and Y. | CERTIFIED (equivalent) |
| `list-equiv-of-cons-and-cons` | If a cons of A and X is list-equivalent-to a cons of A and Y then X is list-equivalent-to Y. If Z is a cons of A and X, and X is list-equivalent-to Y then Z is list-equivalent-to a cons of A and Y. | CERTIFIED (equivalent) |
| `list-equiv-of-nil-left` | If Nil is list-equivalent-to Y then Y is not a pair. If there is something Y, and Y is not a pair then Nil is list-equivalent-to Y. | CERTIFIED (equivalent) |
| `list-equiv-of-nil-right` | If X is list-equivalent-to Nil then X is not a pair. If there is something X, and X is not a pair then X is list-equivalent-to Nil. | CERTIFIED (equivalent) |
| `list-equiv-of-rcons-and-rcons` | If a rcons of A and X is list-equivalent-to a rcons of A and Y then X is list-equivalent-to Y. If Z is a rcons of A and X, and X is list-equivalent-to Y then Z is list-equivalent-to a rcons of A and Y. | CERTIFIED (equivalent) |
| `list-equiv-of-rev-and-rev` | If a reversal of X is list-equivalent-to a reversal of Y then X is list-equivalent-to Y. If X is list-equivalent-to Y then a reversal of X is list-equivalent-to a reversal of Y. | CERTIFIED (equivalent) |
| `list-equiv-of-revappend-and-revappend` | If a revappend of A and X is list-equivalent-to a revappend of A and Y then X is list-equivalent-to Y. If Z is a revappend of A and X, and X is list-equivalent-to Y then Z is list-equivalent-to a revappend of A and Y. | CERTIFIED (equivalent) |
| `list-equiv-when-atom-left` | If X is atomic, and X is list-equivalent-to Y then Y is atomic. If X is atomic, and Y is atomic then X is list-equivalent-to Y. | CERTIFIED (equivalent) |
| `list-equiv-when-atom-right` | If Y is atomic, and X is list-equivalent-to Y then X is atomic. If Y is atomic, and X is atomic then X is list-equivalent-to Y. | CERTIFIED (equivalent) |
| `list-fix-equal-forward-to-list-equiv` | If a list-fix of X is a list-fix of Y then X is list-equivalent-to Y. | CERTIFIED |
| `list-fix-exec-removal` |  | unsupported: no word for the function true-list-fix-exec |
| `list-fix-of-append` | If Z is an append of X and Y, and U is a list-fix of Y then a list-fix of Z is an append of X and U. | CERTIFIED |
| `list-fix-of-cons` | If Y is a cons of A and X, and Z is a list-fix of X then a list-fix of Y is a cons of A and Z. | CERTIFIED |
| `list-fix-of-revappend` | If Z is a revappend of X and Y, and U is a list-fix of Y then a list-fix of Z is a revappend of X and U. | CERTIFIED |
| `list-fix-under-iff` | If Y is a list-fix of X, and Y is not Nil then X is a pair. If X is a pair then a list-fix of X is not Nil. | CERTIFIED (equivalent) |
| `list-fix-under-list-equiv` | If Y is a list-fix of X then Y is list-equivalent-to X. | CERTIFIED |
| `list-fix-when-len-zero` | If a length of X is 0 then a list-fix of X is Nil. | CERTIFIED |
| `list-fix-when-not-consp` | If Y is a list-fix of X, and X is not a pair then Y is Nil. | CERTIFIED |
| `list-fix-when-true-listp` | If X is a true-list then a list-fix of X is X. | CERTIFIED |
| `listpos-complete` | If Z is an nthcdr of N and Y, and X is a prefix of Z then a listpos of X and Y is not Nil and a natural-value of N is not smaller than a listpos of X and Y. | CERTIFIED (equivalent) |
| `listpos-lower-bound-weak` | If Z is a listpos of X and Y then Z is not smaller than 0. | CERTIFIED |
| `listpos-of-list-fix-left` | If Z is a list-fix of X, and U is a listpos of Z and Y then U is a listpos of X and Y. | CERTIFIED |
| `listpos-of-list-fix-right` | If U is a list-fix of Y, and Z is a listpos of X and U then Z is a listpos of X and Y. | CERTIFIED |
| `listpos-under-iff` | If Z is a listpos of X and Y, and Z is not Nil then X is a sublist of Y. If X is a sublist of Y then a listpos of X and Y is not Nil. | CERTIFIED (equivalent) |
| `listpos-upper-bound-strong-1` | If a listpos of X and Y is smaller than a length of Y then Y is a pair. If Z is a listpos of X and Y, and Y is a pair then Z is smaller than a length of Y. | CERTIFIED (equivalent) |
| `listpos-upper-bound-strong-2` | If Z is a length of Y, and U is a length of X, and X is a sublist of Y then a difference of Z and U is not smaller than a listpos of X and Y. | CERTIFIED |
| `listpos-upper-bound-weak` | If Z is a length of Y, and U is a listpos of X and Y then Z is not smaller than U. | CERTIFIED |
| `listpos-when-atom-left` | If Z is a listpos of X and Y, and X is atomic then Z is 0. | CERTIFIED |
| `listpos-when-atom-right` | If Y is atomic, and X is atomic then a listpos of X and Y is 0. If Z is a listpos of X and Y, and Y is atomic, and X is not atomic then Z is Nil. | CERTIFIED (equivalent) |
| `lower-bound-of-len-when-sublistp` | If X is a sublist of Y then a length of Y is not smaller than a length of X. | CERTIFIED |
| `make-character-list-of-append` |  | not found or not a single theorem |
| `make-character-list-of-rev` |  | unsupported: no word for the function make-character-list |
| `make-list-ac-redef` |  | not found or not a single theorem |
| `make-list-ac-removal` |  | unsupported: no word for the function make-list-ac |
| `member-equal-of-remove1-equal` |  | unsupported: no word for the function remove1-equal |
| `member-equal-update-nth` | If Y is an update-nth of N and X and L then X is a member of Y. | CERTIFIED |
| `member-equal-when-all-equalp` |  | unsupported: hypothesis or conclusion (ALL-EQUALP A X) is not a test on one term |
| `member-of-append` | If Z is an append of X and Y, and A is a member of Z then A is a member of X or A is a member of Y. If there is something A, and Z is an append of X and Y, and A is a member of X or A is a member of Y then A is a member of Z. | CERTIFIED (equivalent) |
| `member-of-car` |  | unsupported: an equality between two tests needs 'if and only if' |
| `member-of-car-of-last` | If a head of a last-pair of X is a member of X then X is a pair. If X is a pair then a head of a last-pair of X is a member of X. | CERTIFIED (equivalent) |
| `member-of-cons` |  | unsupported: an equality between two tests needs 'if and only if' |
| `member-of-intersection$` | If Z is an intersection of X and Y, and A is a member of Z then A is a member of X and A is a member of Y. If Z is an intersection of X and Y, and A is a member of X, and A is a member of Y then A is a member of Z. | CERTIFIED (equivalent) |
| `member-of-intersection-equal` | If Z is an intersection of X and Y, and A is a member of Z then A is a member of X and A is a member of Y. If Z is an intersection of X and Y, and A is a member of X, and A is a member of Y then A is a member of Z. | CERTIFIED (equivalent) |
| `member-of-nth` | If a natural-value of N is smaller than a length of X then an nth of N and X is a member of X. | CERTIFIED (equivalent) |
| `member-of-remove` | If Y is a removal of B and X, and A is a member of Y then A is a member of X and A is not B. If Y is a removal of B and X, and A is a member of X, and A is not B then A is a member of Y. | CERTIFIED (equivalent) |
| `member-of-remove-duplicates-equal` | If A is a member of a deduplication of X then A is a member of X. If A is a member of X then A is a member of a deduplication of X. | CERTIFIED (equivalent) |
| `member-of-repeat` |  | unsupported: an equality between two tests needs 'if and only if' |
| `member-of-revappend` | If Y is a revappend of A and B, and X is a member of Y then X is a member of A or X is a member of B. If there is something X, and Y is a revappend of A and B, and X is a member of A or X is a member of B then X is a member of Y. | CERTIFIED (equivalent) |
| `member-of-set-difference-equal` | If Z is a set-difference of X and Y, and A is a member of Z then A is a member of X and A is not a member of Y. If Z is a set-difference of X and Y, and A is a member of X, and A is not a member of Y then A is a member of Z. | CERTIFIED (equivalent) |
| `member-self` | If there is something X then X is not a member of X. | CERTIFIED (equivalent) |
| `member-when-atom` | If there is something A, and X is atomic then A is not a member of X. | CERTIFIED (equivalent) |
| `natp-of-listpos` | If a listpos of X and Y is natural then X is a sublist of Y. If X is a sublist of Y then a listpos of X and Y is natural. | CERTIFIED (equivalent) |
| `natpp-of-index-of` | If an index of K and X is natural then K is a member of X. If K is a member of X then an index of K and X is natural. | CERTIFIED (equivalent) |
| `nats-equiv-of-cons` |  | unsupported: hypothesis or conclusion (NAT-EQUIV$INLINE A (CAR Z)) is not a test on one term |
| `nats-equiv-reflexive` |  | not found or not a single theorem |
| `nats-equiv-symmetric` |  | not found or not a single theorem |
| `nats-equiv-transitive` |  | not found or not a single theorem |
| `no-duplicatesp-equal-of-append-of-append` | If an append of X and Y is duplicate-free then an append of Y and X is duplicate-free. If an append of Y and X is duplicate-free then an append of X and Y is duplicate-free. | CERTIFIED (equivalent) |
| `no-duplicatesp-equal-of-append-of-rev-1` | If Z is a reversal of X, and an append of Z and Y is duplicate-free then an append of X and Y is duplicate-free. If Z is a reversal of X, and an append of X and Y is duplicate-free then an append of Z and Y is duplicate-free. | CERTIFIED (equivalent) |
| `no-duplicatesp-equal-of-append-of-rev-2` | If Z is a reversal of Y, and an append of X and Z is duplicate-free then an append of X and Y is duplicate-free. If Z is a reversal of Y, and an append of X and Y is duplicate-free then an append of X and Z is duplicate-free. | CERTIFIED (equivalent) |
| `no-duplicatesp-equal-of-cons` |  | unsupported: no word for the function double-rewrite |
| `no-duplicatesp-equal-of-flatten-of-rev` | If a flattening of a reversal of X is duplicate-free then a flattening of X is duplicate-free. If a flattening of X is duplicate-free then a flattening of a reversal of X is duplicate-free. | CERTIFIED (equivalent) |
| `no-duplicatesp-equal-of-hons-remove-duplicates` |  | unsupported: no word for the function hons-remove-duplicates |
| `no-duplicatesp-equal-of-list-fix` |  | not found or not a single theorem |
| `no-duplicatesp-equal-of-remove-duplicates-equal` | If Y is a deduplication of X then Y is duplicate-free. | CERTIFIED |
| `no-duplicatesp-equal-of-rev` | If a reversal of X is duplicate-free then X is duplicate-free. If X is duplicate-free then a reversal of X is duplicate-free. | CERTIFIED (equivalent) |
| `no-duplicatesp-equal-same-by-duplicity` |  | unsupported: hypothesis or conclusion (DUPLICITY-HYP) is not a test on one term |
| `no-duplicatesp-equal-when-atom` | If X is atomic then X is duplicate-free. | CERTIFIED (equivalent) |
| `no-duplicatesp-equal-when-duplicity-badguy1` |  | unsupported: hypothesis or conclusion (DUPLICITY-BADGUY1 DOM X) is not a test on one term |
| `no-duplicatesp-equal-when-high-duplicity` | If 1 is smaller than a duplicity of A and X then X is not duplicate-free. | CERTIFIED |
| `no-duplicatesp-of-set-difference-equal` | If Z is a set-difference of X and Y, and X is duplicate-free then Z is duplicate-free. | CERTIFIED |
| `no-duplicatesp-of-take` | If X is a take of N and L, and L is duplicate-free, and a length of L is not smaller than a natural-value of N then X is duplicate-free. | CERTIFIED |
| `non-element-p-def` |  | unsupported: no word for the test non-element-p |
| `not-suffixp-of-cons-left` | If there is something B, and X is a cons of C and A, and A is not a suffix of B then X is not a suffix of B. | CERTIFIED |
| `nth-badguy-bounded` |  | not found or not a single theorem |
| `nth-badguy-is-bad` |  | not found or not a single theorem |
| `nth-badguy-is-equality` |  | not found or not a single theorem |
| `nth-of-append` | If Z is an append of X and Y, and a natural-value of N is smaller than a length of X then an nth of N and Z is an nth of N and X. If U is an append of X and Y, and Z is an nth of N and U, and W is a length of X, and V is a difference of N and W, and a natural-value of N is not smaller than a length of X then Z is an nth of V and Y. | CERTIFIED (equivalent) |
| `nth-of-butlast` |  | unsupported: no word for the function butlast |
| `nth-of-index-when-member` | If Y is an index of K and X, and K is a member of X then an nth of Y and X is K. | CERTIFIED (equivalent) |
| `nth-of-last` |  | unsupported: no word for the test zp |
| `nth-of-list-fix` | If Z is a list-fix of X, and Y is an nth of N and Z then Y is an nth of N and X. | CERTIFIED |
| `nth-of-make-list-ac` |  | unsupported: no word for the function make-list-ac |
| `nth-of-nfix` | If Y is a natural-value of N, and Z is an nth of Y and X then Z is an nth of N and X. | CERTIFIED |
| `nth-of-nil` | If X is an nth of N and Nil then X is Nil. | CERTIFIED |
| `nth-of-nthcdr` | If Z is an nthcdr of M and X, and Y is an nth of N and Z, and V is a natural-value of N, and W is a natural-value of M, and U is a sum of V and W then Y is an nth of U and X. | CERTIFIED |
| `nth-of-repeat` | If X is a repeat of M and A, and a natural-value of N is smaller than a natural-value of M then an nth of N and X is A. If Y is a repeat of M and A, and X is an nth of N and Y, and a natural-value of N is not smaller than a natural-value of M then X is Nil. | CERTIFIED (equivalent) |
| `nth-of-resize-list` |  | unsupported: no word for the function resize-list |
| `nth-of-rev` | If Y is a reversal of X, and U is a length of X, and W is a natural-value of N, and V is a sum of 1 and W, and Z is a difference of U and V, and a natural-value of N is smaller than a length of X then an nth of N and Y is an nth of Z and X. If Z is a reversal of X, and Y is an nth of N and Z, and a natural-value of N is not smaller than a length of X then Y is Nil. | CERTIFIED (equivalent) |
| `nth-of-revappend` | If Z is a revappend of X and Y, and V is a length of X, and P is a natural-value of N, and W is a sum of 1 and P, and U is a difference of V and W, and a natural-value of N is smaller than a length of X then an nth of N and Z is an nth of U and X. If U is a revappend of X and Y, and Z is an nth of N and U, and W is a length of X, and V is a difference of N and W, and a natural-value of N is not smaller than a length of X then Z is an nth of V and Y. | CERTIFIED (equivalent) |
| `nth-of-reverse` | If Y is a reverse of X, and U is a length of X, and W is a natural-value of N, and V is a sum of 1 and W, and Z is a difference of U and V, and a natural-value of N is smaller than a length of X then an nth of N and Y is an nth of Z and X. If Z is a reverse of X, and Y is an nth of N and Z, and a natural-value of N is not smaller than a length of X then Y is Nil. | CERTIFIED (equivalent) |
| `nth-of-take` | If X is a take of N and L, and a natural-value of I is smaller than a natural-value of N then an nth of I and X is an nth of I and L. If Y is a take of N and L, and X is an nth of I and Y, and a natural-value of I is not smaller than a natural-value of N then X is Nil. | CERTIFIED (equivalent) |
| `nth-of-update-nth-diff` | If W is an update-nth of Z and V and X, and U is an nth of Y and W, and a natural-value of Y is not a natural-value of Z then U is an nth of Y and X. | CERTIFIED |
| `nth-of-update-nth-same` | If Y is an update-nth of N and V and X then an nth of N and Y is V. | CERTIFIED |
| `nth-of-update-nth-split-for-constants` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (QUOTEP N1))) (QUOTE (IF (QUOTEP N1) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `nth-update-nth` | If Y is an update-nth of N and X and L, and a natural-value of M is a natural-value of N then an nth of M and Y is X. If Z is an update-nth of N and X and L, and Y is an nth of M and Z, and a natural-value of M is not a natural-value of N then Y is an nth of M and L. | CERTIFIED (equivalent) |
| `nth-when-atom` | If Y is an nth of N and X, and X is atomic then Y is Nil. | CERTIFIED |
| `nth-when-too-large` | If Y is an nth of N and X, and a natural-value of N is not smaller than a length of X then Y is Nil. | CERTIFIED |
| `nth-when-too-large-cheap` | If Y is an nth of N and X, and a natural-value of N is not smaller than a length of X then Y is Nil. | CERTIFIED |
| `nth-when-zp` |  | unsupported: no word for the test zp |
| `nthcdr-before-update-nth` | If W is an update-nth of Y and U and X, and V is an nthcdr of Z and W, and Q is a natural-value of Y, and R is a natural-value of Z, and P is a difference of Q and R, and S is an nthcdr of Z and X, and a natural-value of Y is smaller than a length of X, and a natural-value of Y is not smaller than a natural-value of Z then V is an update-nth of P and U and S. | CERTIFIED |
| `nthcdr-of-cdr` | If Z is a tail of X, and Y is an nthcdr of I and Z then Y is a tail of an nthcdr of I and X. | CERTIFIED |
| `nthcdr-of-cons` |  | unsupported: no word for the test zp |
| `nthcdr-of-list-fix` | If Z is a list-fix of X, and Y is an nthcdr of N and Z then Y is a list-fix of an nthcdr of N and X. | CERTIFIED |
| `nthcdr-of-nil` |  | not found or not a single theorem |
| `nthcdr-of-nthcdr` | If Z is an nthcdr of B and X, and Y is an nthcdr of A and Z, and V is a natural-value of A, and W is a natural-value of B, and U is a sum of V and W then Y is an nthcdr of U and X. | CERTIFIED |
| `nthcdr-of-repeat` | If Y is a repeat of K and A, and X is an nthcdr of N and Y, and U is a natural-value of K, and V is a natural-value of N, and Z is a difference of U and V, and a natural-value of K is not smaller than a natural-value of N then X is a repeat of Z and A. If X is a repeat of K and A, and a natural-value of K is smaller than a natural-value of N then an nthcdr of N and X is Nil. | CERTIFIED (equivalent) |
| `nthcdr-of-update-nth` | If V is an update-nth of Z and U and X, and a natural-value of Z is smaller than a natural-value of Y then an nthcdr of Y and V is an nthcdr of Y and X. If W is an update-nth of Z and U and X, and V is an nthcdr of Y and W, and Q is a natural-value of Z, and R is a natural-value of Y, and P is a difference of Q and R, and S is an nthcdr of Y and X, and a natural-value of Z is not smaller than a natural-value of Y then V is an update-nth of P and U and S. | CERTIFIED (equivalent) |
| `nthcdr-past-update-nth` | If V is an update-nth of Y and U and X, and a natural-value of Y is smaller than a length of X, and a natural-value of Y is smaller than a natural-value of Z then an nthcdr of Z and V is an nthcdr of Z and X. | CERTIFIED |
| `nthcdr-when-atom` |  | unsupported: no word for the test zp |
| `nthcdr-when-less-than-len-under-iff` | If a natural-value of N is smaller than a length of X then an nthcdr of N and X is not Nil. | CERTIFIED (equivalent) |
| `nthcdr-when-zp` |  | unsupported: no word for the test zp |
| `open-small-nthcdr` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (AND (QUOTEP N) (NATP (UNQUOTE N)) (< (UNQUOTE N) 5)))) (QUOTE (IF (IF (QUOTEP N) (IF (NATP (CAR (CDR N))) (< (CAR (CDR N)) (QUOTE 5)) (QUOTE NIL)) (QUOTE NIL)) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `outelement-list-final-cdr-p-of-nil` |  | unsupported: no word for the test outelement-list-final-cdr-p |
| `outelement-list-final-cdr-p-rewrite` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (AND (NOT (EQUAL X (QUOTE (QUOTE T)))) (NOT (EQUAL X (QUOTE (QUOTE NIL))))))) (QUOTE (IF (IF (NOT (EQUAL X (QUOTE (QUOTE T)))) (NOT (EQUAL X (QUOTE (QUOTE NIL)))) (QUOTE NIL)) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `outelement-list-final-cdr-p-type` |  | unsupported: no word for the function outelement-list-final-cdr-p |
| `outelement-list-p-of-append` |  | unsupported: no word for the test outelement-list-p |
| `outelement-list-p-of-element-listxformer` |  | unsupported: no word for the test element-p |
| `outelement-p-of-element-xformer` |  | unsupported: no word for the test element-p |
| `outelement-p-of-outelement-example` |  | unsupported: no word for the test outelement-p |
| `position-equal-ac-is-index-of-aux` |  | unsupported: no word for the test integerp |
| `prefixp-append-append` | If U is an append of X and Y, and an append of X and Z is a prefix of U then Z is a prefix of Y. If U is an append of X and Z, and V is an append of X and Y, and Z is a prefix of Y then U is a prefix of V. | CERTIFIED (equivalent) |
| `prefixp-nthcdr-nthcdr` | If Z is an nthcdr of N and X, and a take of N and Y is a take of N and X, and an nthcdr of N and Y is a prefix of Z, and a length of X is not smaller than N then Y is a prefix of X. If Z is an nthcdr of N and X, and a take of N and Y is a take of N and X, and Y is a prefix of X, and a length of X is not smaller than N then an nthcdr of N and Y is a prefix of Z. | CERTIFIED (equivalent) |
| `prefixp-of-append-arg1` | If U is a length of X, and V is a length of Y, and W is an nthcdr of U and Z, and an append of X and Y is a prefix of Z then a length of Z is not smaller than a sum of U and V and a list-fix of X is a take of U and Z and Y is a prefix of W. If U is a length of X, and V is an nthcdr of U and Z, and W is a length of Y, and a list-fix of X is a take of U and Z, and Y is a prefix of V, and a length of Z is not smaller than a sum of U and W then an append of X and Y is a prefix of Z. | CERTIFIED (equivalent) |
| `prefixp-of-append-arg2` |  | unsupported: hypothesis or conclusion (AND (EQUAL (TRUE-LIST-FIX Y) (TAKE (LEN Y) X)) (PREFIXP (NTHCDR (LEN Y) X) Z)) is not a test on one term |
| `prefixp-of-cons-left` | If a cons of A and X is a prefix of Y then Y is a pair and A is a head of Y and X is a prefix of a tail of Y. If Y is a pair, and a head of Y is A, and X is a prefix of a tail of Y then a cons of A and X is a prefix of Y. | CERTIFIED (equivalent) |
| `prefixp-of-cons-right` | If Z is a cons of A and Y, and X is a prefix of Z, and X is a pair then a head of X is A and a tail of X is a prefix of Y. If Z is a cons of A and Y, and a head of X is A, and a tail of X is a prefix of Y, and X is a pair then X is a prefix of Z. If there is something X, and Z is a cons of A and Y, and X is not a pair then X is a prefix of Z. | CERTIFIED (equivalent) |
| `prefixp-of-list-fix-left` | If a list-fix of X is a prefix of Y then X is a prefix of Y. If X is a prefix of Y then a list-fix of X is a prefix of Y. | CERTIFIED (equivalent) |
| `prefixp-of-list-fix-right` | If X is a prefix of a list-fix of Y then X is a prefix of Y. If X is a prefix of Y then X is a prefix of a list-fix of Y. | CERTIFIED (equivalent) |
| `prefixp-of-take` | If a take of N and X is a prefix of X then a length of X is not smaller than a natural-value of N. If Y is a take of N and X, and a length of X is not smaller than a natural-value of N then Y is a prefix of X. | CERTIFIED (equivalent) |
| `prefixp-one-way-or-another` | If X is a prefix of Z, and Y is a prefix of Z, and X is not a prefix of Y then Y is a prefix of X. | CERTIFIED |
| `prefixp-reflexive` | If there is something X then X is a prefix of X. | CERTIFIED |
| `prefixp-when-equal-lengths` | If X is a prefix of Y, and a length of X is not smaller than a length of Y then X is list-equivalent-to Y. If X is list-equivalent-to Y, and a length of X is not smaller than a length of Y then X is a prefix of Y. | CERTIFIED (equivalent) |
| `prefixp-when-not-consp-left` | If there is something X, and there is something Y, and X is not a pair then X is a prefix of Y. | CERTIFIED |
| `prefixp-when-not-consp-right` | If X is a prefix of Y, and Y is not a pair then X is not a pair. If there is something Y, and there is something X, and Y is not a pair, and X is not a pair then X is a prefix of Y. | CERTIFIED (equivalent) |
| `prefixp-when-prefixp` | If Y is a prefix of X, and X is a prefix of Y then X is list-equivalent-to Y. If Y is a prefix of X, and X is list-equivalent-to Y then X is a prefix of Y. | CERTIFIED (equivalent) |
| `r0` |  | not found or not a single theorem |
| `r1` |  | not found or not a single theorem |
| `r2` |  | not found or not a single theorem |
| `r3` |  | not found or not a single theorem |
| `r4` |  | not found or not a single theorem |
| `rationalp-of-listpos` |  | unsupported: an equality between two tests needs 'if and only if' |
| `rcons-of-append` | If U is an append of X and Y, and Z is a rcons of A and U, and V is a rcons of A and Y then Z is an append of X and V. | CERTIFIED |
| `rcons-of-list-fix` | If Z is a list-fix of X, and Y is a rcons of A and Z then Y is a rcons of A and X. | CERTIFIED |
| `rcons-under-set-equiv` | If Y is a rcons of A and X then Y is set-equivalent-to a cons of A and X. | CERTIFIED |
| `remove-duplicates-equal-of-cons` | If A is a member of X then a deduplication of a cons of A and X is a deduplication of X. If Y is a cons of A and X, and Z is a deduplication of X, and A is not a member of X then a deduplication of Y is a cons of A and Z. | CERTIFIED (equivalent) |
| `remove-duplicates-equal-of-list-fix` | If Y is a list-fix of X then a deduplication of Y is a deduplication of X. | CERTIFIED |
| `remove-duplicates-equal-of-remove` | If Y is a removal of A and X, and Z is a deduplication of X then a deduplication of Y is a removal of A and Z. | CERTIFIED (equivalent) |
| `remove-duplicates-equal-of-true-list-fix` |  | not found or not a single theorem |
| `remove-duplicates-equal-under-set-equiv` | If Y is a deduplication of X then Y is set-equivalent-to X. | CERTIFIED |
| `remove-duplicates-equal-when-atom` | If X is atomic then a deduplication of X is Nil. | CERTIFIED |
| `remove-duplicates-equal-when-no-duplicatesp` |  | not found or not a single theorem |
| `remove-is-commutative` | If Z is a removal of A and X, and Y is a removal of B and Z, and U is a removal of B and X then Y is a removal of A and U. | CERTIFIED (equivalent) |
| `remove-is-idempotent` | If Y is a removal of A and X then a removal of A and Y is Y. | CERTIFIED (equivalent) |
| `remove-of-append` | If U is an append of X and Y, and Z is a removal of A and U, and V is a removal of A and X, and W is a removal of A and Y then Z is an append of V and W. | CERTIFIED (equivalent) |
| `remove-of-cons` | If Y is a cons of B and X, and A is B then a removal of A and Y is a removal of A and X. If Z is a cons of B and X, and Y is a removal of A and Z, and U is a removal of A and X, and A is not B then Y is a cons of B and U. | CERTIFIED (equivalent) |
| `remove-of-intersection-equal` | If U is an intersection of X and Y, and Z is a removal of A and U, and V is a removal of A and X, and W is a removal of A and Y then Z is an intersection of V and W. | CERTIFIED (equivalent) |
| `remove-of-rev` | If Z is a reversal of X, and Y is a removal of A and Z then Y is a reversal of a removal of A and X. | CERTIFIED (equivalent) |
| `remove-of-revappend` | If U is a revappend of X and Y, and Z is a removal of A and U, and V is a removal of A and X, and W is a removal of A and Y then Z is a revappend of V and W. | CERTIFIED (equivalent) |
| `remove-of-set-difference-equal` | If U is a set-difference of X and Y, and Z is a removal of A and U, and V is a removal of A and X then Z is a set-difference of V and Y. | CERTIFIED (equivalent) |
| `remove-of-union-equal` | If U is an union of X and Y, and Z is a removal of A and U, and V is a removal of A and X, and W is a removal of A and Y then Z is an union of V and W. | CERTIFIED (equivalent) |
| `remove-under-iff` | If Y is a cons of A and Nil, and Z is a removal of A and X, and Z is not Nil then X is not a subset of Y. If Y is a removal of A and X, and Z is a cons of A and Nil, and X is not a subset of Z then Y is not Nil. | CERTIFIED (equivalent) |
| `remove-when-absent` |  | not found or not a single theorem |
| `remove-when-atom` | If Y is a removal of A and X, and X is atomic then Y is Nil. | CERTIFIED (equivalent) |
| `remove-when-non-member` | If Y is a removal of A and X, and A is not a member of X then Y is a list-fix of X. | CERTIFIED (equivalent) |
| `repeat-1` | If X is a repeat of 1 and A then X is a cons of A and Nil. | CERTIFIED |
| `repeat-of-nfix` | If Y is a natural-value of N, and Z is a repeat of Y and X then Z is a repeat of N and X. | CERTIFIED |
| `repeat-under-iff` |  | unsupported: no word for the test zp |
| `repeat-when-zp` |  | unsupported: no word for the test zp |
| `resize-list-of-len-free` |  | unsupported: no word for the function resize-list |
| `resize-list-of-nfix` |  | unsupported: no word for the function resize-list |
| `resize-list-when-atom` |  | unsupported: no word for the function resize-list |
| `resize-list-when-zp` |  | unsupported: no word for the test zp |
| `rev-of-append` | If Z is an append of X and Y, and U is a reversal of Y, and V is a reversal of X then a reversal of Z is an append of U and V. | CERTIFIED |
| `rev-of-cons` | If Y is a cons of A and X, and Z is a reversal of X, and U is a cons of A and Nil then a reversal of Y is an append of Z and U. | CERTIFIED |
| `rev-of-list-fix` | If Y is a list-fix of X then a reversal of Y is a reversal of X. | CERTIFIED |
| `rev-of-rcons` | If Y is a rcons of A and X, and Z is a reversal of X then a reversal of Y is a cons of A and Z. | CERTIFIED |
| `rev-of-remove-equal` |  | not found or not a single theorem |
| `rev-of-repeat` | If X is a repeat of N and A then a reversal of X is X. | CERTIFIED |
| `rev-of-rev` | If Y is a reversal of X then a reversal of Y is a list-fix of X. | CERTIFIED |
| `rev-under-iff` | If Y is a reversal of X, and Y is not Nil then X is a pair. If X is a pair then a reversal of X is not Nil. | CERTIFIED (equivalent) |
| `rev-under-set-equiv` | If Y is a reversal of X then Y is set-equivalent-to X. | CERTIFIED |
| `rev-when-not-consp` | If Y is a reversal of X, and X is not a pair then Y is Nil. | CERTIFIED |
| `revappend-lemma` |  | not found or not a single theorem |
| `revappend-lengths-x` |  | not found or not a single theorem |
| `revappend-nonempty-list` |  | not found or not a single theorem |
| `revappend-of-rcons` | If Z is a rcons of A and X, and U is a revappend of Z and Y, and V is a revappend of X and Y then U is a cons of A and V. | CERTIFIED |
| `revappend-removal` | If Z is a revappend of X and Y, and U is a reversal of X then Z is an append of U and Y. | CERTIFIED |
| `revappend-under-set-equiv` | If Z is a revappend of X and Y then Z is set-equivalent-to an append of X and Y. | CERTIFIED |
| `revappend-unequal-accs` |  | not found or not a single theorem |
| `reverse-removal` | If X is a true-list then a reverse of X is a reversal of X. | CERTIFIED |
| `reverse-under-set-equiv` | If Y is a reverse of X then Y is set-equivalent-to X. | CERTIFIED |
| `rule1` |  | not found or not a single theorem |
| `second-of-take` | If Y is a take of N and X, and a natural-value of N is not smaller than 2 then a head of a tail of Y is a head of a tail of X. | CERTIFIED |
| `set-difference-equal-of-append-left` |  | not found or not a single theorem |
| `set-difference-equal-of-cons` | If Z is a cons of A and X, and A is a member of Y then a set-difference of Z and Y is a set-difference of X and Y. If Z is a cons of A and X, and U is a set-difference of Z and Y, and V is a set-difference of X and Y, and A is not a member of Y then U is a cons of A and V. | CERTIFIED (equivalent) |
| `set-difference-equal-of-cons-right` |  | not found or not a single theorem |
| `set-difference-equal-of-list-fix-left` |  | not found or not a single theorem |
| `set-difference-equal-of-nil-right` |  | not found or not a single theorem |
| `set-difference-equal-of-remove-left` |  | not found or not a single theorem |
| `set-difference-equal-of-self` | If Y is a set-difference of X and X then Y is Nil. | rejected by compiler: unparsed |
| `set-difference-equal-when-atom` | If Z is a set-difference of X and Y, and X is atomic then Z is Nil. | CERTIFIED |
| `set-difference-equal-when-subsetp-equal` | If X is a subset of Y then a set-difference of X and Y is Nil. | CERTIFIED |
| `set-equiv-asym` | If X is set-equivalent-to Y then Y is set-equivalent-to X. If Y is set-equivalent-to X then X is set-equivalent-to Y. | CERTIFIED (equivalent) |
| `set-equiv-of-cons-self` | If X is set-equivalent-to a cons of A and X then A is a member of X. If A is a member of X then X is set-equivalent-to a cons of A and X. | CERTIFIED (equivalent) |
| `set-equiv-of-nil` | If Nil is set-equivalent-to X then X is atomic. If X is atomic then Nil is set-equivalent-to X. | CERTIFIED (equivalent) |
| `set-equiv-refl` |  | not found or not a single theorem |
| `set-equiv-trans` |  | not found or not a single theorem |
| `set-equiv-with-append-other-left` | If X is set-equivalent-to an append of Y and X then Y is a subset of X. If Y is a subset of X then X is set-equivalent-to an append of Y and X. | CERTIFIED (equivalent) |
| `set-equiv-with-append-other-right` | If X is set-equivalent-to an append of X and Y then Y is a subset of X. If Y is a subset of X then X is set-equivalent-to an append of X and Y. | CERTIFIED (equivalent) |
| `set-unequal-witness-correct` |  | unsupported: iff is not in the grammar yet |
| `set-unequal-witness-rw` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (REWRITING-POSITIVE-LITERAL-FN (CONS (QUOTE SET-EQUIV) (CONS X (CONS Y (QUOTE NIL)))) MFC STATE))) (QUOTE (IF (REWRITING-POSITIVE-LITERAL-FN (CONS (QUOTE SET-EQUIV) (CONS X (CONS Y (QUOTE NIL)))) MFC STATE) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `stringp-of-reverse` |  | unsupported: no word for the function stringp |
| `sublistp-complete` | If Z is an nthcdr of N and Y, and X is a prefix of Z then X is a sublist of Y. | CERTIFIED |
| `sublistp-of-cons-right` | If Z is a cons of A and Y, and X is a sublist of Z then X is a prefix of Z or X is a sublist of Y. If there is something X, and Z is a cons of A and Y, and X is a prefix of Z or X is a sublist of Y then X is a sublist of Z. | CERTIFIED (equivalent) |
| `sublistp-of-list-fix-left` | If a list-fix of X is a sublist of Y then X is a sublist of Y. If X is a sublist of Y then a list-fix of X is a sublist of Y. | CERTIFIED (equivalent) |
| `sublistp-of-list-fix-right` | If X is a sublist of a list-fix of Y then X is a sublist of Y. If X is a sublist of Y then X is a sublist of a list-fix of Y. | CERTIFIED (equivalent) |
| `sublistp-sound` | If U is a listpos of X and Y, and Z is an nthcdr of U and Y, and X is a sublist of Y then X is a prefix of Z. | CERTIFIED (equivalent) |
| `sublistp-when-atom-left` | If there is something Y, and X is atomic then X is a sublist of Y. | CERTIFIED (equivalent) |
| `sublistp-when-atom-right` | If Y is atomic, and X is a sublist of Y then X is atomic. If Y is atomic, and X is atomic then X is a sublist of Y. | CERTIFIED (equivalent) |
| `sublistp-when-prefixp` | If X is a prefix of Y then X is a sublist of Y. | CERTIFIED |
| `subseq-list-of-len` |  | unsupported: no word for the function subseq-list |
| `subseq-list-of-list-fix` |  | unsupported: no word for the function subseq-list |
| `subseq-list-starting-from-zero` |  | unsupported: no word for the function subseq-list |
| `subseq-list-under-iff` |  | unsupported: hypothesis or conclusion (SUBSEQ-LIST X START END) is not a test on one term |
| `subsetp-append1` | If an append of A and B is a subset of C then A is a subset of C and B is a subset of C. If A is a subset of C, and B is a subset of C then an append of A and B is a subset of C. | CERTIFIED (equivalent) |
| `subsetp-append2` | If X is an append of A and B then A is a subset of X. | CERTIFIED (equivalent) |
| `subsetp-append3` | If X is an append of A and B then B is a subset of X. | CERTIFIED (equivalent) |
| `subsetp-car-member` | If X is a subset of Y, and X is a pair then a head of X is a member of Y. | CERTIFIED (equivalent) |
| `subsetp-cons-2` | If Y is a cons of X and B, and A is a subset of B then A is a subset of Y. | CERTIFIED (equivalent) |
| `subsetp-cons-same` | If Y is a cons of X and A, and Z is a cons of X and B, and A is a subset of B then Y is a subset of Z. | CERTIFIED (equivalent) |
| `subsetp-element-listxformer-of-elementlist-mapappend` |  | not found or not a single theorem |
| `subsetp-equal-of-intersection$-1` | If Z is an intersection of X and Y then Z is a subset of X. | CERTIFIED (equivalent) |
| `subsetp-equal-of-intersection$-2` | If Z is an intersection of X and Y then Z is a subset of Y. | CERTIFIED (equivalent) |
| `subsetp-equal-of-remove1-equal-left` |  | unsupported: no word for the function remove1-equal |
| `subsetp-implies-subsetp-cdr` | If X is a subset of Y then a tail of X is a subset of Y. | CERTIFIED (equivalent) |
| `subsetp-intersection-equal` | If X is an intersection of B and C, and A is a subset of X then A is a subset of B and A is a subset of C. If X is an intersection of B and C, and A is a subset of B, and A is a subset of C then A is a subset of X. | CERTIFIED (equivalent) |
| `subsetp-member` | If A is a member of X, and X is a subset of Y then A is a member of Y. | CERTIFIED (equivalent) |
| `subsetp-nil` | If there is something X then Nil is a subset of X. | CERTIFIED (equivalent) |
| `subsetp-of-append-when-subset-of-either` | If there is something A, and X is an append of B and C, and A is a subset of B or A is a subset of C then A is a subset of X. | CERTIFIED (equivalent) |
| `subsetp-of-cdr` | If Y is a tail of X then Y is a subset of X. | CERTIFIED (equivalent) |
| `subsetp-of-cons` | If a cons of A and X is a subset of Y then A is a member of Y and X is a subset of Y. If A is a member of Y, and X is a subset of Y then a cons of A and X is a subset of Y. | CERTIFIED (equivalent) |
| `subsetp-of-elementlist-mapappend-when-subset-of-element-listxformer` |  | not found or not a single theorem |
| `subsetp-of-last` | If Y is a last-pair of X then Y is a subset of X. | CERTIFIED (equivalent) |
| `subsetp-of-remove1` | If Z is a removal of A and Y, and X is a subset of Z then X is a subset of Y and A is not a member of X. If Z is a removal of A and Y, and X is a subset of Y, and A is not a member of X then X is a subset of Z. | CERTIFIED (equivalent) |
| `subsetp-of-remove2` | If Z is a removal of A and X, and X is a subset of Y then Z is a subset of Y. | CERTIFIED (equivalent) |
| `subsetp-of-repeat` |  | unsupported: no word for the test zp |
| `subsetp-of-revappend-when-subset-of-either` |  | not found or not a single theorem |
| `subsetp-of-take` | If a take of N and X is a subset of X then a length of X is not smaller than a natural-value of N or Nil is a member of X. If Y is a take of N and X, and a length of X is not smaller than a natural-value of N or Nil is a member of X then Y is a subset of X. | CERTIFIED (equivalent) |
| `subsetp-refl` | If there is something X then X is a subset of X. | CERTIFIED (equivalent) |
| `subsetp-revappend-2` |  | not found or not a single theorem |
| `subsetp-revappend1` |  | not found or not a single theorem |
| `subsetp-revappend3` |  | not found or not a single theorem |
| `subsetp-trans` | If X is a subset of Y, and Y is a subset of Z then X is a subset of Z. | CERTIFIED (equivalent) |
| `subsetp-trans2` | If Y is a subset of Z, and X is a subset of Y then X is a subset of Z. | CERTIFIED (equivalent) |
| `subsetp-when-atom-left` | If there is something Y, and X is atomic then X is a subset of Y. | CERTIFIED (equivalent) |
| `subsetp-when-atom-right` | If Y is atomic, and X is a subset of Y then X is atomic. If Y is atomic, and X is atomic then X is a subset of Y. | CERTIFIED (equivalent) |
| `subsetp-when-prefixp` | If X is a prefix of Y then X is a subset of Y. | CERTIFIED |
| `subsetp-witness-correct` |  | unsupported: hypothesis or conclusion (IMPLIES (MEMBER-EQUAL (SUBSETP-WITNESS X Y) X) (MEMBER-EQUAL (SUBSETP-WITNESS X Y) Y)) is not a test on one term |
| `subsetp-witness-rw` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (REWRITING-POSITIVE-LITERAL-FN (CONS (QUOTE SUBSETP-EQUAL) (CONS X (CONS Y (QUOTE NIL)))) MFC STATE))) (QUOTE (IF (REWRITING-POSITIVE-LITERAL-FN (CONS (QUOTE SUBSETP-EQUAL) (CONS X (CONS Y (QUOTE NIL)))) MFC STATE) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `suffixp-equals-nthcdr` | If U is a length of Y, and V is a length of X, and Z is a difference of U and V, and X is a suffix of Y then X is an nthcdr of Z and Y. If U is a length of Y, and V is a length of X, and Z is a difference of U and V, and X is an nthcdr of Z and Y then X is a suffix of Y. | CERTIFIED (equivalent) |
| `suffixp-of-cons-right` | If X is a cons of C and B, and A is a suffix of X then A is a cons of C and B or A is a suffix of B. If there is something A, and X is a cons of C and B, and A is X or A is a suffix of B then A is a suffix of X. | CERTIFIED (equivalent) |
| `suffixp-of-self` | If there is something X then X is a suffix of X. | CERTIFIED |
| `suffixp-transitive` | If B is a suffix of C, and A is a suffix of B then A is a suffix of C. | CERTIFIED |
| `take-after-update-nth` | If V is an update-nth of Y and U and X, and W is a take of Z and X, and a natural-value of Y is smaller than a natural-value of Z then a take of Z and V is an update-nth of Y and U and W. | CERTIFIED |
| `take-as-append-and-nth` |  | unsupported: no word for the test zp |
| `take-before-update-nth` | If V is an update-nth of Y and U and X, and W is a take of Z and V, and a natural-value of Y is not smaller than a natural-value of Z then W is a take of Z and X. | CERTIFIED |
| `take-fewer-of-take-more` | If Y is a take of B and X, and Z is a take of A and Y, and a natural-value of B is not smaller than a natural-value of A then Z is a take of A and X. | CERTIFIED |
| `take-more-of-take-fewer` | If Y is a take of B and X, and V is a natural-value of A, and W is a natural-value of B, and U is a difference of V and W, and Z is a repeat of U and Nil, and a natural-value of B is smaller than a natural-value of A then a take of A and Y is an append of Y and Z. | CERTIFIED |
| `take-of-1` | If Y is a take of 1 and X, and Z is a head of X then Y is a cons of Z and Nil. | CERTIFIED |
| `take-of-append` | If Z is an append of X and Y, and a natural-value of N is smaller than a length of X then a take of N and Z is a take of N and X. If U is an append of X and Y, and Z is a take of N and U, and P is a length of X, and W is a difference of N and P, and V is a take of W and Y, and a natural-value of N is not smaller than a length of X then Z is an append of X and V. | CERTIFIED (equivalent) |
| `take-of-cons` |  | unsupported: no word for the test zp |
| `take-of-len` | If Y is a length of X then a take of Y and X is a list-fix of X. | CERTIFIED |
| `take-of-len-free` | If a length of X is Y then a take of Y and X is a list-fix of X. | CERTIFIED (equivalent) |
| `take-of-repeat` | If Y is a repeat of K and A, and X is a take of N and Y, and a natural-value of K is not smaller than a natural-value of N then X is a repeat of N and A. If X is a repeat of K and A, and U is a natural-value of N, and V is a natural-value of K, and Z is a difference of U and V, and Y is a repeat of Z and Nil, and a natural-value of K is smaller than a natural-value of N then a take of N and X is an append of X and Y. | CERTIFIED (equivalent) |
| `take-of-take-same` | If Y is a take of A and X then a take of A and Y is Y. | CERTIFIED |
| `take-of-take-split` | If Z is a take of B and X, and Y is a take of A and Z, and a natural-value of B is not smaller than a natural-value of A then Y is a take of A and X. If Y is a take of B and X, and V is a natural-value of A, and W is a natural-value of B, and U is a difference of V and W, and Z is a repeat of U and Nil, and a natural-value of B is smaller than a natural-value of A then a take of A and Y is an append of Y and Z. | CERTIFIED (equivalent) |
| `take-of-too-many` | If Y is a take of N and X, and V is a natural-value of N, and W is a length of X, and U is a difference of V and W, and Z is a repeat of U and Nil, and a natural-value of N is not smaller than a length of X then Y is an append of X and Z. | CERTIFIED |
| `take-of-update-nth` | If W is an update-nth of Z and U and X, and V is a take of Y and W, and a natural-value of Z is not smaller than a natural-value of Y then V is a take of Y and X. If V is an update-nth of Z and U and X, and W is a take of Y and X, and a natural-value of Z is smaller than a natural-value of Y then a take of Y and V is an update-nth of Z and U and W. | CERTIFIED (equivalent) |
| `take-of-zero` | If Y is a take of 0 and X then Y is Nil. | CERTIFIED |
| `take-under-iff` |  | unsupported: no word for the test zp |
| `take-when-atom` | If Y is a take of N and X, and X is atomic then Y is a repeat of N and Nil. | CERTIFIED |
| `take-when-prefixp` | If Z is a length of X, and X is a prefix of Y then a take of Z and Y is a list-fix of X. | CERTIFIED |
| `test1` |  | not found or not a single theorem |
| `test2` |  | not found or not a single theorem |
| `third-of-take` | If Y is a take of N and X, and a natural-value of N is not smaller than 3 then a head of a tail of a tail of Y is a head of a tail of a tail of X. | CERTIFIED |
| `true-listp-of-add-to-set-equal` |  | unsupported: no word for the function add-to-set-equal |
| `true-listp-of-add-to-set-equal-type` |  | unsupported: no word for the function add-to-set-equal |
| `true-listp-of-append` | If an append of X and Y is a true-list then Y is a true-list. If Z is an append of X and Y, and Y is a true-list then Z is a true-list. | CERTIFIED (equivalent) |
| `true-listp-of-cons` | If a cons of A and X is a true-list then X is a true-list. If Y is a cons of A and X, and X is a true-list then Y is a true-list. | CERTIFIED (equivalent) |
| `true-listp-of-flatten` | If Y is a flattening of X then Y is a true-list. | CERTIFIED |
| `true-listp-of-last` | If a last-pair of L is a true-list then L is a true-list. If L is a true-list then a last-pair of L is a true-list. | CERTIFIED (equivalent) |
| `true-listp-of-list-fix` | If Y is a list-fix of X then Y is a true-list. | CERTIFIED |
| `true-listp-of-nthcdr` | If an nthcdr of N and X is a true-list then X is a true-list or a length of X is smaller than a natural-value of N. If Y is an nthcdr of N and X, and X is a true-list or a length of X is smaller than a natural-value of N then Y is a true-list. | CERTIFIED (equivalent) |
| `true-listp-of-rev` |  | not found or not a single theorem |
| `true-listp-of-revappend` | If a revappend of X and Y is a true-list then Y is a true-list. If Z is a revappend of X and Y, and Y is a true-list then Z is a true-list. | CERTIFIED (equivalent) |
| `true-listp-of-reverse` |  | unsupported: no word for the test stringp |
| `true-listp-of-union-equal` | If an union of X and Y is a true-list then Y is a true-list. If Z is an union of X and Y, and Y is a true-list then Z is a true-list. | CERTIFIED (equivalent) |
| `true-listp-of-union-equal-type` | If Z is an union of X and Y, and Y is a true-list then Z is a true-list. | CERTIFIED |
| `true-listp-of-update-nth` | If an update-nth of N and V and X is a true-list then a natural-value of N is not smaller than a length of X or X is a true-list. If Y is an update-nth of N and V and X, and a natural-value of N is not smaller than a length of X or X is a true-list then Y is a true-list. | CERTIFIED (equivalent) |
| `true-listp-when-atom` | If X is atomic, and X is a true-list then X is Nil. If X is atomic, and X is Nil then X is a true-list. | CERTIFIED (equivalent) |
| `type-of-rcons` | If Y is a rcons of A and X then Y is a pair and Y is a true-list. | CERTIFIED |
| `union-equal-under-set-equiv` | If X is an union of A and B then X is set-equivalent-to an append of A and B. | CERTIFIED |
| `update-nth-append` | If Y is an append of A and B, and X is an update-nth of N and V and Y, and Z is an update-nth of N and V and A, and a natural-value of N is smaller than a length of A then X is an append of Z and B. If Y is an append of A and B, and X is an update-nth of N and V and Y, and W is a length of A, and U is a difference of N and W, and Z is an update-nth of U and V and B, and a natural-value of N is not smaller than a length of A then X is an append of A and Z. | CERTIFIED (equivalent) |
| `update-nth-diff-gather-constants` |  | unsupported: hypothesis or conclusion (SYNP NIL (QUOTE (SYNTAXP (AND (QUOTEP X) (QUOTEP N) (QUOTEP VAL1) (OR (NOT (QUOTEP M)) (NOT (QUOTEP VAL2)))))) (QUOTE (IF (IF (QUOTEP X) (IF (QUOTEP N) (IF (QUOTEP VAL1) (IF (NOT (QUOTEP M)) (NOT (QUOTEP M)) (NOT (QUOTEP VAL2))) (QUOTE NIL)) (QUOTE NIL)) (QUOTE NIL)) (QUOTE T) (QUOTE NIL)))) is not a test on one term |
| `update-nth-of-cons` |  | unsupported: no word for the test zp |
| `update-nth-of-nth` | If Y is an nth of N and X, and a natural-value of N is smaller than a length of X then an update-nth of N and Y and X is X. | CERTIFIED |
| `update-nth-of-nth-free` | If an nth of N and X is Y, and a natural-value of N is smaller than a length of X then an update-nth of N and Y and X is X. | CERTIFIED |
| `update-nth-of-nth-other` |  | not found or not a single theorem |
| `update-nth-of-update-nth-diff` | If P is an update-nth of Z and V and X, and W is an update-nth of Y and U and P, and Q is an update-nth of Y and U and X, and a natural-value of Y is not a natural-value of Z then W is an update-nth of Z and V and Q. | CERTIFIED |
| `update-nth-of-update-nth-same` | If U is an update-nth of N and Z and X, and V is an update-nth of N and Y and U then V is an update-nth of N and Y and X. | CERTIFIED |
| `update-nth-when-atom` | If Y is an update-nth of N and V and X, and Z is a repeat of N and Nil, and U is a cons of V and Nil, and X is atomic then Y is an append of Z and U. | CERTIFIED |
| `update-nth-when-zp` |  | unsupported: no word for the test zp |
| `upper-bound-of-len-of-last` | If Y is a last-pair of X then a length of Y is smaller than 2. | CERTIFIED |
| `upper-bound-of-len-of-remove-strong` | If A is a member of X then a length of a removal of A and X is smaller than a length of X. | CERTIFIED (equivalent) |
| `upper-bound-of-len-of-remove-weak` | If Y is a length of X, and Z is a removal of A and X then Y is not smaller than a length of Z. | CERTIFIED (equivalent) |
| `use-butlast-induction` |  | not found or not a single theorem |
