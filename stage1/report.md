# Stage 1 report

**25 of 25 theorems certified.** Certified means: the English compiles to a statement that is identical to the library theorem, up to the names of variables. The match is found here, and confirmed inside ACL2 when `acl2/stage1-claims.lisp` certifies, which also proves each claim.

| Theorem | English | Result |
|---|---|---|
| `len-of-append` | If Z is an append of X and Y, and U is a length of X, and V is a length of Y then a length of Z is a sum of U and V. | CERTIFIED |
| `len-of-rev` | If Y is a reversal of X then a length of Y is a length of X. | CERTIFIED |
| `rev-of-append` | If Z is an append of X and Y, and U is a reversal of Y, and V is a reversal of X then a reversal of Z is an append of U and V. | CERTIFIED |
| `rev-of-rev` | If Y is a reversal of X then a reversal of Y is a list-fix of X. | CERTIFIED |
| `len-of-list-fix` | If Y is a list-fix of X then a length of Y is a length of X. | CERTIFIED |
| `rev-of-list-fix` | If Y is a list-fix of X then a reversal of Y is a reversal of X. | CERTIFIED |
| `list-fix-of-append` | If Z is an append of X and Y, and U is a list-fix of Y then a list-fix of Z is an append of X and U. | CERTIFIED |
| `append-of-nil` | If Y is an append of X and Nil then Y is a list-fix of X. | CERTIFIED |
| `true-listp-of-list-fix` | If Y is a list-fix of X then Y is a true-list. | CERTIFIED |
| `list-fix-when-true-listp` | If X is a true-list then a list-fix of X is X. | CERTIFIED |
| `reverse-removal` | If X is a true-list then a reverse of X is a reversal of X. | CERTIFIED |
| `revappend-removal` | If Z is a revappend of X and Y, and U is a reversal of X then Z is an append of U and Y. | CERTIFIED |
| `len-of-take` | If Y is a take of N and X then a length of Y is a natural-value of N. | CERTIFIED |
| `len-of-repeat` | If Y is a repeat of N and X then a length of Y is a natural-value of N. | CERTIFIED |
| `append-of-cons` | If Z is a cons of A and X, and U is an append of Z and Y, and V is an append of X and Y then U is a cons of A and V. | CERTIFIED |
| `append-when-not-consp` | If Z is an append of X and Y, and X is not a pair then Z is Y. | CERTIFIED |
| `len-when-atom` | If X is atomic then a length of X is 0. | CERTIFIED |
| `nthcdr-of-nthcdr` | If Z is an nthcdr of B and X, and Y is an nthcdr of A and Z, and V is a natural-value of A, and W is a natural-value of B, and U is a sum of V and W then Y is an nthcdr of U and X. | CERTIFIED |
| `len-of-nthcdr` | If X is an nthcdr of N and L, and Y is a length of L, and Z is a natural-value of N then a length of X is a natural-value of a difference of Y and Z. | CERTIFIED |
| `take-of-len-free` | If a length of X is Y then a take of Y and X is a list-fix of X. | CERTIFIED (equivalent) |
| `true-listp-of-append` | If an append of X and Y is a true-list then Y is a true-list. If Z is an append of X and Y, and Y is a true-list then Z is a true-list. | CERTIFIED (equivalent) |
| `consp-of-append` | If an append of X and Y is a pair then X is a pair or Y is a pair. If Z is an append of X and Y, and X is a pair or Y is a pair then Z is a pair. | CERTIFIED (equivalent) |
| `car-of-append` | If Z is an append of X and Y, and X is a pair then a head of Z is a head of X. If Z is an append of X and Y, and X is not a pair then a head of Z is a head of Y. | CERTIFIED (equivalent) |
| `take-of-append` | If Z is an append of X and Y, and a natural-value of N is smaller than a length of X then a take of N and Z is a take of N and X. If U is an append of X and Y, and Z is a take of N and U, and P is a length of X, and W is a difference of N and P, and V is a take of W and Y, and a natural-value of N is not smaller than a length of X then Z is an append of X and V. | CERTIFIED (equivalent) |
| `member-of-append` | If Z is an append of X and Y, and A is a member of Z then A is a member of X or A is a member of Y. If there is something A, and Z is an append of X and Y, and A is a member of X or A is a member of Y then A is a member of Z. | CERTIFIED (equivalent) |
