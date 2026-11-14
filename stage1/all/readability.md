# Readability of certified sentences

- Certified texts: 318
- Words per text: median 29.0, mean 35.5, longest 138
- Texts with no named intermediate (no "Y is an F of X" clause): 47
- Texts of two sentences (equivalences): 116
- Named intermediates per text: mean 1.8

## Shortest five

- `no-duplicatesp-equal-when-atom` (8 words): If X is atomic then X is duplicate-free.
- `final-cdr-when-atom` (11 words): If X is atomic then a final-cdr of X is X.
- `last-when-atom` (11 words): If X is atomic then a last-pair of X is X.
- `len-when-atom` (11 words): If X is atomic then a length of X is 0.
- `remove-duplicates-equal-when-atom` (11 words): If X is atomic then a deduplication of X is Nil.

## Longest five

- `take-of-take-split` (107 words): If Z is a take of B and X, and Y is a take of A and Z, and a natural-value of B is not smaller than a natural-value of A then Y is a take of A and X. If Y is a take of B and X, and V is a natural-value of A, and W is a natural-value of B, and U is a difference of V and W, and Z is a repeat of U and Nil, and a natural-value of B is smaller than a natural-value of A then a take of A and Y is an append of Y and Z.
- `nthcdr-of-update-nth` (113 words): If V is an update-nth of Z and U and X, and a natural-value of Z is smaller than a natural-value of Y then an nthcdr of Y and V is an nthcdr of Y and X. If W is an update-nth of Z and U and X, and V is an nthcdr of Y and W, and Q is a natural-value of Z, and R is a natural-value of Y, and P is a difference of Q and R, and S is an nthcdr of Y and X, and a natural-value of Z is not smaller than a natural-value of Y then V is an update-nth of P and U and S.
- `update-nth-append` (121 words): If Y is an append of A and B, and X is an update-nth of N and V and Y, and Z is an update-nth of N and V and A, and a natural-value of N is smaller than a length of A then X is an append of Z and B. If Y is an append of A and B, and X is an update-nth of N and V and Y, and W is a length of A, and U is a difference of N and W, and Z is an update-nth of U and V and B, and a natural-value of N is not smaller than a length of A then X is an append of A and Z.
- `nth-of-revappend` (123 words): If Z is a revappend of X and Y, and V is a length of X, and P is a natural-value of N, and W is a sum of 1 and P, and U is a difference of V and W, and a natural-value of N is smaller than a length of X then an nth of N and Z is an nth of U and X. If U is a revappend of X and Y, and Z is an nth of N and U, and W is a length of X, and V is a difference of N and W, and a natural-value of N is not smaller than a length of X then Z is an nth of V and Y.
- `prefixp-of-append-arg1` (138 words): If U is a length of X, and V is a length of Y, and W is an nthcdr of U and Z, and an append of X and Y is a prefix of Z then a length of Z is not smaller than a sum of U and V and a list-fix of X is a take of U and Z and Y is a prefix of W. If U is a length of X, and V is an nthcdr of U and Z, and W is a length of Y, and a list-fix of X is a take of U and Z, and Y is a prefix of V, and a length of Z is not smaller than a sum of U and W then an append of X and Y is a prefix of Z.
