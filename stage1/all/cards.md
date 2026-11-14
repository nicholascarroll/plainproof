# Review cards for certified sentences

### `append-atom-under-list-equiv`

- **English:** If Z is an append of X and Y, and Y is atomic then Z is list-equivalent-to X.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and X3 is atomic then X1 is list-equivalent-to X2.
- **Compiled:** `(implies (atom y) (list-equiv (append x y) x))`
- **Library theorem:** `(implies (atom y) (list-equiv (append x y) x))`

### `append-of-cons`

- **English:** If Z is a cons of A and X, and U is an append of Z and Y, and V is an append of X and Y then U is a cons of A and V.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is an append of X1 and something X5 and something X6 is an append of X3 and X5 then X4 is a cons of X2 and X6.
- **Compiled:** `(equal (append (cons a x) y) (cons a (append x y)))`
- **Library theorem:** `(equal (append (cons a x) y) (cons a (append x y)))`

### `append-of-nil`

- **English:** If Y is an append of X and Nil then Y is a list-fix of X.
- **Attempto's reading:** If something X1 is an append of something X2 and Nil then X1 is a list-fix of X2.
- **Compiled:** `(equal (append x nil) (true-list-fix x))`
- **Library theorem:** `(equal (append x nil) (true-list-fix x))`

### `append-of-rcons`

- **English:** If Z is a rcons of A and X, and U is an append of Z and Y, and V is a cons of A and Y then U is an append of X and V.
- **Attempto's reading:** If something X1 is a rcons of something X2 and something X3 and something X4 is an append of X1 and something X5 and something X6 is a cons of X2 and X5 then X4 is an append of X3 and X6.
- **Compiled:** `(equal (append (rcons a x) y) (append x (cons a y)))`
- **Library theorem:** `(equal (append (rcons a x) y) (append x (cons a y)))`

### `append-of-repeat-to-cons-of-same`

- **English:** If Y is a repeat of N and A, and Z is a cons of A and X, and U is an append of Y and X then an append of Y and Z is a cons of A and U.
- **Attempto's reading:** If something X1 is a repeat of something and something X2 and something X3 is a cons of X2 and something X4 and something X5 is an append of X1 and X4 then an append of X1 and X3 is a cons of X2 and X5.
- **Compiled:** `(equal (append (repeat n a) (cons a x)) (cons a (append (repeat n a) x)))`
- **Library theorem:** `(equal (append (repeat n a) (cons a x)) (cons a (append (repeat n a) x)))`

### `append-of-take-and-nthcdr`

- **English:** If Y is a take of N and X, and Z is an nthcdr of N and X, and a length of X is not smaller than a natural-value of N then an append of Y and Z is X.
- **Attempto's reading:** If there is a length X1 of something X2 and something X3 is a take of something X4 and X2 and something X5 is a nthcdr of X4 and X2 and it is false that the length X1 is smaller than a natural-value of X4 then an append of X3 and X5 is X2.
- **Compiled:** `(implies (not (< (len x) (nfix n))) (equal (append (take n x) (nthcdr n x)) x))`
- **Library theorem:** `(implies (<= (nfix n) (len x)) (equal (append (take n x) (nthcdr n x)) x))`

### `append-self-onto-final-cdr`

- **English:** If Y is a final-cdr of X then an append of X and Y is X.
- **Attempto's reading:** If something X1 is a final-cdr of something X2 then an append of X2 and X1 is X2.
- **Compiled:** `(equal (append x (final-cdr x)) x)`
- **Library theorem:** `(equal (append x (final-cdr x)) x)`

### `append-singleton-under-set-equiv`

- **English:** If Z is a cons of A and Nil, and Y is an append of X and Z then Y is set-equivalent-to a cons of A and X.
- **Attempto's reading:** If something X1 is a cons of something X2 and Nil and something X3 is an append of something X4 and X1 then X3 is set-equivalent-to a cons of X2 and X4.
- **Compiled:** `(set-equiv (append x (cons a nil)) (cons a x))`
- **Library theorem:** `(set-equiv (append x (list a)) (cons a x))`

### `append-under-iff`

- **English:** If Z is an append of X and Y, and Z is not Nil then X is a pair or Y is not Nil. If Z is an append of X and Y, and X is a pair or Y is not Nil then Z is not Nil.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and it is false that X1 is Nil then X2 is a pair or it is false that X3 is Nil. If something X1 is an append of something X2 and something X3, and X2 is a pair or it is false that X3 is Nil then it is false that X1 is Nil.
- **Compiled:** `(and (implies (not (equal (append x y) nil)) (or (consp x) (not (equal y nil)))) (implies (or (consp x) (not (equal y nil))) (not (equal (append x y) nil))))`
- **Library theorem:** `(iff (append x y) (or (consp x) y))`

### `append-when-not-consp`

- **English:** If Z is an append of X and Y, and X is not a pair then Z is Y.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and it is false that X2 is a pair then X1 is X3.
- **Compiled:** `(implies (not (consp x)) (equal (append x y) y))`
- **Library theorem:** `(implies (not (consp x)) (equal (append x y) y))`

### `associativity-of-append`

- **English:** If X is an append of A and B, and Y is an append of X and C, and Z is an append of B and C then Y is an append of A and Z.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is an append of X1 and something X5 and something X6 is an append of X3 and X5 then X4 is an append of X2 and X6.
- **Compiled:** `(equal (append (append a b) c) (append a (append b c)))`
- **Library theorem:** `(equal (append (append a b) c) (append a b c))`

### `cancel-append-self-2-under-set-equiv`

- **English:** If Z is an append of X and Y then an append of X and Z is set-equivalent-to Z.
- **Attempto's reading:** If something X1 is an append of something X2 and something then an append of X2 and X1 is set-equivalent-to X1.
- **Compiled:** `(set-equiv (append x (append x y)) (append x y))`
- **Library theorem:** `(set-equiv (append x x y) (append x y))`

### `car-of-append`

- **English:** If Z is an append of X and Y, and X is a pair then a head of Z is a head of X. If Z is an append of X and Y, and X is not a pair then a head of Z is a head of Y.
- **Attempto's reading:** If something X1 is an append of something X2 and something and X2 is a pair then a head of X1 is a head of X2. If something X1 is an append of something X2 and something X3 and it is false that X2 is a pair then a head of X1 is a head of X3.
- **Compiled:** `(and (implies (consp x) (equal (car (append x y)) (car x))) (implies (not (consp x)) (equal (car (append x y)) (car y))))`
- **Library theorem:** `(equal (car (append x y)) (if (consp x) (car x) (car y)))`

### `car-of-append-when-consp`

- **English:** If Z is an append of X and Y, and X is a pair then a head of Z is a head of X.
- **Attempto's reading:** If something X1 is an append of something X2 and something and X2 is a pair then a head of X1 is a head of X2.
- **Compiled:** `(implies (consp x) (equal (car (append x y)) (car x)))`
- **Library theorem:** `(implies (consp x) (equal (car (append x y)) (car x)))`

### `car-of-list-fix`

- **English:** If Y is a list-fix of X then a head of Y is a head of X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 then a head of X1 is a head of X2.
- **Compiled:** `(equal (car (true-list-fix x)) (car x))`
- **Library theorem:** `(equal (car (true-list-fix x)) (car x))`

### `car-of-nthcdr`

- **English:** If Y is an nthcdr of I and X then a head of Y is an nth of I and X.
- **Attempto's reading:** If something X1 is a nthcdr of something X2 and something X3 then a head of X1 is a nth of X2 and X3.
- **Compiled:** `(equal (car (nthcdr i x)) (nth i x))`
- **Library theorem:** `(equal (car (nthcdr i x)) (nth i x))`

### `car-of-repeat-increment`

- **English:** If Z is a sum of 1 and N, and Y is a repeat of Z and X, and N is natural then a head of Y is X.
- **Attempto's reading:** If something X1 is a sum of 1 and something X2 and something X3 is a repeat of X1 and something X4 and X2 is natural then a head of X3 is X4.
- **Compiled:** `(implies (natp n) (equal (car (repeat (+ 1 n) x)) x))`
- **Library theorem:** `(implies (natp n) (equal (car (repeat (+ 1 n) x)) x))`

### `car-of-take`

- **English:** If Y is a take of N and X, and a natural-value of N is not smaller than 1 then a head of Y is a head of X.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is a take of X2 and something X4 and it is false that the natural-value X1 is smaller than 1 then a head of X3 is a head of X4.
- **Compiled:** `(implies (not (< (nfix n) 1)) (equal (car (take n x)) (car x)))`
- **Library theorem:** `(implies (<= 1 (nfix n)) (equal (car (take n x)) (car x)))`

### `cdr-of-append`

- **English:** If Z is an append of X and Y, and U is a tail of X, and X is a pair then a tail of Z is an append of U and Y. If Z is an append of X and Y, and X is not a pair then a tail of Z is a tail of Y.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and X2 is a pair and something X4 is a tail of X2 then a tail of X1 is an append of X4 and X3. If something X1 is an append of something X2 and something X3 and it is false that X2 is a pair then a tail of X1 is a tail of X3.
- **Compiled:** `(and (implies (consp x) (equal (cdr (append x y)) (append (cdr x) y))) (implies (not (consp x)) (equal (cdr (append x y)) (cdr y))))`
- **Library theorem:** `(equal (cdr (append x y)) (if (consp x) (append (cdr x) y) (cdr y)))`

### `cdr-of-append-when-consp`

- **English:** If Z is an append of X and Y, and U is a tail of X, and X is a pair then a tail of Z is an append of U and Y.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and X2 is a pair and something X4 is a tail of X2 then a tail of X1 is an append of X4 and X3.
- **Compiled:** `(implies (consp x) (equal (cdr (append x y)) (append (cdr x) y)))`
- **Library theorem:** `(implies (consp x) (equal (cdr (append x y)) (append (cdr x) y)))`

### `cdr-of-list-fix`

- **English:** If Y is a list-fix of X then a tail of Y is a list-fix of a tail of X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 then a tail of X1 is a list-fix of a tail of X2.
- **Compiled:** `(equal (cdr (true-list-fix x)) (true-list-fix (cdr x)))`
- **Library theorem:** `(equal (cdr (true-list-fix x)) (true-list-fix (cdr x)))`

### `cdr-of-repeat-increment`

- **English:** If Z is a sum of 1 and N, and Y is a repeat of Z and X, and N is natural then a tail of Y is a repeat of N and X.
- **Attempto's reading:** If something X1 is a sum of 1 and something X2 and something X3 is a repeat of X1 and something X4 and X2 is natural then a tail of X3 is a repeat of X2 and X4.
- **Compiled:** `(implies (natp n) (equal (cdr (repeat (+ 1 n) x)) (repeat n x)))`
- **Library theorem:** `(implies (natp n) (equal (cdr (repeat (+ 1 n) x)) (repeat n x)))`

### `commutativity-2-of-append-under-set-equiv`

- **English:** If V is an append of Y and Z, and U is an append of X and V, and W is an append of X and Z then U is set-equivalent-to an append of Y and W.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is an append of something X5 and X1 and something X6 is an append of X5 and X3 then X4 is set-equivalent-to an append of X2 and X6.
- **Compiled:** `(set-equiv (append x (append y z)) (append y (append x z)))`
- **Library theorem:** `(set-equiv (append x y z) (append y x z))`

### `commutativity-2-of-append-under-set-equiv-corollary-1`

- **English:** If U is a cons of X and Z, and Y is set-equivalent-to a cons of W and Z then a cons of W and U is set-equivalent-to a cons of X and Y.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is set-equivalent-to a cons of something X5 and X3 then a cons of X5 and X1 is set-equivalent-to a cons of X2 and X4.
- **Compiled:** `(implies (set-equiv y (cons w z)) (set-equiv (cons w (cons x z)) (cons x y)))`
- **Library theorem:** `(implies (set-equiv y (cons w z)) (set-equiv (list* w x z) (cons x y)))`

### `commutativity-2-of-append-under-set-equiv-corollary-2`

- **English:** If U is a tail of Y, and Z is a cons of X and U, and V is a head of Y, and Y is a pair then a cons of V and Z is set-equivalent-to a cons of X and Y.
- **Attempto's reading:** If something X1 is a tail of something X2 and something X3 is a cons of something X4 and X1 and X2 is a pair and something X5 is a head of X2 then a cons of X5 and X3 is set-equivalent-to a cons of X4 and X2.
- **Compiled:** `(implies (consp y) (set-equiv (cons (car y) (cons x (cdr y))) (cons x y)))`
- **Library theorem:** `(implies (consp y) (set-equiv (list* (car y) x (cdr y)) (cons x y)))`

### `commutativity-of-append-under-set-equiv`

- **English:** If Z is an append of X and Y then Z is set-equivalent-to an append of Y and X.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 then X1 is set-equivalent-to an append of X3 and X2.
- **Compiled:** `(set-equiv (append x y) (append y x))`
- **Library theorem:** `(set-equiv (append x y) (append y x))`

### `cons-under-set-equiv-1`

- **English:** If Z is a cons of X and Y then a cons of X and Z is set-equivalent-to Z.
- **Attempto's reading:** If something X1 is a cons of something X2 and something then a cons of X2 and X1 is set-equivalent-to X1.
- **Compiled:** `(set-equiv (cons x (cons x y)) (cons x y))`
- **Library theorem:** `(set-equiv (list* x x y) (cons x y))`

### `consp-of-append`

- **English:** If an append of X and Y is a pair then X is a pair or Y is a pair. If Z is an append of X and Y, and X is a pair or Y is a pair then Z is a pair.
- **Attempto's reading:** If an append of something X1 and something X2 is a pair then X1 is a pair or X2 is a pair. If something X1 is an append of something X2 and something X3, and X2 is a pair or X3 is a pair then X1 is a pair.
- **Compiled:** `(and (implies (consp (append x y)) (or (consp x) (consp y))) (implies (or (consp x) (consp y)) (consp (append x y))))`
- **Library theorem:** `(equal (consp (append x y)) (or (consp x) (consp y)))`

### `consp-of-last`

- **English:** If a last-pair of L is a pair then L is a pair. If L is a pair then a last-pair of L is a pair.
- **Attempto's reading:** If a last-pair of something X1 is a pair then X1 is a pair. If something X1 is a pair then a last-pair of X1 is a pair.
- **Compiled:** `(and (implies (consp (last l)) (consp l)) (implies (consp l) (consp (last l))))`
- **Library theorem:** `(equal (consp (last l)) (consp l))`

### `consp-of-list-fix`

- **English:** If a list-fix of X is a pair then X is a pair. If X is a pair then a list-fix of X is a pair.
- **Attempto's reading:** If a list-fix of something X1 is a pair then X1 is a pair. If something X1 is a pair then a list-fix of X1 is a pair.
- **Compiled:** `(and (implies (consp (true-list-fix x)) (consp x)) (implies (consp x) (consp (true-list-fix x))))`
- **Library theorem:** `(equal (consp (true-list-fix x)) (consp x))`

### `consp-of-nthcdr`

- **English:** If an nthcdr of N and X is a pair then a natural-value of N is smaller than a length of X. If a natural-value of N is smaller than a length of X then an nthcdr of N and X is a pair.
- **Attempto's reading:** If a nthcdr of something X1 and something X2 is a pair then a natural-value of X1 is smaller than a length of X2. If a natural-value of something X1 is smaller than a length of something X2 then a nthcdr of X1 and X2 is a pair.
- **Compiled:** `(and (implies (consp (nthcdr n x)) (< (nfix n) (len x))) (implies (< (nfix n) (len x)) (consp (nthcdr n x))))`
- **Library theorem:** `(equal (consp (nthcdr n x)) (< (nfix n) (len x)))`

### `consp-of-remove`

- **English:** If Y is a cons of A and Nil, and a removal of A and X is a pair then X is not a subset of Y. If Y is a removal of A and X, and Z is a cons of A and Nil, and X is not a subset of Z then Y is a pair.
- **Attempto's reading:** If something X1 is a cons of something X2 and Nil and a removal of X2 and something X3 is a pair then it is false that X3 is a subset of X1. If something X1 is a removal of something X2 and something X3 and something X4 is a cons of X2 and Nil and it is false that X3 is a subset of X4 then X1 is a pair.
- **Compiled:** `(and (implies (consp (remove-equal a x)) (not (subsetp-equal x (cons a nil)))) (implies (not (subsetp-equal x (cons a nil))) (consp (remove-equal a x))))`
- **Library theorem:** `(equal (consp (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l)))) (not (let ((y (list a))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))))`

### `consp-of-remove-duplicates-equal`

- **English:** If a deduplication of X is a pair then X is a pair. If X is a pair then a deduplication of X is a pair.
- **Attempto's reading:** If a deduplication of something X1 is a pair then X1 is a pair. If something X1 is a pair then a deduplication of X1 is a pair.
- **Compiled:** `(and (implies (consp (remove-duplicates-equal x)) (consp x)) (implies (consp x) (consp (remove-duplicates-equal x))))`
- **Library theorem:** `(equal (consp (remove-duplicates-equal x)) (consp x))`

### `consp-of-rev`

- **English:** If a reversal of X is a pair then X is a pair. If X is a pair then a reversal of X is a pair.
- **Attempto's reading:** If a reversal of something X1 is a pair then X1 is a pair. If something X1 is a pair then a reversal of X1 is a pair.
- **Compiled:** `(and (implies (consp (rev x)) (consp x)) (implies (consp x) (consp (rev x))))`
- **Library theorem:** `(equal (consp (rev x)) (consp x))`

### `consp-of-revappend`

- **English:** If a revappend of X and Y is a pair then X is a pair or Y is a pair. If Z is a revappend of X and Y, and X is a pair or Y is a pair then Z is a pair.
- **Attempto's reading:** If a revappend of something X1 and something X2 is a pair then X1 is a pair or X2 is a pair. If something X1 is a revappend of something X2 and something X3, and X2 is a pair or X3 is a pair then X1 is a pair.
- **Compiled:** `(and (implies (consp (revappend x y)) (or (consp x) (consp y))) (implies (or (consp x) (consp y)) (consp (revappend x y))))`
- **Library theorem:** `(equal (consp (revappend x y)) (or (consp x) (consp y)))`

### `consp-under-iff-when-true-listp`

- **English:** If X is a true-list, and X is a pair then X is not Nil. If X is a true-list, and X is not Nil then X is a pair.
- **Attempto's reading:** Nothing that is a true-list and that is a pair is Nil. Everything that is a true-list and that is not Nil is a pair.
- **Compiled:** `(and (implies (and (true-listp x) (consp x)) (not (equal x nil))) (implies (and (true-listp x) (not (equal x nil))) (consp x)))`
- **Library theorem:** `(implies (true-listp x) (iff (consp x) x))`

### `duplicity-in-of-remove-duplicates-equal`

- **English:** If Y is a deduplication of X, and A is a member of X then a duplicity of A and Y is 1. If Z is a deduplication of X, and Y is a duplicity of A and Z, and A is not a member of X then Y is 0.
- **Attempto's reading:** If something X1 is a deduplication of something X2 and something X3 is a member of X2 then a duplicity of X3 and X1 is 1. If something X1 is a deduplication of something X2 and something X3 is a duplicity of something X4 and X1 and it is false that X4 is a member of X2 then X3 is 0.
- **Compiled:** `(and (implies (member-equal a x) (equal (duplicity a (remove-duplicates-equal x)) 1)) (implies (not (member-equal a x)) (equal (duplicity a (remove-duplicates-equal x)) 0)))`
- **Library theorem:** `(equal (duplicity a (remove-duplicates-equal x)) (if (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) 1 0))`

### `duplicity-of-append`

- **English:** If U is an append of X and Y, and Z is a duplicity of A and U, and V is a duplicity of A and X, and W is a duplicity of A and Y then Z is a sum of V and W.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a duplicity of something X5 and X1 and something X6 is a duplicity of X5 and X2 and something X7 is a duplicity of X5 and X3 then X4 is a sum of X6 and X7.
- **Compiled:** `(equal (duplicity a (append x y)) (+ (duplicity a x) (duplicity a y)))`
- **Library theorem:** `(equal (duplicity a (append x y)) (+ (duplicity a x) (duplicity a y)))`

### `duplicity-of-cons`

- **English:** If Y is a cons of B and X, and Z is a duplicity of A and X, and A is B then a duplicity of A and Y is a sum of 1 and Z. If Z is a cons of B and X, and Y is a duplicity of A and Z, and A is not B then Y is a duplicity of A and X.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is X2 and something X5 is a duplicity of X4 and X3 then a duplicity of X4 and X1 is a sum of 1 and X5. If something X1 is a cons of something X2 and something X3 and something X4 is a duplicity of something X5 and X1 and it is false that X5 is X2 then X4 is a duplicity of X5 and X3.
- **Compiled:** `(and (implies (equal a b) (equal (duplicity a (cons b x)) (+ 1 (duplicity a x)))) (implies (not (equal a b)) (equal (duplicity a (cons b x)) (duplicity a x))))`
- **Library theorem:** `(equal (duplicity a (cons b x)) (if (equal a b) (+ 1 (duplicity a x)) (duplicity a x)))`

### `duplicity-of-flatten-of-rev`

- **English:** If Z is a flattening of a reversal of X, and Y is a duplicity of A and Z, and U is a flattening of X then Y is a duplicity of A and U.
- **Attempto's reading:** If something X1 is a flattening of a reversal of something X2 and something X3 is a duplicity of something X4 and X1 and something X5 is a flattening of X2 then X3 is a duplicity of X4 and X5.
- **Compiled:** `(equal (duplicity a (flatten (rev x))) (duplicity a (flatten x)))`
- **Library theorem:** `(equal (duplicity a (flatten (rev x))) (duplicity a (flatten x)))`

### `duplicity-of-list-fix`

- **English:** If Z is a list-fix of X, and Y is a duplicity of A and Z then Y is a duplicity of A and X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 and something X3 is a duplicity of something X4 and X1 then X3 is a duplicity of X4 and X2.
- **Compiled:** `(equal (duplicity a (true-list-fix x)) (duplicity a x))`
- **Library theorem:** `(equal (duplicity a (true-list-fix x)) (duplicity a x))`

### `duplicity-of-remove`

- **English:** If Y is a removal of B and X, and A is B then a duplicity of A and Y is 0. If Z is a removal of B and X, and Y is a duplicity of A and Z, and A is not B then Y is a duplicity of A and X.
- **Attempto's reading:** If something X1 is a removal of something X2 and something and something X3 is X2 then a duplicity of X3 and X1 is 0. If something X1 is a removal of something X2 and something X3 and something X4 is a duplicity of something X5 and X1 and it is false that X5 is X2 then X4 is a duplicity of X5 and X3.
- **Compiled:** `(and (implies (equal a b) (equal (duplicity a (remove-equal b x)) 0)) (implies (not (equal a b)) (equal (duplicity a (remove-equal b x)) (duplicity a x))))`
- **Library theorem:** `(equal (duplicity a (let ((x b) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l)))) (if (equal a b) 0 (duplicity a x)))`

### `duplicity-of-rev`

- **English:** If Z is a reversal of X, and Y is a duplicity of A and Z then Y is a duplicity of A and X.
- **Attempto's reading:** If something X1 is a reversal of something X2 and something X3 is a duplicity of something X4 and X1 then X3 is a duplicity of X4 and X2.
- **Compiled:** `(equal (duplicity a (rev x)) (duplicity a x))`
- **Library theorem:** `(equal (duplicity a (rev x)) (duplicity a x))`

### `duplicity-of-revappend`

- **English:** If U is a revappend of X and Y, and Z is a duplicity of A and U, and V is a duplicity of A and X, and W is a duplicity of A and Y then Z is a sum of V and W.
- **Attempto's reading:** If something X1 is a revappend of something X2 and something X3 and something X4 is a duplicity of something X5 and X1 and something X6 is a duplicity of X5 and X2 and something X7 is a duplicity of X5 and X3 then X4 is a sum of X6 and X7.
- **Compiled:** `(equal (duplicity a (revappend x y)) (+ (duplicity a x) (duplicity a y)))`
- **Library theorem:** `(equal (duplicity a (revappend x y)) (+ (duplicity a x) (duplicity a y)))`

### `duplicity-of-reverse`

- **English:** If Z is a reverse of X, and Y is a duplicity of A and Z then Y is a duplicity of A and X.
- **Attempto's reading:** If something X1 is a reverse of something X2 and something X3 is a duplicity of something X4 and X1 then X3 is a duplicity of X4 and X2.
- **Compiled:** `(equal (duplicity a (reverse x)) (duplicity a x))`
- **Library theorem:** `(equal (duplicity a (reverse x)) (duplicity a x))`

### `duplicity-when-member-equal`

- **English:** If A is a member of X then 0 is smaller than a duplicity of A and X.
- **Attempto's reading:** If something X1 is a member of something X2 then 0 is smaller than a duplicity of X1 and X2.
- **Compiled:** `(implies (member-equal a x) (< 0 (duplicity a x)))`
- **Library theorem:** `(implies (member-equal a x) (< 0 (duplicity a x)))`

### `duplicity-when-non-member-equal`

- **English:** If Y is a duplicity of A and X, and A is not a member of X then Y is 0.
- **Attempto's reading:** If something X1 is a duplicity of something X2 and something X3 and it is false that X2 is a member of X3 then X1 is 0.
- **Compiled:** `(implies (not (member-equal a x)) (equal (duplicity a x) 0))`
- **Library theorem:** `(implies (not (member-equal a x)) (equal (duplicity a x) 0))`

### `duplicity-when-not-consp`

- **English:** If Y is a duplicity of A and X, and X is not a pair then Y is 0.
- **Attempto's reading:** If something X1 is a duplicity of something and something X2 and it is false that X2 is a pair then X1 is 0.
- **Compiled:** `(implies (not (consp x)) (equal (duplicity a x) 0))`
- **Library theorem:** `(implies (not (consp x)) (equal (duplicity a x) 0))`

### `duplicity-zero-to-member-equal`

- **English:** If 0 is a duplicity of A and X then A is not a member of X. If Y is a duplicity of A and X, and A is not a member of X then 0 is Y.
- **Attempto's reading:** If 0 is a duplicity of something X1 and something X2 then it is false that X1 is a member of X2. If something X1 is a duplicity of something X2 and something X3 and it is false that X2 is a member of X3 then 0 is X1.
- **Compiled:** `(and (implies (equal 0 (duplicity a x)) (not (member-equal a x))) (implies (not (member-equal a x)) (equal 0 (duplicity a x))))`
- **Library theorem:** `(iff (equal 0 (duplicity a x)) (not (member-equal a x)))`

### `equal-final-cdr-nil`

- **English:** If a final-cdr of X is Nil then X is a true-list. If X is a true-list then a final-cdr of X is Nil.
- **Attempto's reading:** If a final-cdr of something X1 is Nil then X1 is a true-list. If something X1 is a true-list then a final-cdr of X1 is Nil.
- **Compiled:** `(and (implies (equal (final-cdr x) nil) (true-listp x)) (implies (true-listp x) (equal (final-cdr x) nil)))`
- **Library theorem:** `(equal (equal (final-cdr x) nil) (true-listp x))`

### `equal-of-append-and-append-same-arg2`

- **English:** If an append of X and Y is an append of Z and Y then a list-fix of X is a list-fix of Z. If U is an append of X and Y, and a list-fix of X is a list-fix of Z then U is an append of Z and Y.
- **Attempto's reading:** If an append of something X1 and something X2 is an append of something X3 and X2 then a list-fix of X1 is a list-fix of X3. If something X1 is an append of something X2 and something X3 and a list-fix of X2 is a list-fix of something X4 then X1 is an append of X4 and X3.
- **Compiled:** `(and (implies (equal (append x1 y) (append x2 y)) (equal (true-list-fix x1) (true-list-fix x2))) (implies (equal (true-list-fix x1) (true-list-fix x2)) (equal (append x1 y) (append x2 y))))`
- **Library theorem:** `(equal (equal (append x1 y) (append x2 y)) (equal (true-list-fix x1) (true-list-fix x2)))`

### `equal-of-final-cdr-and-self`

- **English:** If X is a final-cdr of X then X is atomic. If X is atomic then X is a final-cdr of X.
- **Attempto's reading:** If something X1 is a final-cdr of X1 then X1 is atomic. If something X1 is atomic then X1 is a final-cdr of X1.
- **Compiled:** `(and (implies (equal x (final-cdr x)) (atom x)) (implies (atom x) (equal x (final-cdr x))))`
- **Library theorem:** `(equal (equal x (final-cdr x)) (atom x))`

### `equal-of-list-fix-and-self`

- **English:** If X is a list-fix of X then X is a true-list. If X is a true-list then X is a list-fix of X.
- **Attempto's reading:** If something X1 is a list-fix of X1 then X1 is a true-list. If something X1 is a true-list then X1 is a list-fix of X1.
- **Compiled:** `(and (implies (equal x (true-list-fix x)) (true-listp x)) (implies (true-listp x) (equal x (true-list-fix x))))`
- **Library theorem:** `(equal (equal x (true-list-fix x)) (true-listp x))`

### `equal-of-rev-and-rev`

- **English:** If a reversal of X is a reversal of Y then a list-fix of X is a list-fix of Y. If a list-fix of X is a list-fix of Y then a reversal of X is a reversal of Y.
- **Attempto's reading:** If a reversal of something X1 is a reversal of something X2 then a list-fix of X1 is a list-fix of X2. If a list-fix of something X1 is a list-fix of something X2 then a reversal of X1 is a reversal of X2.
- **Compiled:** `(and (implies (equal (rev x) (rev y)) (equal (true-list-fix x) (true-list-fix y))) (implies (equal (true-list-fix x) (true-list-fix y)) (equal (rev x) (rev y))))`
- **Library theorem:** `(equal (equal (rev x) (rev y)) (equal (true-list-fix x) (true-list-fix y)))`

### `equal-of-revappends-when-true-listps`

- **English:** If X is a true-list, and Z is a true-list, and a revappend of X and Y is a revappend of Z and Y then X is Z. If U is a revappend of X and Y, and X is a true-list, and Z is a true-list, and X is Z then U is a revappend of Z and Y.
- **Attempto's reading:** If something X1 is a true-list and something X2 is a true-list and a revappend of X1 and something X3 is a revappend of X2 and X3 then X1 is X2. If something X1 is a revappend of something X2 and something X3 and X2 is a true-list and X2 is something X4 and X4 is a true-list then X1 is a revappend of X4 and X3.
- **Compiled:** `(and (implies (and (true-listp x1) (true-listp x2) (equal (revappend x1 y) (revappend x2 y))) (equal x1 x2)) (implies (and (true-listp x1) (true-listp x2) (equal x1 x2)) (equal (revappend x1 y) (revappend x2 y))))`
- **Library theorem:** `(implies (and (true-listp x1) (true-listp x2)) (equal (equal (revappend x1 y) (revappend x2 y)) (equal x1 x2)))`

### `equal-of-take-and-list-fix`

- **English:** If a take of N and X is a list-fix of X then a length of X is a natural-value of N. If a length of X is a natural-value of N then a take of N and X is a list-fix of X.
- **Attempto's reading:** If a take of something X1 and something X2 is a list-fix of X2 then a length of X2 is a natural-value of X1. If a length of something X1 is a natural-value of something X2 then a take of X2 and X1 is a list-fix of X1.
- **Compiled:** `(and (implies (equal (take n x) (true-list-fix x)) (equal (len x) (nfix n))) (implies (equal (len x) (nfix n)) (equal (take n x) (true-list-fix x))))`
- **Library theorem:** `(equal (equal (take n x) (true-list-fix x)) (equal (len x) (nfix n)))`

### `equal-when-append-same`

- **English:** If an append of X and Y is an append of X and Z then Y is Z. If U is an append of X and Y, and Y is Z then U is an append of X and Z.
- **Attempto's reading:** If an append of something X1 and something X2 is an append of X1 and something X3 then X2 is X3. If something X1 is an append of something X2 and something X3 and X3 is something X4 then X1 is an append of X2 and X4.
- **Compiled:** `(and (implies (equal (append x y1) (append x y2)) (equal y1 y2)) (implies (equal y1 y2) (equal (append x y1) (append x y2))))`
- **Library theorem:** `(equal (equal (append x y1) (append x y2)) (equal y1 y2))`

### `equal-when-revappend-same`

- **English:** If a revappend of X and Y is a revappend of X and Z then Y is Z. If U is a revappend of X and Y, and Y is Z then U is a revappend of X and Z.
- **Attempto's reading:** If a revappend of something X1 and something X2 is a revappend of X1 and something X3 then X2 is X3. If something X1 is a revappend of something X2 and something X3 and X3 is something X4 then X1 is a revappend of X2 and X4.
- **Compiled:** `(and (implies (equal (revappend x y1) (revappend x y2)) (equal y1 y2)) (implies (equal y1 y2) (equal (revappend x y1) (revappend x y2))))`
- **Library theorem:** `(equal (equal (revappend x y1) (revappend x y2)) (equal y1 y2))`

### `final-cdr-of-append`

- **English:** If Z is an append of X and Y then a final-cdr of Z is a final-cdr of Y.
- **Attempto's reading:** If something X1 is an append of something and something X2 then a final-cdr of X1 is a final-cdr of X2.
- **Compiled:** `(equal (final-cdr (append x y)) (final-cdr y))`
- **Library theorem:** `(equal (final-cdr (append x y)) (final-cdr y))`

### `final-cdr-of-cons`

- **English:** If Y is a cons of A and X then a final-cdr of Y is a final-cdr of X.
- **Attempto's reading:** If something X1 is a cons of something and something X2 then a final-cdr of X1 is a final-cdr of X2.
- **Compiled:** `(equal (final-cdr (cons a x)) (final-cdr x))`
- **Library theorem:** `(equal (final-cdr (cons a x)) (final-cdr x))`

### `final-cdr-of-last`

- **English:** If Y is a last-pair of X then a final-cdr of Y is a final-cdr of X.
- **Attempto's reading:** If something X1 is a last-pair of something X2 then a final-cdr of X1 is a final-cdr of X2.
- **Compiled:** `(equal (final-cdr (last x)) (final-cdr x))`
- **Library theorem:** `(equal (final-cdr (last x)) (final-cdr x))`

### `final-cdr-of-nthcdr`

- **English:** If Y is an nthcdr of N and X, and a length of X is not smaller than a natural-value of N then a final-cdr of Y is a final-cdr of X. If a length of X is smaller than a natural-value of N then a final-cdr of an nthcdr of N and X is Nil.
- **Attempto's reading:** If there is a length X1 of something X2 and something X3 is a nthcdr of something X4 and X2 and it is false that the length X1 is smaller than a natural-value of X4 then a final-cdr of X3 is a final-cdr of X2. If a length of something X1 is smaller than a natural-value of something X2 then a final-cdr of a nthcdr of X2 and X1 is Nil.
- **Compiled:** `(and (implies (not (< (len x) (nfix n))) (equal (final-cdr (nthcdr n x)) (final-cdr x))) (implies (< (len x) (nfix n)) (equal (final-cdr (nthcdr n x)) nil)))`
- **Library theorem:** `(equal (final-cdr (nthcdr n x)) (and (<= (nfix n) (len x)) (final-cdr x)))`

### `final-cdr-of-revappend`

- **English:** If Z is a revappend of X and Y then a final-cdr of Z is a final-cdr of Y.
- **Attempto's reading:** If something X1 is a revappend of something and something X2 then a final-cdr of X1 is a final-cdr of X2.
- **Compiled:** `(equal (final-cdr (revappend x y)) (final-cdr y))`
- **Library theorem:** `(equal (final-cdr (revappend x y)) (final-cdr y))`

### `final-cdr-of-union-equal`

- **English:** If Z is an union of X and Y then a final-cdr of Z is a final-cdr of Y.
- **Attempto's reading:** If something X1 is a union of something and something X2 then a final-cdr of X1 is a final-cdr of X2.
- **Compiled:** `(equal (final-cdr (union-equal x y)) (final-cdr y))`
- **Library theorem:** `(equal (final-cdr (union-equal x y)) (final-cdr y))`

### `final-cdr-of-update-nth`

- **English:** If Y is an update-nth of N and V and X, and a natural-value of N is smaller than a length of X then a final-cdr of Y is a final-cdr of X. If Y is an update-nth of N and V and X, and a natural-value of N is not smaller than a length of X then a final-cdr of Y is Nil.
- **Attempto's reading:** If something X1 is an update-nth of something X2 and something and something X3 and a natural-value of X2 is smaller than a length of X3 then a final-cdr of X1 is a final-cdr of X3. If there is a natural-value X1 of something X2 and something X3 is an update-nth of X2 and something and something X4 and it is false that the natural-value X1 is smaller than a length of X4 then a final-cdr of X3 is Nil.
- **Compiled:** `(and (implies (< (nfix n) (len x)) (equal (final-cdr (update-nth n v x)) (final-cdr x))) (implies (not (< (nfix n) (len x))) (equal (final-cdr (update-nth n v x)) nil)))`
- **Library theorem:** `(equal (final-cdr (update-nth n v x)) (and (< (nfix n) (len x)) (final-cdr x)))`

### `final-cdr-when-atom`

- **English:** If X is atomic then a final-cdr of X is X.
- **Attempto's reading:** If something X1 is atomic then a final-cdr of X1 is X1.
- **Compiled:** `(implies (atom x) (equal (final-cdr x) x))`
- **Library theorem:** `(implies (atom x) (equal (final-cdr x) x))`

### `final-cdr-when-true-listp`

- **English:** If X is a true-list then a final-cdr of X is Nil.
- **Attempto's reading:** If something X1 is a true-list then a final-cdr of X1 is Nil.
- **Compiled:** `(implies (true-listp x) (equal (final-cdr x) nil))`
- **Library theorem:** `(implies (true-listp x) (equal (final-cdr x) nil))`

### `flatten-of-append`

- **English:** If Z is an append of X and Y, and U is a flattening of X, and V is a flattening of Y then a flattening of Z is an append of U and V.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a flattening of X2 and something X5 is a flattening of X3 then a flattening of X1 is an append of X4 and X5.
- **Compiled:** `(equal (flatten (append x y)) (append (flatten x) (flatten y)))`
- **Library theorem:** `(equal (flatten (append x y)) (append (flatten x) (flatten y)))`

### `flatten-of-cons`

- **English:** If Y is a cons of A and X, and Z is a flattening of X then a flattening of Y is an append of A and Z.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is a flattening of X3 then a flattening of X1 is an append of X2 and X4.
- **Compiled:** `(equal (flatten (cons a x)) (append a (flatten x)))`
- **Library theorem:** `(equal (flatten (cons a x)) (append a (flatten x)))`

### `flatten-of-list-fix`

- **English:** If Y is a list-fix of X then a flattening of Y is a flattening of X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 then a flattening of X1 is a flattening of X2.
- **Compiled:** `(equal (flatten (true-list-fix x)) (flatten x))`
- **Library theorem:** `(equal (flatten (true-list-fix x)) (flatten x))`

### `flatten-when-not-consp`

- **English:** If Y is a flattening of X, and X is not a pair then Y is Nil.
- **Attempto's reading:** If something X1 is a flattening of something X2 and it is false that X2 is a pair then X1 is Nil.
- **Compiled:** `(implies (not (consp x)) (equal (flatten x) nil))`
- **Library theorem:** `(implies (not (consp x)) (equal (flatten x) nil))`

### `fourth-of-take`

- **English:** If Y is a take of N and X, and a natural-value of N is not smaller than 4 then a head of a tail of a tail of a tail of Y is a head of a tail of a tail of a tail of X.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is a take of X2 and something X4 and it is false that the natural-value X1 is smaller than 4 then a head of a tail of a tail of a tail of X3 is a head of a tail of a tail of a tail of X4.
- **Compiled:** `(implies (not (< (nfix n) 4)) (equal (car (cdr (cdr (cdr (take n x))))) (car (cdr (cdr (cdr x))))))`
- **Library theorem:** `(implies (<= 4 (nfix n)) (equal (cadddr (take n x)) (cadddr x)))`

### `index-of-<-len`

- **English:** If K is a member of X then an index of K and X is smaller than a length of X.
- **Attempto's reading:** If something X1 is a member of something X2 then an index of X1 and X2 is smaller than a length of X2.
- **Compiled:** `(implies (member-equal k x) (< (index-of k x) (len x)))`
- **Library theorem:** `(implies (let ((x k) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (< (index-of k x) (len x)))`

### `index-of-append-first`

- **English:** If U is an append of X and Y, and Z is an index of K and U, and an index of K and X is not Nil then Z is an index of K and X.
- **Attempto's reading:** If there is an index X1 of something X2 and something X3 and something X4 is an append of X3 and something and something X5 is an index of X2 and X4 and it is false that the index X1 is Nil then X5 is an index of X2 and X3.
- **Compiled:** `(implies (not (equal (index-of k x) nil)) (equal (index-of k (append x y)) (index-of k x)))`
- **Library theorem:** `(implies (index-of k x) (equal (index-of k (append x y)) (index-of k x)))`

### `index-of-append-neither`

- **English:** If Z is an append of X and Y, and an index of K and X is Nil, and an index of K and Y is Nil then an index of K and Z is Nil.
- **Attempto's reading:** If an index of something X1 and something X2 is Nil and an index of X1 and something X3 is Nil and something X4 is an append of X2 and X3 then an index of X1 and X4 is Nil.
- **Compiled:** `(implies (and (equal (index-of k x) nil) (equal (index-of k y) nil)) (equal (index-of k (append x y)) nil))`
- **Library theorem:** `(implies (and (not (index-of k x)) (not (index-of k y))) (not (index-of k (append x y))))`

### `index-of-append-second`

- **English:** If Z is an append of X and Y, and U is a length of X, and V is an index of K and Y, and an index of K and X is Nil, and an index of K and Y is not Nil then an index of K and Z is a sum of U and V.
- **Attempto's reading:** If there is an index X1 of something X2 and something X3 and an index of X2 and something X4 is Nil and something X5 is an append of X4 and X3 and something X6 is a length of X4 and something X7 is an index of X2 and X3 and it is false that the index X1 is Nil then an index of X2 and X5 is a sum of X6 and X7.
- **Compiled:** `(implies (and (equal (index-of k x) nil) (not (equal (index-of k y) nil))) (equal (index-of k (append x y)) (+ (len x) (index-of k y))))`
- **Library theorem:** `(implies (and (not (index-of k x)) (index-of k y)) (equal (index-of k (append x y)) (+ (len x) (index-of k y))))`

### `index-of-iff-member`

- **English:** If Y is an index of K and X, and Y is not Nil then K is a member of X. If K is a member of X then an index of K and X is not Nil.
- **Attempto's reading:** If something X1 is an index of something X2 and something X3 and it is false that X1 is Nil then X2 is a member of X3. If something X1 is a member of something X2 then there is an index X3 of X1 and X2 and it is false that the index X3 is Nil.
- **Compiled:** `(and (implies (not (equal (index-of k x) nil)) (member-equal k x)) (implies (member-equal k x) (not (equal (index-of k x) nil))))`
- **Library theorem:** `(iff (index-of k x) (let ((x k) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))))`

### `intersection$-commutes-under-set-equiv`

- **English:** If Z is an intersection of X and Y then Z is set-equivalent-to an intersection of Y and X.
- **Attempto's reading:** If something X1 is an intersection of something X2 and something X3 then X1 is set-equivalent-to an intersection of X3 and X2.
- **Compiled:** `(set-equiv (intersection-equal x y) (intersection-equal y x))`
- **Library theorem:** `(set-equiv (let ((x0 x) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1))) (let ((x0 y) (x1 x)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1))))`

### `intersection$-of-cons-left`

- **English:** If Z is a cons of A and X, and U is an intersection of X and Y, and A is a member of Y then an intersection of Z and Y is a cons of A and U. If Z is a cons of A and X, and U is an intersection of Z and Y, and A is not a member of Y then U is an intersection of X and Y.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is an intersection of X3 and something X5 and X2 is a member of X5 then an intersection of X1 and X5 is a cons of X2 and X4. If something X1 is a cons of something X2 and something X3 and something X4 is an intersection of X1 and something X5 and it is false that X2 is a member of X5 then X4 is an intersection of X3 and X5.
- **Compiled:** `(and (implies (member-equal a y) (equal (intersection-equal (cons a x) y) (cons a (intersection-equal x y)))) (implies (not (member-equal a y)) (equal (intersection-equal (cons a x) y) (intersection-equal x y))))`
- **Library theorem:** `(equal (let ((x0 (cons a x)) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1))) (if (let ((x a) (l y)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (cons a (let ((x0 x) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1)))) (let ((x0 x) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1)))))`

### `intersection$-of-cons-right-under-set-equiv`

- **English:** If Z is a cons of A and Y, and U is an intersection of X and Y, and A is a member of X then an intersection of X and Z is set-equivalent-to a cons of A and U. If U is a cons of A and Y, and Z is an intersection of X and U, and A is not a member of X then Z is set-equivalent-to an intersection of X and Y.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is an intersection of something X5 and X3 and X2 is a member of X5 then an intersection of X5 and X1 is set-equivalent-to a cons of X2 and X4. If something X1 is a cons of something X2 and something X3 and something X4 is an intersection of something X5 and X1 and it is false that X2 is a member of X5 then X4 is set-equivalent-to an intersection of X5 and X3.
- **Compiled:** `(and (implies (member-equal a x) (set-equiv (intersection-equal x (cons a y)) (cons a (intersection-equal x y)))) (implies (not (member-equal a x)) (set-equiv (intersection-equal x (cons a y)) (intersection-equal x y))))`
- **Library theorem:** `(set-equiv (let ((x0 x) (x1 (cons a y))) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1))) (if (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (cons a (let ((x0 x) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1)))) (let ((x0 x) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1)))))`

### `intersection$-when-atom-left`

- **English:** If Z is an intersection of X and Y, and X is atomic then Z is Nil.
- **Attempto's reading:** If something X1 is an intersection of something X2 and something and X2 is atomic then X1 is Nil.
- **Compiled:** `(implies (atom x) (equal (intersection-equal x y) nil))`
- **Library theorem:** `(implies (atom x) (equal (let ((x0 x) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1))) nil))`

### `intersection$-when-atom-right`

- **English:** If Z is an intersection of X and Y, and Y is atomic then Z is Nil.
- **Attempto's reading:** If something X1 is an intersection of something and something X2 and X2 is atomic then X1 is Nil.
- **Compiled:** `(implies (atom y) (equal (intersection-equal x y) nil))`
- **Library theorem:** `(implies (atom y) (equal (let ((x0 x) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1))) nil))`

### `last-of-append`

- **English:** If Z is an append of X and Y, and Y is a pair then a last-pair of Z is a last-pair of Y. If Z is an append of X and Y, and U is a last-pair of X, and Y is not a pair then a last-pair of Z is an append of U and Y.
- **Attempto's reading:** If something X1 is an append of something and something X2 and X2 is a pair then a last-pair of X1 is a last-pair of X2. If something X1 is an append of something X2 and something X3 and something X4 is a last-pair of X2 and it is false that X3 is a pair then a last-pair of X1 is an append of X4 and X3.
- **Compiled:** `(and (implies (consp y) (equal (last (append x y)) (last y))) (implies (not (consp y)) (equal (last (append x y)) (append (last x) y))))`
- **Library theorem:** `(equal (last (append x y)) (if (consp y) (last y) (append (last x) y)))`

### `last-of-cons`

- **English:** If Y is a cons of A and X, and X is a pair then a last-pair of Y is a last-pair of X. If Y is a cons of A and X, and X is not a pair then a last-pair of Y is Y.
- **Attempto's reading:** If something X1 is a cons of something and something X2 and X2 is a pair then a last-pair of X1 is a last-pair of X2. If something X1 is a cons of something and something X2 and it is false that X2 is a pair then a last-pair of X1 is X1.
- **Compiled:** `(and (implies (consp x) (equal (last (cons a x)) (last x))) (implies (not (consp x)) (equal (last (cons a x)) (cons a x))))`
- **Library theorem:** `(equal (last (cons a x)) (if (consp x) (last x) (cons a x)))`

### `last-of-list-fix`

- **English:** If Y is a list-fix of X then a last-pair of Y is a list-fix of a last-pair of X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 then a last-pair of X1 is a list-fix of a last-pair of X2.
- **Compiled:** `(equal (last (true-list-fix x)) (true-list-fix (last x)))`
- **Library theorem:** `(equal (last (true-list-fix x)) (true-list-fix (last x)))`

### `last-of-rev`

- **English:** If Y is a head of X, and X is a pair then a last-pair of a reversal of X is a cons of Y and Nil. If Y is a reversal of X, and X is not a pair then a last-pair of Y is Nil.
- **Attempto's reading:** If something X1 is a head of something X2 and X2 is a pair then a last-pair of a reversal of X2 is a cons of X1 and Nil. If something X1 is a reversal of something X2 and it is false that X2 is a pair then a last-pair of X1 is Nil.
- **Compiled:** `(and (implies (consp x) (equal (last (rev x)) (cons (car x) nil))) (implies (not (consp x)) (equal (last (rev x)) nil)))`
- **Library theorem:** `(equal (last (rev x)) (and (consp x) (list (car x))))`

### `last-of-revappend`

- **English:** If Z is a revappend of X and Y, and Y is a pair then a last-pair of Z is a last-pair of Y. If Z is a revappend of X and Y, and U is a head of X, and X is a pair, and Y is not a pair then a last-pair of Z is a cons of U and Y. If Z is a revappend of X and Y, and Y is not a pair, and X is not a pair then a last-pair of Z is Y.
- **Attempto's reading:** If something X1 is a revappend of something and something X2 and X2 is a pair then a last-pair of X1 is a last-pair of X2. If something X1 is a revappend of something X2 and something X3 and X2 is a pair and something X4 is a head of X2 and it is false that X3 is a pair then a last-pair of X1 is a cons of X4 and X3. If something X1 is a revappend of something X2 and something X3 and it is false that X3 is a pair and it is false that X2 is a pair then a last-pair of X1 is X3.
- **Compiled:** `(and (implies (consp y) (equal (last (revappend x y)) (last y))) (implies (and (consp x) (not (consp y))) (equal (last (revappend x y)) (cons (car x) y))) (implies (and (not (consp y)) (not (consp x))) (equal (last (revappend x y)) y)))`
- **Library theorem:** `(equal (last (revappend x y)) (cond ((consp y) (last y)) ((consp x) (cons (car x) y)) (t y)))`

### `last-when-atom`

- **English:** If X is atomic then a last-pair of X is X.
- **Attempto's reading:** If something X1 is atomic then a last-pair of X1 is X1.
- **Compiled:** `(implies (atom x) (equal (last x) x))`
- **Library theorem:** `(implies (atom x) (equal (last x) x))`

### `last-when-atom-of-cdr`

- **English:** If a tail of X is atomic then a last-pair of X is X.
- **Attempto's reading:** If a tail of something X1 is atomic then a last-pair of X1 is X1.
- **Compiled:** `(implies (atom (cdr x)) (equal (last x) x))`
- **Library theorem:** `(implies (atom (cdr x)) (equal (last x) x))`

### `len-of-append`

- **English:** If Z is an append of X and Y, and U is a length of X, and V is a length of Y then a length of Z is a sum of U and V.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a length of X2 and something X5 is a length of X3 then a length of X1 is a sum of X4 and X5.
- **Compiled:** `(equal (len (append x y)) (+ (len x) (len y)))`
- **Library theorem:** `(equal (len (append x y)) (+ (len x) (len y)))`

### `len-of-cons`

- **English:** If Y is a cons of A and X, and Z is a length of X then a length of Y is a sum of 1 and Z.
- **Attempto's reading:** If something X1 is a cons of something and something X2 and something X3 is a length of X2 then a length of X1 is a sum of 1 and X3.
- **Compiled:** `(equal (len (cons a x)) (+ 1 (len x)))`
- **Library theorem:** `(equal (len (cons a x)) (+ 1 (len x)))`

### `len-of-intersection$-upper-bound`

- **English:** If Z is a length of X, and U is an intersection of X and Y then Z is not smaller than a length of U.
- **Attempto's reading:** If something X1 is a length of something X2 and something X3 is an intersection of X2 and something then it is false that X1 is smaller than a length of X3.
- **Compiled:** `(not (< (len x) (len (intersection-equal x y))))`
- **Library theorem:** `(<= (len (let ((x0 x) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1)))) (len x))`

### `len-of-last`

- **English:** If L is a pair then a length of a last-pair of L is 1. If X is a last-pair of L, and L is not a pair then a length of X is 0.
- **Attempto's reading:** If something X1 is a pair then a length of a last-pair of X1 is 1. If something X1 is a last-pair of something X2 and it is false that X2 is a pair then a length of X1 is 0.
- **Compiled:** `(and (implies (consp l) (equal (len (last l)) 1)) (implies (not (consp l)) (equal (len (last l)) 0)))`
- **Library theorem:** `(equal (len (last l)) (if (consp l) 1 0))`

### `len-of-list-fix`

- **English:** If Y is a list-fix of X then a length of Y is a length of X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 then a length of X1 is a length of X2.
- **Compiled:** `(equal (len (true-list-fix x)) (len x))`
- **Library theorem:** `(equal (len (true-list-fix x)) (len x))`

### `len-of-nthcdr`

- **English:** If X is an nthcdr of N and L, and Y is a length of L, and Z is a natural-value of N then a length of X is a natural-value of a difference of Y and Z.
- **Attempto's reading:** If something X1 is a nthcdr of something X2 and something X3 and something X4 is a length of X3 and something X5 is a natural-value of X2 then a length of X1 is a natural-value of a difference of X4 and X5.
- **Compiled:** `(equal (len (nthcdr n l)) (nfix (- (len l) (nfix n))))`
- **Library theorem:** `(equal (len (nthcdr n l)) (nfix (+ (len l) (- (nfix n)))))`

### `len-of-rcons`

- **English:** If Y is a rcons of A and X, and Z is a length of X then a length of Y is a sum of 1 and Z.
- **Attempto's reading:** If something X1 is a rcons of something and something X2 and something X3 is a length of X2 then a length of X1 is a sum of 1 and X3.
- **Compiled:** `(equal (len (rcons a x)) (+ 1 (len x)))`
- **Library theorem:** `(equal (len (rcons a x)) (+ 1 (len x)))`

### `len-of-remove-duplicates-equal`

- **English:** If Y is a length of X then Y is not smaller than a length of a deduplication of X.
- **Attempto's reading:** If something X1 is a length of something X2 then it is false that X1 is smaller than a length of a deduplication of X2.
- **Compiled:** `(not (< (len x) (len (remove-duplicates-equal x))))`
- **Library theorem:** `(<= (len (remove-duplicates-equal x)) (len x))`

### `len-of-remove-exact`

- **English:** If Y is a removal of A and X, and Z is a length of X, and U is a duplicity of A and X then a length of Y is a difference of Z and U.
- **Attempto's reading:** If something X1 is a removal of something X2 and something X3 and something X4 is a length of X3 and something X5 is a duplicity of X2 and X3 then a length of X1 is a difference of X4 and X5.
- **Compiled:** `(equal (len (remove-equal a x)) (- (len x) (duplicity a x)))`
- **Library theorem:** `(equal (len (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l)))) (+ (len x) (- (duplicity a x))))`

### `len-of-repeat`

- **English:** If Y is a repeat of N and X then a length of Y is a natural-value of N.
- **Attempto's reading:** If something X1 is a repeat of something X2 and something then a length of X1 is a natural-value of X2.
- **Compiled:** `(equal (len (repeat n x)) (nfix n))`
- **Library theorem:** `(equal (len (repeat n x)) (nfix n))`

### `len-of-rev`

- **English:** If Y is a reversal of X then a length of Y is a length of X.
- **Attempto's reading:** If something X1 is a reversal of something X2 then a length of X1 is a length of X2.
- **Compiled:** `(equal (len (rev x)) (len x))`
- **Library theorem:** `(equal (len (rev x)) (len x))`

### `len-of-revappend`

- **English:** If Z is a revappend of X and Y, and U is a length of X, and V is a length of Y then a length of Z is a sum of U and V.
- **Attempto's reading:** If something X1 is a revappend of something X2 and something X3 and something X4 is a length of X2 and something X5 is a length of X3 then a length of X1 is a sum of X4 and X5.
- **Compiled:** `(equal (len (revappend x y)) (+ (len x) (len y)))`
- **Library theorem:** `(equal (len (revappend x y)) (+ (len x) (len y)))`

### `len-of-take`

- **English:** If Y is a take of N and X then a length of Y is a natural-value of N.
- **Attempto's reading:** If something X1 is a take of something X2 and something then a length of X1 is a natural-value of X2.
- **Compiled:** `(equal (len (take n xs)) (nfix n))`
- **Library theorem:** `(equal (len (take n xs)) (nfix n))`

### `len-when-atom`

- **English:** If X is atomic then a length of X is 0.
- **Attempto's reading:** If something X1 is atomic then a length of X1 is 0.
- **Compiled:** `(implies (atom x) (equal (len x) 0))`
- **Library theorem:** `(implies (atom x) (equal (len x) 0))`

### `len-when-prefixp`

- **English:** If X is a prefix of Y then a length of Y is not smaller than a length of X.
- **Attempto's reading:** If something X1 is a prefix of something X2 then there is a length X3 of X2 and it is false that the length X3 is smaller than a length of X1.
- **Compiled:** `(implies (prefixp x y) (not (< (len y) (len x))))`
- **Library theorem:** `(implies (prefixp x y) (equal (< (len y) (len x)) nil))`

### `list-equiv-of-append-and-append`

- **English:** If an append of A and X is list-equivalent-to an append of A and Y then X is list-equivalent-to Y. If Z is an append of A and X, and X is list-equivalent-to Y then Z is list-equivalent-to an append of A and Y.
- **Attempto's reading:** If an append of something X1 and something X2 is list-equivalent-to an append of X1 and something X3 then X2 is list-equivalent-to X3. If something X1 is an append of something X2 and something X3 and X3 is list-equivalent-to something X4 then X1 is list-equivalent-to an append of X2 and X4.
- **Compiled:** `(and (implies (list-equiv (append a x) (append a y)) (list-equiv x y)) (implies (list-equiv x y) (list-equiv (append a x) (append a y))))`
- **Library theorem:** `(equal (list-equiv (append a x) (append a y)) (list-equiv x y))`

### `list-equiv-of-cons-and-cons`

- **English:** If a cons of A and X is list-equivalent-to a cons of A and Y then X is list-equivalent-to Y. If Z is a cons of A and X, and X is list-equivalent-to Y then Z is list-equivalent-to a cons of A and Y.
- **Attempto's reading:** If a cons of something X1 and something X2 is list-equivalent-to a cons of X1 and something X3 then X2 is list-equivalent-to X3. If something X1 is a cons of something X2 and something X3 and X3 is list-equivalent-to something X4 then X1 is list-equivalent-to a cons of X2 and X4.
- **Compiled:** `(and (implies (list-equiv (cons a x) (cons a y)) (list-equiv x y)) (implies (list-equiv x y) (list-equiv (cons a x) (cons a y))))`
- **Library theorem:** `(equal (list-equiv (cons a x) (cons a y)) (list-equiv x y))`

### `list-equiv-of-nil-left`

- **English:** If Nil is list-equivalent-to Y then Y is not a pair. If there is something Y, and Y is not a pair then Nil is list-equivalent-to Y.
- **Attempto's reading:** If Nil is list-equivalent-to something X1 then it is false that X1 is a pair. If there is something X1 and it is false that X1 is a pair then Nil is list-equivalent-to X1.
- **Compiled:** `(and (implies (list-equiv nil y) (not (consp y))) (implies (not (consp y)) (list-equiv nil y)))`
- **Library theorem:** `(equal (list-equiv nil y) (not (consp y)))`

### `list-equiv-of-nil-right`

- **English:** If X is list-equivalent-to Nil then X is not a pair. If there is something X, and X is not a pair then X is list-equivalent-to Nil.
- **Attempto's reading:** If something X1 is list-equivalent-to Nil then it is false that X1 is a pair. If there is something X1 and it is false that X1 is a pair then X1 is list-equivalent-to Nil.
- **Compiled:** `(and (implies (list-equiv x nil) (not (consp x))) (implies (not (consp x)) (list-equiv x nil)))`
- **Library theorem:** `(equal (list-equiv x nil) (not (consp x)))`

### `list-equiv-of-rcons-and-rcons`

- **English:** If a rcons of A and X is list-equivalent-to a rcons of A and Y then X is list-equivalent-to Y. If Z is a rcons of A and X, and X is list-equivalent-to Y then Z is list-equivalent-to a rcons of A and Y.
- **Attempto's reading:** If a rcons of something X1 and something X2 is list-equivalent-to a rcons of X1 and something X3 then X2 is list-equivalent-to X3. If something X1 is a rcons of something X2 and something X3 and X3 is list-equivalent-to something X4 then X1 is list-equivalent-to a rcons of X2 and X4.
- **Compiled:** `(and (implies (list-equiv (rcons a x) (rcons a y)) (list-equiv x y)) (implies (list-equiv x y) (list-equiv (rcons a x) (rcons a y))))`
- **Library theorem:** `(equal (list-equiv (rcons a x) (rcons a y)) (list-equiv x y))`

### `list-equiv-of-rev-and-rev`

- **English:** If a reversal of X is list-equivalent-to a reversal of Y then X is list-equivalent-to Y. If X is list-equivalent-to Y then a reversal of X is list-equivalent-to a reversal of Y.
- **Attempto's reading:** If a reversal of something X1 is list-equivalent-to a reversal of something X2 then X1 is list-equivalent-to X2. If something X1 is list-equivalent-to something X2 then a reversal of X1 is list-equivalent-to a reversal of X2.
- **Compiled:** `(and (implies (list-equiv (rev x) (rev y)) (list-equiv x y)) (implies (list-equiv x y) (list-equiv (rev x) (rev y))))`
- **Library theorem:** `(equal (list-equiv (rev x) (rev y)) (list-equiv x y))`

### `list-equiv-of-revappend-and-revappend`

- **English:** If a revappend of A and X is list-equivalent-to a revappend of A and Y then X is list-equivalent-to Y. If Z is a revappend of A and X, and X is list-equivalent-to Y then Z is list-equivalent-to a revappend of A and Y.
- **Attempto's reading:** If a revappend of something X1 and something X2 is list-equivalent-to a revappend of X1 and something X3 then X2 is list-equivalent-to X3. If something X1 is a revappend of something X2 and something X3 and X3 is list-equivalent-to something X4 then X1 is list-equivalent-to a revappend of X2 and X4.
- **Compiled:** `(and (implies (list-equiv (revappend a x) (revappend a y)) (list-equiv x y)) (implies (list-equiv x y) (list-equiv (revappend a x) (revappend a y))))`
- **Library theorem:** `(equal (list-equiv (revappend a x) (revappend a y)) (list-equiv x y))`

### `list-equiv-when-atom-left`

- **English:** If X is atomic, and X is list-equivalent-to Y then Y is atomic. If X is atomic, and Y is atomic then X is list-equivalent-to Y.
- **Attempto's reading:** If something X1 is atomic and X1 is list-equivalent-to something X2 then X2 is atomic. If something X1 is atomic and something X2 is atomic then X1 is list-equivalent-to X2.
- **Compiled:** `(and (implies (and (atom x) (list-equiv x y)) (atom y)) (implies (and (atom x) (atom y)) (list-equiv x y)))`
- **Library theorem:** `(implies (atom x) (equal (list-equiv x y) (atom y)))`

### `list-equiv-when-atom-right`

- **English:** If Y is atomic, and X is list-equivalent-to Y then X is atomic. If Y is atomic, and X is atomic then X is list-equivalent-to Y.
- **Attempto's reading:** If something X1 is atomic and something X2 is list-equivalent-to X1 then X2 is atomic. If something X1 is atomic and something X2 is atomic then X2 is list-equivalent-to X1.
- **Compiled:** `(and (implies (and (atom y) (list-equiv x y)) (atom x)) (implies (and (atom y) (atom x)) (list-equiv x y)))`
- **Library theorem:** `(implies (atom y) (equal (list-equiv x y) (atom x)))`

### `list-fix-equal-forward-to-list-equiv`

- **English:** If a list-fix of X is a list-fix of Y then X is list-equivalent-to Y.
- **Attempto's reading:** If a list-fix of something X1 is a list-fix of something X2 then X1 is list-equivalent-to X2.
- **Compiled:** `(implies (equal (true-list-fix x) (true-list-fix y)) (list-equiv x y))`
- **Library theorem:** `(implies (equal (true-list-fix x) (true-list-fix y)) (list-equiv x y))`

### `list-fix-of-append`

- **English:** If Z is an append of X and Y, and U is a list-fix of Y then a list-fix of Z is an append of X and U.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a list-fix of X3 then a list-fix of X1 is an append of X2 and X4.
- **Compiled:** `(equal (true-list-fix (append x y)) (append x (true-list-fix y)))`
- **Library theorem:** `(equal (true-list-fix (append x y)) (append x (true-list-fix y)))`

### `list-fix-of-cons`

- **English:** If Y is a cons of A and X, and Z is a list-fix of X then a list-fix of Y is a cons of A and Z.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is a list-fix of X3 then a list-fix of X1 is a cons of X2 and X4.
- **Compiled:** `(equal (true-list-fix (cons a x)) (cons a (true-list-fix x)))`
- **Library theorem:** `(equal (true-list-fix (cons a x)) (cons a (true-list-fix x)))`

### `list-fix-of-revappend`

- **English:** If Z is a revappend of X and Y, and U is a list-fix of Y then a list-fix of Z is a revappend of X and U.
- **Attempto's reading:** If something X1 is a revappend of something X2 and something X3 and something X4 is a list-fix of X3 then a list-fix of X1 is a revappend of X2 and X4.
- **Compiled:** `(equal (true-list-fix (revappend x y)) (revappend x (true-list-fix y)))`
- **Library theorem:** `(equal (true-list-fix (revappend x y)) (revappend x (true-list-fix y)))`

### `list-fix-under-iff`

- **English:** If Y is a list-fix of X, and Y is not Nil then X is a pair. If X is a pair then a list-fix of X is not Nil.
- **Attempto's reading:** If something X1 is a list-fix of something X2 and it is false that X1 is Nil then X2 is a pair. If something X1 is a pair then there is a list-fix X2 of X1 and it is false that the list-fix X2 is Nil.
- **Compiled:** `(and (implies (not (equal (true-list-fix x) nil)) (consp x)) (implies (consp x) (not (equal (true-list-fix x) nil))))`
- **Library theorem:** `(iff (true-list-fix x) (consp x))`

### `list-fix-under-list-equiv`

- **English:** If Y is a list-fix of X then Y is list-equivalent-to X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 then X1 is list-equivalent-to X2.
- **Compiled:** `(list-equiv (true-list-fix x) x)`
- **Library theorem:** `(list-equiv (true-list-fix x) x)`

### `list-fix-when-len-zero`

- **English:** If a length of X is 0 then a list-fix of X is Nil.
- **Attempto's reading:** If a length of something X1 is 0 then a list-fix of X1 is Nil.
- **Compiled:** `(implies (equal (len x) 0) (equal (true-list-fix x) nil))`
- **Library theorem:** `(implies (equal (len x) 0) (equal (true-list-fix x) nil))`

### `list-fix-when-not-consp`

- **English:** If Y is a list-fix of X, and X is not a pair then Y is Nil.
- **Attempto's reading:** If something X1 is a list-fix of something X2 and it is false that X2 is a pair then X1 is Nil.
- **Compiled:** `(implies (not (consp x)) (equal (true-list-fix x) nil))`
- **Library theorem:** `(implies (not (consp x)) (equal (true-list-fix x) nil))`

### `list-fix-when-true-listp`

- **English:** If X is a true-list then a list-fix of X is X.
- **Attempto's reading:** If something X1 is a true-list then a list-fix of X1 is X1.
- **Compiled:** `(implies (true-listp x) (equal (true-list-fix x) x))`
- **Library theorem:** `(implies (true-listp x) (equal (true-list-fix x) x))`

### `listpos-complete`

- **English:** If Z is an nthcdr of N and Y, and X is a prefix of Z then a listpos of X and Y is not Nil and a natural-value of N is not smaller than a listpos of X and Y.
- **Attempto's reading:** If something X1 is a nthcdr of something X2 and something X3 and something X4 is a prefix of X1 then there is a listpos X5 of X4 and X3 and there is a natural-value X6 of X2 and it is false that the listpos X5 is Nil and it is false that the natural-value X6 is smaller than a listpos of X4 and X3.
- **Compiled:** `(implies (prefixp x (nthcdr n y)) (and (not (equal (listpos x y) nil)) (not (< (nfix n) (listpos x y)))))`
- **Library theorem:** `(implies (prefixp x (nthcdr n y)) (and (listpos x y) (<= (listpos x y) (nfix n))))`

### `listpos-lower-bound-weak`

- **English:** If Z is a listpos of X and Y then Z is not smaller than 0.
- **Attempto's reading:** If something X1 is a listpos of something and something then it is false that X1 is smaller than 0.
- **Compiled:** `(not (< (listpos x y) 0))`
- **Library theorem:** `(<= 0 (listpos x y))`

### `listpos-of-list-fix-left`

- **English:** If Z is a list-fix of X, and U is a listpos of Z and Y then U is a listpos of X and Y.
- **Attempto's reading:** If something X1 is a list-fix of something X2 and something X3 is a listpos of X1 and something X4 then X3 is a listpos of X2 and X4.
- **Compiled:** `(equal (listpos (true-list-fix x) y) (listpos x y))`
- **Library theorem:** `(equal (listpos (true-list-fix x) y) (listpos x y))`

### `listpos-of-list-fix-right`

- **English:** If U is a list-fix of Y, and Z is a listpos of X and U then Z is a listpos of X and Y.
- **Attempto's reading:** If something X1 is a list-fix of something X2 and something X3 is a listpos of something X4 and X1 then X3 is a listpos of X4 and X2.
- **Compiled:** `(equal (listpos x (true-list-fix y)) (listpos x y))`
- **Library theorem:** `(equal (listpos x (true-list-fix y)) (listpos x y))`

### `listpos-under-iff`

- **English:** If Z is a listpos of X and Y, and Z is not Nil then X is a sublist of Y. If X is a sublist of Y then a listpos of X and Y is not Nil.
- **Attempto's reading:** If something X1 is a listpos of something X2 and something X3 and it is false that X1 is Nil then X2 is a sublist of X3. If something X1 is a sublist of something X2 then there is a listpos X3 of X1 and X2 and it is false that the listpos X3 is Nil.
- **Compiled:** `(and (implies (not (equal (listpos x y) nil)) (sublistp x y)) (implies (sublistp x y) (not (equal (listpos x y) nil))))`
- **Library theorem:** `(iff (listpos x y) (sublistp x y))`

### `listpos-upper-bound-strong-1`

- **English:** If a listpos of X and Y is smaller than a length of Y then Y is a pair. If Z is a listpos of X and Y, and Y is a pair then Z is smaller than a length of Y.
- **Attempto's reading:** If a listpos of something and something X1 is smaller than a length of X1 then X1 is a pair. If something X1 is a listpos of something and something X2 and X2 is a pair then X1 is smaller than a length of X2.
- **Compiled:** `(and (implies (< (listpos x y) (len y)) (consp y)) (implies (consp y) (< (listpos x y) (len y))))`
- **Library theorem:** `(equal (< (listpos x y) (len y)) (consp y))`

### `listpos-upper-bound-strong-2`

- **English:** If Z is a length of Y, and U is a length of X, and X is a sublist of Y then a difference of Z and U is not smaller than a listpos of X and Y.
- **Attempto's reading:** If something X1 is a length of something X2 and something X3 is a length of something X4 and X4 is a sublist of X2 then there is a difference X5 of X1 and X3 and it is false that the difference X5 is smaller than a listpos of X4 and X2.
- **Compiled:** `(implies (sublistp x y) (not (< (- (len y) (len x)) (listpos x y))))`
- **Library theorem:** `(implies (sublistp x y) (<= (listpos x y) (+ (len y) (- (len x)))))`

### `listpos-upper-bound-weak`

- **English:** If Z is a length of Y, and U is a listpos of X and Y then Z is not smaller than U.
- **Attempto's reading:** If something X1 is a length of something X2 and something X3 is a listpos of something and X2 then it is false that X1 is smaller than X3.
- **Compiled:** `(not (< (len y) (listpos x y)))`
- **Library theorem:** `(<= (listpos x y) (len y))`

### `listpos-when-atom-left`

- **English:** If Z is a listpos of X and Y, and X is atomic then Z is 0.
- **Attempto's reading:** If something X1 is a listpos of something X2 and something and X2 is atomic then X1 is 0.
- **Compiled:** `(implies (atom x) (equal (listpos x y) 0))`
- **Library theorem:** `(implies (atom x) (equal (listpos x y) 0))`

### `listpos-when-atom-right`

- **English:** If Y is atomic, and X is atomic then a listpos of X and Y is 0. If Z is a listpos of X and Y, and Y is atomic, and X is not atomic then Z is Nil.
- **Attempto's reading:** If something X1 is atomic and something X2 is atomic then a listpos of X2 and X1 is 0. If something X1 is a listpos of something X2 and something X3 and X3 is atomic and it is false that X2 is atomic then X1 is Nil.
- **Compiled:** `(and (implies (and (atom y) (atom x)) (equal (listpos x y) 0)) (implies (and (atom y) (not (atom x))) (equal (listpos x y) nil)))`
- **Library theorem:** `(implies (atom y) (equal (listpos x y) (and (atom x) 0)))`

### `lower-bound-of-len-when-sublistp`

- **English:** If X is a sublist of Y then a length of Y is not smaller than a length of X.
- **Attempto's reading:** If something X1 is a sublist of something X2 then there is a length X3 of X2 and it is false that the length X3 is smaller than a length of X1.
- **Compiled:** `(implies (sublistp x y) (not (< (len y) (len x))))`
- **Library theorem:** `(implies (sublistp x y) (<= (len x) (len y)))`

### `member-equal-update-nth`

- **English:** If Y is an update-nth of N and X and L then X is a member of Y.
- **Attempto's reading:** If something X1 is an update-nth of something and something X2 and something then X2 is a member of X1.
- **Compiled:** `(member-equal x (update-nth n x l))`
- **Library theorem:** `(member-equal x (update-nth n x l))`

### `member-of-append`

- **English:** If Z is an append of X and Y, and A is a member of Z then A is a member of X or A is a member of Y. If there is something A, and Z is an append of X and Y, and A is a member of X or A is a member of Y then A is a member of Z.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a member of X1 then X4 is a member of X2 or X4 is a member of X3. If there is something X1 and something X2 is an append of something X3 and something X4, and X1 is a member of X3 or X1 is a member of X4 then X1 is a member of X2.
- **Compiled:** `(and (implies (member-equal a (append x y)) (or (member-equal a x) (member-equal a y))) (implies (or (member-equal a x) (member-equal a y)) (member-equal a (append x y))))`
- **Library theorem:** `(iff (let ((x a) (l (append x y))) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (or (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (let ((x a) (l y)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l)))))`

### `member-of-car-of-last`

- **English:** If a head of a last-pair of X is a member of X then X is a pair. If X is a pair then a head of a last-pair of X is a member of X.
- **Attempto's reading:** If a head of a last-pair of something X1 is a member of X1 then X1 is a pair. If something X1 is a pair then a head of a last-pair of X1 is a member of X1.
- **Compiled:** `(and (implies (member-equal (car (last x)) x) (consp x)) (implies (consp x) (member-equal (car (last x)) x)))`
- **Library theorem:** `(iff (let ((x (car (last x))) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (and (consp x) t))`

### `member-of-intersection$`

- **English:** If Z is an intersection of X and Y, and A is a member of Z then A is a member of X and A is a member of Y. If Z is an intersection of X and Y, and A is a member of X, and A is a member of Y then A is a member of Z.
- **Attempto's reading:** If something X1 is an intersection of something X2 and something X3 and something X4 is a member of X1 then X4 is a member of X2 and X4 is a member of X3. If something X1 is an intersection of something X2 and something X3 and something X4 is a member of X2 and X4 is a member of X3 then X4 is a member of X1.
- **Compiled:** `(and (implies (member-equal a (intersection-equal x y)) (and (member-equal a x) (member-equal a y))) (implies (and (member-equal a x) (member-equal a y)) (member-equal a (intersection-equal x y))))`
- **Library theorem:** `(iff (let ((x a) (l (let ((x0 x) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1))))) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (and (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (let ((x a) (l y)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l)))))`

### `member-of-intersection-equal`

- **English:** If Z is an intersection of X and Y, and A is a member of Z then A is a member of X and A is a member of Y. If Z is an intersection of X and Y, and A is a member of X, and A is a member of Y then A is a member of Z.
- **Attempto's reading:** If something X1 is an intersection of something X2 and something X3 and something X4 is a member of X1 then X4 is a member of X2 and X4 is a member of X3. If something X1 is an intersection of something X2 and something X3 and something X4 is a member of X2 and X4 is a member of X3 then X4 is a member of X1.
- **Compiled:** `(and (implies (member-equal a (intersection-equal x y)) (and (member-equal a x) (member-equal a y))) (implies (and (member-equal a x) (member-equal a y)) (member-equal a (intersection-equal x y))))`
- **Library theorem:** `(iff (let ((x a) (l (intersection-equal x y))) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (and (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (let ((x a) (l y)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l)))))`

### `member-of-nth`

- **English:** If a natural-value of N is smaller than a length of X then an nth of N and X is a member of X.
- **Attempto's reading:** If a natural-value of something X1 is smaller than a length of something X2 then a nth of X1 and X2 is a member of X2.
- **Compiled:** `(implies (< (nfix n) (len x)) (member-equal (nth n x) x))`
- **Library theorem:** `(implies (< (nfix n) (len x)) (let ((x (nth n x)) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))))`

### `member-of-remove`

- **English:** If Y is a removal of B and X, and A is a member of Y then A is a member of X and A is not B. If Y is a removal of B and X, and A is a member of X, and A is not B then A is a member of Y.
- **Attempto's reading:** If something X1 is a removal of something X2 and something X3 and something X4 is a member of X1 then X4 is a member of X3 and it is false that X4 is X2. If something X1 is a removal of something X2 and something X3 and something X4 is a member of X3 and it is false that X4 is X2 then X4 is a member of X1.
- **Compiled:** `(and (implies (member-equal a (remove-equal b x)) (and (member-equal a x) (not (equal a b)))) (implies (and (member-equal a x) (not (equal a b))) (member-equal a (remove-equal b x))))`
- **Library theorem:** `(iff (let ((x a) (l (let ((x b) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))))) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (and (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (not (equal a b))))`

### `member-of-remove-duplicates-equal`

- **English:** If A is a member of a deduplication of X then A is a member of X. If A is a member of X then A is a member of a deduplication of X.
- **Attempto's reading:** If something X1 is a member of a deduplication of something X2 then X1 is a member of X2. If something X1 is a member of something X2 then X1 is a member of a deduplication of X2.
- **Compiled:** `(and (implies (member-equal a (remove-duplicates-equal x)) (member-equal a x)) (implies (member-equal a x) (member-equal a (remove-duplicates-equal x))))`
- **Library theorem:** `(iff (let ((x a) (l (remove-duplicates-equal x))) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))))`

### `member-of-revappend`

- **English:** If Y is a revappend of A and B, and X is a member of Y then X is a member of A or X is a member of B. If there is something X, and Y is a revappend of A and B, and X is a member of A or X is a member of B then X is a member of Y.
- **Attempto's reading:** If something X1 is a revappend of something X2 and something X3 and something X4 is a member of X1 then X4 is a member of X2 or X4 is a member of X3. If there is something X1 and something X2 is a revappend of something X3 and something X4, and X1 is a member of X3 or X1 is a member of X4 then X1 is a member of X2.
- **Compiled:** `(and (implies (member-equal x (revappend a b)) (or (member-equal x a) (member-equal x b))) (implies (or (member-equal x a) (member-equal x b)) (member-equal x (revappend a b))))`
- **Library theorem:** `(iff (let ((l (revappend a b))) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (or (let ((l a)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (let ((l b)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l)))))`

### `member-of-set-difference-equal`

- **English:** If Z is a set-difference of X and Y, and A is a member of Z then A is a member of X and A is not a member of Y. If Z is a set-difference of X and Y, and A is a member of X, and A is not a member of Y then A is a member of Z.
- **Attempto's reading:** If something X1 is a set-difference of something X2 and something X3 and something X4 is a member of X1 then X4 is a member of X2 and it is false that X4 is a member of X3. If something X1 is a set-difference of something X2 and something X3 and something X4 is a member of X2 and it is false that X4 is a member of X3 then X4 is a member of X1.
- **Compiled:** `(and (implies (member-equal a (set-difference-equal x y)) (and (member-equal a x) (not (member-equal a y)))) (implies (and (member-equal a x) (not (member-equal a y))) (member-equal a (set-difference-equal x y))))`
- **Library theorem:** `(iff (let ((x a) (l (set-difference-equal x y))) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (and (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (not (let ((x a) (l y)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))))))`

### `member-self`

- **English:** If there is something X then X is not a member of X.
- **Attempto's reading:** If there is something X1 then it is false that X1 is a member of X1.
- **Compiled:** `(not (member-equal x x))`
- **Library theorem:** `(not (let ((l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))))`

### `member-when-atom`

- **English:** If there is something A, and X is atomic then A is not a member of X.
- **Attempto's reading:** If there is something X1 and something X2 is atomic then it is false that X1 is a member of X2.
- **Compiled:** `(implies (atom x) (not (member-equal a x)))`
- **Library theorem:** `(implies (atom x) (not (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l)))))`

### `natp-of-listpos`

- **English:** If a listpos of X and Y is natural then X is a sublist of Y. If X is a sublist of Y then a listpos of X and Y is natural.
- **Attempto's reading:** If a listpos of something X1 and something X2 is natural then X1 is a sublist of X2. If something X1 is a sublist of something X2 then a listpos of X1 and X2 is natural.
- **Compiled:** `(and (implies (natp (listpos x y)) (sublistp x y)) (implies (sublistp x y) (natp (listpos x y))))`
- **Library theorem:** `(equal (natp (listpos x y)) (sublistp x y))`

### `natpp-of-index-of`

- **English:** If an index of K and X is natural then K is a member of X. If K is a member of X then an index of K and X is natural.
- **Attempto's reading:** If an index of something X1 and something X2 is natural then X1 is a member of X2. If something X1 is a member of something X2 then an index of X1 and X2 is natural.
- **Compiled:** `(and (implies (natp (index-of k x)) (member-equal k x)) (implies (member-equal k x) (natp (index-of k x))))`
- **Library theorem:** `(iff (natp (index-of k x)) (let ((x k) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))))`

### `no-duplicatesp-equal-of-append-of-append`

- **English:** If an append of X and Y is duplicate-free then an append of Y and X is duplicate-free. If an append of Y and X is duplicate-free then an append of X and Y is duplicate-free.
- **Attempto's reading:** If an append of something X1 and something X2 is duplicate-free then an append of X2 and X1 is duplicate-free. If an append of something X1 and something X2 is duplicate-free then an append of X2 and X1 is duplicate-free.
- **Compiled:** `(and (implies (no-duplicatesp-equal (append x y)) (no-duplicatesp-equal (append y x))) (implies (no-duplicatesp-equal (append y x)) (no-duplicatesp-equal (append x y))))`
- **Library theorem:** `(equal (no-duplicatesp-equal (append x y)) (no-duplicatesp-equal (append y x)))`

### `no-duplicatesp-equal-of-append-of-rev-1`

- **English:** If Z is a reversal of X, and an append of Z and Y is duplicate-free then an append of X and Y is duplicate-free. If Z is a reversal of X, and an append of X and Y is duplicate-free then an append of Z and Y is duplicate-free.
- **Attempto's reading:** If something X1 is a reversal of something X2 and an append of X1 and something X3 is duplicate-free then an append of X2 and X3 is duplicate-free. If something X1 is a reversal of something X2 and an append of X2 and something X3 is duplicate-free then an append of X1 and X3 is duplicate-free.
- **Compiled:** `(and (implies (no-duplicatesp-equal (append (rev x) y)) (no-duplicatesp-equal (append x y))) (implies (no-duplicatesp-equal (append x y)) (no-duplicatesp-equal (append (rev x) y))))`
- **Library theorem:** `(equal (no-duplicatesp-equal (append (rev x) y)) (no-duplicatesp-equal (append x y)))`

### `no-duplicatesp-equal-of-append-of-rev-2`

- **English:** If Z is a reversal of Y, and an append of X and Z is duplicate-free then an append of X and Y is duplicate-free. If Z is a reversal of Y, and an append of X and Y is duplicate-free then an append of X and Z is duplicate-free.
- **Attempto's reading:** If something X1 is a reversal of something X2 and an append of something X3 and X1 is duplicate-free then an append of X3 and X2 is duplicate-free. If something X1 is a reversal of something X2 and an append of something X3 and X2 is duplicate-free then an append of X3 and X1 is duplicate-free.
- **Compiled:** `(and (implies (no-duplicatesp-equal (append x (rev y))) (no-duplicatesp-equal (append x y))) (implies (no-duplicatesp-equal (append x y)) (no-duplicatesp-equal (append x (rev y)))))`
- **Library theorem:** `(equal (no-duplicatesp-equal (append x (rev y))) (no-duplicatesp-equal (append x y)))`

### `no-duplicatesp-equal-of-flatten-of-rev`

- **English:** If a flattening of a reversal of X is duplicate-free then a flattening of X is duplicate-free. If a flattening of X is duplicate-free then a flattening of a reversal of X is duplicate-free.
- **Attempto's reading:** If a flattening of a reversal of something X1 is duplicate-free then a flattening of X1 is duplicate-free. If a flattening of something X1 is duplicate-free then a flattening of a reversal of X1 is duplicate-free.
- **Compiled:** `(and (implies (no-duplicatesp-equal (flatten (rev x))) (no-duplicatesp-equal (flatten x))) (implies (no-duplicatesp-equal (flatten x)) (no-duplicatesp-equal (flatten (rev x)))))`
- **Library theorem:** `(equal (no-duplicatesp-equal (flatten (rev x))) (no-duplicatesp-equal (flatten x)))`

### `no-duplicatesp-equal-of-remove-duplicates-equal`

- **English:** If Y is a deduplication of X then Y is duplicate-free.
- **Attempto's reading:** If something X1 is a deduplication of something then X1 is duplicate-free.
- **Compiled:** `(no-duplicatesp-equal (remove-duplicates-equal x))`
- **Library theorem:** `(no-duplicatesp-equal (remove-duplicates-equal x))`

### `no-duplicatesp-equal-of-rev`

- **English:** If a reversal of X is duplicate-free then X is duplicate-free. If X is duplicate-free then a reversal of X is duplicate-free.
- **Attempto's reading:** If a reversal of something X1 is duplicate-free then X1 is duplicate-free. If something X1 is duplicate-free then a reversal of X1 is duplicate-free.
- **Compiled:** `(and (implies (no-duplicatesp-equal (rev x)) (no-duplicatesp-equal x)) (implies (no-duplicatesp-equal x) (no-duplicatesp-equal (rev x))))`
- **Library theorem:** `(equal (no-duplicatesp-equal (rev x)) (no-duplicatesp-equal x))`

### `no-duplicatesp-equal-when-atom`

- **English:** If X is atomic then X is duplicate-free.
- **Attempto's reading:** If something X1 is atomic then X1 is duplicate-free.
- **Compiled:** `(implies (atom x) (no-duplicatesp-equal x))`
- **Library theorem:** `(implies (atom x) (equal (no-duplicatesp-equal x) t))`

### `no-duplicatesp-equal-when-high-duplicity`

- **English:** If 1 is smaller than a duplicity of A and X then X is not duplicate-free.
- **Attempto's reading:** If 1 is smaller than a duplicity of something and something X1 then it is false that X1 is duplicate-free.
- **Compiled:** `(implies (< 1 (duplicity a x)) (not (no-duplicatesp-equal x)))`
- **Library theorem:** `(implies (< 1 (duplicity a x)) (not (no-duplicatesp-equal x)))`

### `no-duplicatesp-of-set-difference-equal`

- **English:** If Z is a set-difference of X and Y, and X is duplicate-free then Z is duplicate-free.
- **Attempto's reading:** If something X1 is a set-difference of something X2 and something and X2 is duplicate-free then X1 is duplicate-free.
- **Compiled:** `(implies (no-duplicatesp-equal l1) (no-duplicatesp-equal (set-difference-equal l1 l2)))`
- **Library theorem:** `(implies (no-duplicatesp-equal l1) (no-duplicatesp-equal (set-difference-equal l1 l2)))`

### `no-duplicatesp-of-take`

- **English:** If X is a take of N and L, and L is duplicate-free, and a length of L is not smaller than a natural-value of N then X is duplicate-free.
- **Attempto's reading:** If there is a length X1 of something X2 and something X3 is a take of something X4 and X2 and X2 is duplicate-free and it is false that the length X1 is smaller than a natural-value of X4 then X3 is duplicate-free.
- **Compiled:** `(implies (and (no-duplicatesp-equal l) (not (< (len l) (nfix n)))) (no-duplicatesp-equal (take n l)))`
- **Library theorem:** `(implies (and (no-duplicatesp-equal l) (<= (nfix n) (len l))) (no-duplicatesp-equal (take n l)))`

### `not-suffixp-of-cons-left`

- **English:** If there is something B, and X is a cons of C and A, and A is not a suffix of B then X is not a suffix of B.
- **Attempto's reading:** If there is something X1 and something X2 is a cons of something and something X3 and it is false that X3 is a suffix of X1 then it is false that X2 is a suffix of X1.
- **Compiled:** `(implies (not (suffixp a b)) (not (suffixp (cons c a) b)))`
- **Library theorem:** `(implies (not (suffixp a b)) (not (suffixp (cons c a) b)))`

### `nth-of-append`

- **English:** If Z is an append of X and Y, and a natural-value of N is smaller than a length of X then an nth of N and Z is an nth of N and X. If U is an append of X and Y, and Z is an nth of N and U, and W is a length of X, and V is a difference of N and W, and a natural-value of N is not smaller than a length of X then Z is an nth of V and Y.
- **Attempto's reading:** If something X1 is an append of something X2 and something and a natural-value of something X3 is smaller than a length of X2 then a nth of X3 and X1 is a nth of X3 and X2. If there is a natural-value X1 of something X2 and something X3 is an append of something X4 and something X5 and something X6 is a nth of X2 and X3 and something X7 is a length of X4 and something X8 is a difference of X2 and X7 and it is false that the natural-value X1 is smaller than a length of X4 then X6 is a nth of X8 and X5.
- **Compiled:** `(and (implies (< (nfix n) (len x)) (equal (nth n (append x y)) (nth n x))) (implies (not (< (nfix n) (len x))) (equal (nth n (append x y)) (nth (- n (len x)) y))))`
- **Library theorem:** `(equal (nth n (append x y)) (if (< (nfix n) (len x)) (nth n x) (nth (+ n (- (len x))) y)))`

### `nth-of-index-when-member`

- **English:** If Y is an index of K and X, and K is a member of X then an nth of Y and X is K.
- **Attempto's reading:** If something X1 is an index of something X2 and something X3 and X2 is a member of X3 then a nth of X1 and X3 is X2.
- **Compiled:** `(implies (member-equal k x) (equal (nth (index-of k x) x) k))`
- **Library theorem:** `(implies (let ((x k) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (equal (nth (index-of k x) x) k))`

### `nth-of-list-fix`

- **English:** If Z is a list-fix of X, and Y is an nth of N and Z then Y is an nth of N and X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 and something X3 is a nth of something X4 and X1 then X3 is a nth of X4 and X2.
- **Compiled:** `(equal (nth n (true-list-fix x)) (nth n x))`
- **Library theorem:** `(equal (nth n (true-list-fix x)) (nth n x))`

### `nth-of-nfix`

- **English:** If Y is a natural-value of N, and Z is an nth of Y and X then Z is an nth of N and X.
- **Attempto's reading:** If something X1 is a natural-value of something X2 and something X3 is a nth of X1 and something X4 then X3 is a nth of X2 and X4.
- **Compiled:** `(equal (nth (nfix n) x) (nth n x))`
- **Library theorem:** `(equal (nth (nfix n) x) (nth n x))`

### `nth-of-nil`

- **English:** If X is an nth of N and Nil then X is Nil.
- **Attempto's reading:** If something X1 is a nth of something and Nil then X1 is Nil.
- **Compiled:** `(equal (nth n nil) nil)`
- **Library theorem:** `(equal (nth n nil) nil)`

### `nth-of-nthcdr`

- **English:** If Z is an nthcdr of M and X, and Y is an nth of N and Z, and V is a natural-value of N, and W is a natural-value of M, and U is a sum of V and W then Y is an nth of U and X.
- **Attempto's reading:** If something X1 is a nthcdr of something X2 and something X3 and something X4 is a nth of something X5 and X1 and something X6 is a natural-value of X5 and something X7 is a natural-value of X2 and something X8 is a sum of X6 and X7 then X4 is a nth of X8 and X3.
- **Compiled:** `(equal (nth n (nthcdr m x)) (nth (+ (nfix n) (nfix m)) x))`
- **Library theorem:** `(equal (nth n (nthcdr m x)) (nth (+ (nfix n) (nfix m)) x))`

### `nth-of-repeat`

- **English:** If X is a repeat of M and A, and a natural-value of N is smaller than a natural-value of M then an nth of N and X is A. If Y is a repeat of M and A, and X is an nth of N and Y, and a natural-value of N is not smaller than a natural-value of M then X is Nil.
- **Attempto's reading:** If something X1 is a repeat of something X2 and something X3 and a natural-value of something X4 is smaller than a natural-value of X2 then a nth of X4 and X1 is X3. If there is a natural-value X1 of something X2 and something X3 is a repeat of something X4 and something and something X5 is a nth of X2 and X3 and it is false that the natural-value X1 is smaller than a natural-value of X4 then X5 is Nil.
- **Compiled:** `(and (implies (< (nfix n) (nfix m)) (equal (nth n (repeat m a)) a)) (implies (not (< (nfix n) (nfix m))) (equal (nth n (repeat m a)) nil)))`
- **Library theorem:** `(equal (nth n (repeat m a)) (and (< (nfix n) (nfix m)) a))`

### `nth-of-rev`

- **English:** If Y is a reversal of X, and U is a length of X, and W is a natural-value of N, and V is a sum of 1 and W, and Z is a difference of U and V, and a natural-value of N is smaller than a length of X then an nth of N and Y is an nth of Z and X. If Z is a reversal of X, and Y is an nth of N and Z, and a natural-value of N is not smaller than a length of X then Y is Nil.
- **Attempto's reading:** If something X1 is a reversal of something X2 and something X3 is a length of X2 and something X4 is a natural-value of something X5 and something X6 is a sum of 1 and X4 and something X7 is a difference of X3 and X6 and a natural-value of X5 is smaller than a length of X2 then a nth of X5 and X1 is a nth of X7 and X2. If there is a natural-value X1 of something X2 and something X3 is a reversal of something X4 and something X5 is a nth of X2 and X3 and it is false that the natural-value X1 is smaller than a length of X4 then X5 is Nil.
- **Compiled:** `(and (implies (< (nfix n) (len x)) (equal (nth n (rev x)) (nth (- (len x) (+ 1 (nfix n))) x))) (implies (not (< (nfix n) (len x))) (equal (nth n (rev x)) nil)))`
- **Library theorem:** `(equal (nth n (rev x)) (and (< (nfix n) (len x)) (nth (+ (len x) (- (+ 1 (nfix n)))) x)))`

### `nth-of-revappend`

- **English:** If Z is a revappend of X and Y, and V is a length of X, and P is a natural-value of N, and W is a sum of 1 and P, and U is a difference of V and W, and a natural-value of N is smaller than a length of X then an nth of N and Z is an nth of U and X. If U is a revappend of X and Y, and Z is an nth of N and U, and W is a length of X, and V is a difference of N and W, and a natural-value of N is not smaller than a length of X then Z is an nth of V and Y.
- **Attempto's reading:** If something X1 is a revappend of something X2 and something and something X3 is a length of X2 and something X4 is a natural-value of something X5 and something X6 is a sum of 1 and X4 and something X7 is a difference of X3 and X6 and a natural-value of X5 is smaller than a length of X2 then a nth of X5 and X1 is a nth of X7 and X2. If there is a natural-value X1 of something X2 and something X3 is a revappend of something X4 and something X5 and something X6 is a nth of X2 and X3 and something X7 is a length of X4 and something X8 is a difference of X2 and X7 and it is false that the natural-value X1 is smaller than a length of X4 then X6 is a nth of X8 and X5.
- **Compiled:** `(and (implies (< (nfix n) (len x)) (equal (nth n (revappend x y)) (nth (- (len x) (+ 1 (nfix n))) x))) (implies (not (< (nfix n) (len x))) (equal (nth n (revappend x y)) (nth (- n (len x)) y))))`
- **Library theorem:** `(equal (nth n (revappend x y)) (if (< (nfix n) (len x)) (nth (+ (len x) (- (+ 1 (nfix n)))) x) (nth (+ n (- (len x))) y)))`

### `nth-of-reverse`

- **English:** If Y is a reverse of X, and U is a length of X, and W is a natural-value of N, and V is a sum of 1 and W, and Z is a difference of U and V, and a natural-value of N is smaller than a length of X then an nth of N and Y is an nth of Z and X. If Z is a reverse of X, and Y is an nth of N and Z, and a natural-value of N is not smaller than a length of X then Y is Nil.
- **Attempto's reading:** If something X1 is a reverse of something X2 and something X3 is a length of X2 and something X4 is a natural-value of something X5 and something X6 is a sum of 1 and X4 and something X7 is a difference of X3 and X6 and a natural-value of X5 is smaller than a length of X2 then a nth of X5 and X1 is a nth of X7 and X2. If there is a natural-value X1 of something X2 and something X3 is a reverse of something X4 and something X5 is a nth of X2 and X3 and it is false that the natural-value X1 is smaller than a length of X4 then X5 is Nil.
- **Compiled:** `(and (implies (< (nfix n) (len x)) (equal (nth n (reverse x)) (nth (- (len x) (+ 1 (nfix n))) x))) (implies (not (< (nfix n) (len x))) (equal (nth n (reverse x)) nil)))`
- **Library theorem:** `(equal (nth n (reverse x)) (and (< (nfix n) (len x)) (nth (+ (len x) (- (+ 1 (nfix n)))) x)))`

### `nth-of-take`

- **English:** If X is a take of N and L, and a natural-value of I is smaller than a natural-value of N then an nth of I and X is an nth of I and L. If Y is a take of N and L, and X is an nth of I and Y, and a natural-value of I is not smaller than a natural-value of N then X is Nil.
- **Attempto's reading:** If something X1 is a take of something X2 and something X3 and a natural-value of something X4 is smaller than a natural-value of X2 then a nth of X4 and X1 is a nth of X4 and X3. If there is a natural-value X1 of something X2 and something X3 is a take of something X4 and something and something X5 is a nth of X2 and X3 and it is false that the natural-value X1 is smaller than a natural-value of X4 then X5 is Nil.
- **Compiled:** `(and (implies (< (nfix i) (nfix n)) (equal (nth i (take n l)) (nth i l))) (implies (not (< (nfix i) (nfix n))) (equal (nth i (take n l)) nil)))`
- **Library theorem:** `(equal (nth i (take n l)) (and (< (nfix i) (nfix n)) (nth i l)))`

### `nth-of-update-nth-diff`

- **English:** If W is an update-nth of Z and V and X, and U is an nth of Y and W, and a natural-value of Y is not a natural-value of Z then U is an nth of Y and X.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is an update-nth of something X4 and something and something X5 and something X6 is a nth of X2 and X3 and it is false that the natural-value X1 is a natural-value of X4 then X6 is a nth of X2 and X5.
- **Compiled:** `(implies (not (equal (nfix n1) (nfix n2))) (equal (nth n1 (update-nth n2 v x)) (nth n1 x)))`
- **Library theorem:** `(implies (not (equal (nfix n1) (nfix n2))) (equal (nth n1 (update-nth n2 v x)) (nth n1 x)))`

### `nth-of-update-nth-same`

- **English:** If Y is an update-nth of N and V and X then an nth of N and Y is V.
- **Attempto's reading:** If something X1 is an update-nth of something X2 and something X3 and something then a nth of X2 and X1 is X3.
- **Compiled:** `(equal (nth n (update-nth n v x)) v)`
- **Library theorem:** `(equal (nth n (update-nth n v x)) v)`

### `nth-update-nth`

- **English:** If Y is an update-nth of N and X and L, and a natural-value of M is a natural-value of N then an nth of M and Y is X. If Z is an update-nth of N and X and L, and Y is an nth of M and Z, and a natural-value of M is not a natural-value of N then Y is an nth of M and L.
- **Attempto's reading:** If something X1 is an update-nth of something X2 and something X3 and something and a natural-value of something X4 is a natural-value of X2 then a nth of X4 and X1 is X3. If there is a natural-value X1 of something X2 and something X3 is an update-nth of something X4 and something and something X5 and something X6 is a nth of X2 and X3 and it is false that the natural-value X1 is a natural-value of X4 then X6 is a nth of X2 and X5.
- **Compiled:** `(and (implies (equal (nfix m) (nfix n)) (equal (nth m (update-nth n val l)) val)) (implies (not (equal (nfix m) (nfix n))) (equal (nth m (update-nth n val l)) (nth m l))))`
- **Library theorem:** `(equal (nth m (update-nth n val l)) (if (equal (nfix m) (nfix n)) val (nth m l)))`

### `nth-when-atom`

- **English:** If Y is an nth of N and X, and X is atomic then Y is Nil.
- **Attempto's reading:** If something X1 is a nth of something and something X2 and X2 is atomic then X1 is Nil.
- **Compiled:** `(implies (atom x) (equal (nth n x) nil))`
- **Library theorem:** `(implies (atom x) (equal (nth n x) nil))`

### `nth-when-too-large`

- **English:** If Y is an nth of N and X, and a natural-value of N is not smaller than a length of X then Y is Nil.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is a nth of X2 and something X4 and it is false that the natural-value X1 is smaller than a length of X4 then X3 is Nil.
- **Compiled:** `(implies (not (< (nfix n) (len x))) (equal (nth n x) nil))`
- **Library theorem:** `(implies (<= (len x) (nfix n)) (equal (nth n x) nil))`

### `nth-when-too-large-cheap`

- **English:** If Y is an nth of N and X, and a natural-value of N is not smaller than a length of X then Y is Nil.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is a nth of X2 and something X4 and it is false that the natural-value X1 is smaller than a length of X4 then X3 is Nil.
- **Compiled:** `(implies (not (< (nfix n) (len x))) (equal (nth n x) nil))`
- **Library theorem:** `(implies (<= (len x) (nfix n)) (equal (nth n x) nil))`

### `nthcdr-before-update-nth`

- **English:** If W is an update-nth of Y and U and X, and V is an nthcdr of Z and W, and Q is a natural-value of Y, and R is a natural-value of Z, and P is a difference of Q and R, and S is an nthcdr of Z and X, and a natural-value of Y is smaller than a length of X, and a natural-value of Y is not smaller than a natural-value of Z then V is an update-nth of P and U and S.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is an update-nth of X2 and something X4 and something X5 and something X6 is a nthcdr of something X7 and X3 and something X8 is a natural-value of X2 and something X9 is a natural-value of X7 and something X10 is a difference of X8 and X9 and something X11 is a nthcdr of X7 and X5 and a natural-value of X2 is smaller than a length of X5 and it is false that the natural-value X1 is smaller than a natural-value of X7 then X6 is an update-nth of X10 and X4 and X11.
- **Compiled:** `(implies (and (< (nfix n2) (len x)) (not (< (nfix n2) (nfix n1)))) (equal (nthcdr n1 (update-nth n2 val x)) (update-nth (- (nfix n2) (nfix n1)) val (nthcdr n1 x))))`
- **Library theorem:** `(implies (and (< (nfix n2) (len x)) (<= (nfix n1) (nfix n2))) (equal (nthcdr n1 (update-nth n2 val x)) (update-nth (+ (nfix n2) (- (nfix n1))) val (nthcdr n1 x))))`

### `nthcdr-of-cdr`

- **English:** If Z is a tail of X, and Y is an nthcdr of I and Z then Y is a tail of an nthcdr of I and X.
- **Attempto's reading:** If something X1 is a tail of something X2 and something X3 is a nthcdr of something X4 and X1 then X3 is a tail of a nthcdr of X4 and X2.
- **Compiled:** `(equal (nthcdr i (cdr x)) (cdr (nthcdr i x)))`
- **Library theorem:** `(equal (nthcdr i (cdr x)) (cdr (nthcdr i x)))`

### `nthcdr-of-list-fix`

- **English:** If Z is a list-fix of X, and Y is an nthcdr of N and Z then Y is a list-fix of an nthcdr of N and X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 and something X3 is a nthcdr of something X4 and X1 then X3 is a list-fix of a nthcdr of X4 and X2.
- **Compiled:** `(equal (nthcdr n (true-list-fix x)) (true-list-fix (nthcdr n x)))`
- **Library theorem:** `(equal (nthcdr n (true-list-fix x)) (true-list-fix (nthcdr n x)))`

### `nthcdr-of-nthcdr`

- **English:** If Z is an nthcdr of B and X, and Y is an nthcdr of A and Z, and V is a natural-value of A, and W is a natural-value of B, and U is a sum of V and W then Y is an nthcdr of U and X.
- **Attempto's reading:** If something X1 is a nthcdr of something X2 and something X3 and something X4 is a nthcdr of something X5 and X1 and something X6 is a natural-value of X5 and something X7 is a natural-value of X2 and something X8 is a sum of X6 and X7 then X4 is a nthcdr of X8 and X3.
- **Compiled:** `(equal (nthcdr a (nthcdr b x)) (nthcdr (+ (nfix a) (nfix b)) x))`
- **Library theorem:** `(equal (nthcdr a (nthcdr b x)) (nthcdr (+ (nfix a) (nfix b)) x))`

### `nthcdr-of-repeat`

- **English:** If Y is a repeat of K and A, and X is an nthcdr of N and Y, and U is a natural-value of K, and V is a natural-value of N, and Z is a difference of U and V, and a natural-value of K is not smaller than a natural-value of N then X is a repeat of Z and A. If X is a repeat of K and A, and a natural-value of K is smaller than a natural-value of N then an nthcdr of N and X is Nil.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is a repeat of X2 and something X4 and something X5 is a nthcdr of something X6 and X3 and something X7 is a natural-value of X2 and something X8 is a natural-value of X6 and something X9 is a difference of X7 and X8 and it is false that the natural-value X1 is smaller than a natural-value of X6 then X5 is a repeat of X9 and X4. If something X1 is a repeat of something X2 and something and a natural-value of X2 is smaller than a natural-value of something X3 then a nthcdr of X3 and X1 is Nil.
- **Compiled:** `(and (implies (not (< (nfix k) (nfix n))) (equal (nthcdr n (repeat k a)) (repeat (- (nfix k) (nfix n)) a))) (implies (< (nfix k) (nfix n)) (equal (nthcdr n (repeat k a)) nil)))`
- **Library theorem:** `(equal (nthcdr n (repeat k a)) (and (<= (nfix n) (nfix k)) (repeat (+ (nfix k) (- (nfix n))) a)))`

### `nthcdr-of-update-nth`

- **English:** If V is an update-nth of Z and U and X, and a natural-value of Z is smaller than a natural-value of Y then an nthcdr of Y and V is an nthcdr of Y and X. If W is an update-nth of Z and U and X, and V is an nthcdr of Y and W, and Q is a natural-value of Z, and R is a natural-value of Y, and P is a difference of Q and R, and S is an nthcdr of Y and X, and a natural-value of Z is not smaller than a natural-value of Y then V is an update-nth of P and U and S.
- **Attempto's reading:** If something X1 is an update-nth of something X2 and something and something X3 and a natural-value of X2 is smaller than a natural-value of something X4 then a nthcdr of X4 and X1 is a nthcdr of X4 and X3. If there is a natural-value X1 of something X2 and something X3 is an update-nth of X2 and something X4 and something X5 and something X6 is a nthcdr of something X7 and X3 and something X8 is a natural-value of X2 and something X9 is a natural-value of X7 and something X10 is a difference of X8 and X9 and something X11 is a nthcdr of X7 and X5 and it is false that the natural-value X1 is smaller than a natural-value of X7 then X6 is an update-nth of X10 and X4 and X11.
- **Compiled:** `(and (implies (< (nfix n2) (nfix n1)) (equal (nthcdr n1 (update-nth n2 val x)) (nthcdr n1 x))) (implies (not (< (nfix n2) (nfix n1))) (equal (nthcdr n1 (update-nth n2 val x)) (update-nth (- (nfix n2) (nfix n1)) val (nthcdr n1 x)))))`
- **Library theorem:** `(equal (nthcdr n1 (update-nth n2 val x)) (if (< (nfix n2) (nfix n1)) (nthcdr n1 x) (update-nth (+ (nfix n2) (- (nfix n1))) val (nthcdr n1 x))))`

### `nthcdr-past-update-nth`

- **English:** If V is an update-nth of Y and U and X, and a natural-value of Y is smaller than a length of X, and a natural-value of Y is smaller than a natural-value of Z then an nthcdr of Z and V is an nthcdr of Z and X.
- **Attempto's reading:** If something X1 is an update-nth of something X2 and something and something X3 and a natural-value of X2 is smaller than a length of X3 and a natural-value of X2 is smaller than a natural-value of something X4 then a nthcdr of X4 and X1 is a nthcdr of X4 and X3.
- **Compiled:** `(implies (and (< (nfix n2) (len x)) (< (nfix n2) (nfix n1))) (equal (nthcdr n1 (update-nth n2 val x)) (nthcdr n1 x)))`
- **Library theorem:** `(implies (and (< (nfix n2) (len x)) (< (nfix n2) (nfix n1))) (equal (nthcdr n1 (update-nth n2 val x)) (nthcdr n1 x)))`

### `nthcdr-when-less-than-len-under-iff`

- **English:** If a natural-value of N is smaller than a length of X then an nthcdr of N and X is not Nil.
- **Attempto's reading:** If a natural-value of something X1 is smaller than a length of something X2 then there is a nthcdr X3 of X1 and X2 and it is false that the nthcdr X3 is Nil.
- **Compiled:** `(implies (< (nfix n) (len x)) (not (equal (nthcdr n x) nil)))`
- **Library theorem:** `(implies (< (nfix n) (len x)) (iff (nthcdr n x) t))`

### `prefixp-append-append`

- **English:** If U is an append of X and Y, and an append of X and Z is a prefix of U then Z is a prefix of Y. If U is an append of X and Z, and V is an append of X and Y, and Z is a prefix of Y then U is a prefix of V.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and an append of X2 and something X4 is a prefix of X1 then X4 is a prefix of X3. If something X1 is an append of something X2 and something X3 and something X4 is an append of X2 and something X5 and X3 is a prefix of X5 then X1 is a prefix of X4.
- **Compiled:** `(and (implies (prefixp (append x1 x2) (append x1 y)) (prefixp x2 y)) (implies (prefixp x2 y) (prefixp (append x1 x2) (append x1 y))))`
- **Library theorem:** `(equal (prefixp (append x1 x2) (append x1 y)) (prefixp x2 y))`

### `prefixp-nthcdr-nthcdr`

- **English:** If Z is an nthcdr of N and X, and a take of N and Y is a take of N and X, and an nthcdr of N and Y is a prefix of Z, and a length of X is not smaller than N then Y is a prefix of X. If Z is an nthcdr of N and X, and a take of N and Y is a take of N and X, and Y is a prefix of X, and a length of X is not smaller than N then an nthcdr of N and Y is a prefix of Z.
- **Attempto's reading:** If there is a length X1 of something X2 and something X3 is a nthcdr of something X4 and X2 and a take of X4 and something X5 is a take of X4 and X2 and a nthcdr of X4 and X5 is a prefix of X3 and it is false that the length X1 is smaller than X4 then X5 is a prefix of X2. If there is a length X1 of something X2 and something X3 is a nthcdr of something X4 and X2 and a take of X4 and something X5 is a take of X4 and X2 and X5 is a prefix of X2 and it is false that the length X1 is smaller than X4 then a nthcdr of X4 and X5 is a prefix of X3.
- **Compiled:** `(and (implies (and (equal (take n l1) (take n l2)) (prefixp (nthcdr n l1) (nthcdr n l2)) (not (< (len l2) n))) (prefixp l1 l2)) (implies (and (equal (take n l1) (take n l2)) (prefixp l1 l2) (not (< (len l2) n))) (prefixp (nthcdr n l1) (nthcdr n l2))))`
- **Library theorem:** `(implies (and (<= n (len l2)) (equal (take n l1) (take n l2))) (equal (prefixp (nthcdr n l1) (nthcdr n l2)) (prefixp l1 l2)))`

### `prefixp-of-append-arg1`

- **English:** If U is a length of X, and V is a length of Y, and W is an nthcdr of U and Z, and an append of X and Y is a prefix of Z then a length of Z is not smaller than a sum of U and V and a list-fix of X is a take of U and Z and Y is a prefix of W. If U is a length of X, and V is an nthcdr of U and Z, and W is a length of Y, and a list-fix of X is a take of U and Z, and Y is a prefix of V, and a length of Z is not smaller than a sum of U and W then an append of X and Y is a prefix of Z.
- **Attempto's reading:** If something X1 is a length of something X2 and something X3 is a length of something X4 and something X5 is a nthcdr of X1 and something X6 and an append of X2 and X4 is a prefix of X6 then there is a length X7 of X6 and X4 is a prefix of X5 and a list-fix of X2 is a take of X1 and X6 and it is false that the length X7 is smaller than a sum of X1 and X3. If there is a length X1 of something X2 and something X3 is a length of something X4 and something X5 is a nthcdr of X3 and X2 and something X6 is a length of something X7 and a list-fix of X4 is a take of X3 and X2 and X7 is a prefix of X5 and it is false that the length X1 is smaller than a sum of X3 and X6 then an append of X4 and X7 is a prefix of X2.
- **Compiled:** `(and (implies (prefixp (append x y) z) (and (not (< (len z) (+ (len x) (len y)))) (equal (true-list-fix x) (take (len x) z)) (prefixp y (nthcdr (len x) z)))) (implies (and (equal (true-list-fix x) (take (len x) z)) (prefixp y (nthcdr (len x) z)) (not (< (len z) (+ (len x) (len y))))) (prefixp (append x y) z)))`
- **Library theorem:** `(equal (prefixp (append x y) z) (and (<= (+ (len x) (len y)) (len z)) (equal (true-list-fix x) (take (len x) z)) (prefixp y (nthcdr (len x) z))))`

### `prefixp-of-cons-left`

- **English:** If a cons of A and X is a prefix of Y then Y is a pair and A is a head of Y and X is a prefix of a tail of Y. If Y is a pair, and a head of Y is A, and X is a prefix of a tail of Y then a cons of A and X is a prefix of Y.
- **Attempto's reading:** If a cons of something X1 and something X2 is a prefix of something X3 then X1 is a head of X3 and X3 is a pair and X2 is a prefix of a tail of X3. If something X1 is a pair and a head of X1 is something X2 and something X3 is a prefix of a tail of X1 then a cons of X2 and X3 is a prefix of X1.
- **Compiled:** `(and (implies (prefixp (cons a x) y) (and (consp y) (equal a (car y)) (prefixp x (cdr y)))) (implies (and (consp y) (equal (car y) a) (prefixp x (cdr y))) (prefixp (cons a x) y)))`
- **Library theorem:** `(equal (prefixp (cons a x) y) (and (consp y) (equal a (car y)) (prefixp x (cdr y))))`

### `prefixp-of-cons-right`

- **English:** If Z is a cons of A and Y, and X is a prefix of Z, and X is a pair then a head of X is A and a tail of X is a prefix of Y. If Z is a cons of A and Y, and a head of X is A, and a tail of X is a prefix of Y, and X is a pair then X is a prefix of Z. If there is something X, and Z is a cons of A and Y, and X is not a pair then X is a prefix of Z.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is a prefix of X1 and X4 is a pair then a head of X4 is X2 and a tail of X4 is a prefix of X3. If something X1 is a cons of something X2 and something X3 and a head of something X4 is X2 and a tail of X4 is a prefix of X3 and X4 is a pair then X4 is a prefix of X1. If there is something X1 and something X2 is a cons of something and something and it is false that X1 is a pair then X1 is a prefix of X2.
- **Compiled:** `(and (implies (and (prefixp x (cons a y)) (consp x)) (and (equal (car x) a) (prefixp (cdr x) y))) (implies (and (equal (car x) a) (prefixp (cdr x) y) (consp x)) (prefixp x (cons a y))) (implies (not (consp x)) (prefixp x (cons a y))))`
- **Library theorem:** `(equal (prefixp x (cons a y)) (or (not (consp x)) (and (equal (car x) a) (prefixp (cdr x) y))))`

### `prefixp-of-list-fix-left`

- **English:** If a list-fix of X is a prefix of Y then X is a prefix of Y. If X is a prefix of Y then a list-fix of X is a prefix of Y.
- **Attempto's reading:** If a list-fix of something X1 is a prefix of something X2 then X1 is a prefix of X2. If something X1 is a prefix of something X2 then a list-fix of X1 is a prefix of X2.
- **Compiled:** `(and (implies (prefixp (true-list-fix x) y) (prefixp x y)) (implies (prefixp x y) (prefixp (true-list-fix x) y)))`
- **Library theorem:** `(equal (prefixp (true-list-fix x) y) (prefixp x y))`

### `prefixp-of-list-fix-right`

- **English:** If X is a prefix of a list-fix of Y then X is a prefix of Y. If X is a prefix of Y then X is a prefix of a list-fix of Y.
- **Attempto's reading:** If something X1 is a prefix of a list-fix of something X2 then X1 is a prefix of X2. If something X1 is a prefix of something X2 then X1 is a prefix of a list-fix of X2.
- **Compiled:** `(and (implies (prefixp x (true-list-fix y)) (prefixp x y)) (implies (prefixp x y) (prefixp x (true-list-fix y))))`
- **Library theorem:** `(equal (prefixp x (true-list-fix y)) (prefixp x y))`

### `prefixp-of-take`

- **English:** If a take of N and X is a prefix of X then a length of X is not smaller than a natural-value of N. If Y is a take of N and X, and a length of X is not smaller than a natural-value of N then Y is a prefix of X.
- **Attempto's reading:** If a take of something X1 and something X2 is a prefix of X2 then there is a length X3 of X2 and it is false that the length X3 is smaller than a natural-value of X1. If there is a length X1 of something X2 and something X3 is a take of something X4 and X2 and it is false that the length X1 is smaller than a natural-value of X4 then X3 is a prefix of X2.
- **Compiled:** `(and (implies (prefixp (take n x) x) (not (< (len x) (nfix n)))) (implies (not (< (len x) (nfix n))) (prefixp (take n x) x)))`
- **Library theorem:** `(equal (prefixp (take n x) x) (<= (nfix n) (len x)))`

### `prefixp-one-way-or-another`

- **English:** If X is a prefix of Z, and Y is a prefix of Z, and X is not a prefix of Y then Y is a prefix of X.
- **Attempto's reading:** If something X1 is a prefix of something X2 and something X3 is a prefix of X2 and it is false that X1 is a prefix of X3 then X3 is a prefix of X1.
- **Compiled:** `(implies (and (prefixp x z) (prefixp y z) (not (prefixp x y))) (prefixp y x))`
- **Library theorem:** `(implies (and (prefixp x z) (prefixp y z) (not (prefixp x y))) (prefixp y x))`

### `prefixp-reflexive`

- **English:** If there is something X then X is a prefix of X.
- **Attempto's reading:** If there is something X1 then X1 is a prefix of X1.
- **Compiled:** `(prefixp x x)`
- **Library theorem:** `(prefixp x x)`

### `prefixp-when-equal-lengths`

- **English:** If X is a prefix of Y, and a length of X is not smaller than a length of Y then X is list-equivalent-to Y. If X is list-equivalent-to Y, and a length of X is not smaller than a length of Y then X is a prefix of Y.
- **Attempto's reading:** If there is a length X1 of something X2 and X2 is a prefix of something X3 and it is false that the length X1 is smaller than a length of X3 then X2 is list-equivalent-to X3. If there is a length X1 of something X2 and X2 is list-equivalent-to something X3 and it is false that the length X1 is smaller than a length of X3 then X2 is a prefix of X3.
- **Compiled:** `(and (implies (and (prefixp x y) (not (< (len x) (len y)))) (list-equiv x y)) (implies (and (list-equiv x y) (not (< (len x) (len y)))) (prefixp x y)))`
- **Library theorem:** `(implies (<= (len y) (len x)) (equal (prefixp x y) (list-equiv x y)))`

### `prefixp-when-not-consp-left`

- **English:** If there is something X, and there is something Y, and X is not a pair then X is a prefix of Y.
- **Attempto's reading:** If there is something X1 and there is something X2 and it is false that X1 is a pair then X1 is a prefix of X2.
- **Compiled:** `(implies (not (consp x)) (prefixp x y))`
- **Library theorem:** `(implies (not (consp x)) (prefixp x y))`

### `prefixp-when-not-consp-right`

- **English:** If X is a prefix of Y, and Y is not a pair then X is not a pair. If there is something Y, and there is something X, and Y is not a pair, and X is not a pair then X is a prefix of Y.
- **Attempto's reading:** If something X1 is a prefix of something X2 and it is false that X2 is a pair then it is false that X1 is a pair. If there is something X1 and there is something X2 and it is false that X1 is a pair and it is false that X2 is a pair then X2 is a prefix of X1.
- **Compiled:** `(and (implies (and (prefixp x y) (not (consp y))) (not (consp x))) (implies (and (not (consp y)) (not (consp x))) (prefixp x y)))`
- **Library theorem:** `(implies (not (consp y)) (equal (prefixp x y) (not (consp x))))`

### `prefixp-when-prefixp`

- **English:** If Y is a prefix of X, and X is a prefix of Y then X is list-equivalent-to Y. If Y is a prefix of X, and X is list-equivalent-to Y then X is a prefix of Y.
- **Attempto's reading:** If something X1 is a prefix of something X2 and X2 is a prefix of X1 then X2 is list-equivalent-to X1. If something X1 is a prefix of something X2 and X2 is list-equivalent-to X1 then X2 is a prefix of X1.
- **Compiled:** `(and (implies (and (prefixp y x) (prefixp x y)) (list-equiv x y)) (implies (and (prefixp y x) (list-equiv x y)) (prefixp x y)))`
- **Library theorem:** `(implies (prefixp y x) (equal (prefixp x y) (list-equiv x y)))`

### `rcons-of-append`

- **English:** If U is an append of X and Y, and Z is a rcons of A and U, and V is a rcons of A and Y then Z is an append of X and V.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a rcons of something X5 and X1 and something X6 is a rcons of X5 and X3 then X4 is an append of X2 and X6.
- **Compiled:** `(equal (rcons a (append x y)) (append x (rcons a y)))`
- **Library theorem:** `(equal (rcons a (append x y)) (append x (rcons a y)))`

### `rcons-of-list-fix`

- **English:** If Z is a list-fix of X, and Y is a rcons of A and Z then Y is a rcons of A and X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 and something X3 is a rcons of something X4 and X1 then X3 is a rcons of X4 and X2.
- **Compiled:** `(equal (rcons a (true-list-fix x)) (rcons a x))`
- **Library theorem:** `(equal (rcons a (true-list-fix x)) (rcons a x))`

### `rcons-under-set-equiv`

- **English:** If Y is a rcons of A and X then Y is set-equivalent-to a cons of A and X.
- **Attempto's reading:** If something X1 is a rcons of something X2 and something X3 then X1 is set-equivalent-to a cons of X2 and X3.
- **Compiled:** `(set-equiv (rcons a x) (cons a x))`
- **Library theorem:** `(set-equiv (rcons a x) (cons a x))`

### `remove-duplicates-equal-of-cons`

- **English:** If A is a member of X then a deduplication of a cons of A and X is a deduplication of X. If Y is a cons of A and X, and Z is a deduplication of X, and A is not a member of X then a deduplication of Y is a cons of A and Z.
- **Attempto's reading:** If something X1 is a member of something X2 then a deduplication of a cons of X1 and X2 is a deduplication of X2. If something X1 is a cons of something X2 and something X3 and something X4 is a deduplication of X3 and it is false that X2 is a member of X3 then a deduplication of X1 is a cons of X2 and X4.
- **Compiled:** `(and (implies (member-equal a x) (equal (remove-duplicates-equal (cons a x)) (remove-duplicates-equal x))) (implies (not (member-equal a x)) (equal (remove-duplicates-equal (cons a x)) (cons a (remove-duplicates-equal x)))))`
- **Library theorem:** `(equal (remove-duplicates-equal (cons a x)) (if (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (remove-duplicates-equal x) (cons a (remove-duplicates-equal x))))`

### `remove-duplicates-equal-of-list-fix`

- **English:** If Y is a list-fix of X then a deduplication of Y is a deduplication of X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 then a deduplication of X1 is a deduplication of X2.
- **Compiled:** `(equal (remove-duplicates-equal (true-list-fix x)) (remove-duplicates-equal x))`
- **Library theorem:** `(equal (remove-duplicates-equal (true-list-fix x)) (remove-duplicates-equal x))`

### `remove-duplicates-equal-of-remove`

- **English:** If Y is a removal of A and X, and Z is a deduplication of X then a deduplication of Y is a removal of A and Z.
- **Attempto's reading:** If something X1 is a removal of something X2 and something X3 and something X4 is a deduplication of X3 then a deduplication of X1 is a removal of X2 and X4.
- **Compiled:** `(equal (remove-duplicates-equal (remove-equal a x)) (remove-equal a (remove-duplicates-equal x)))`
- **Library theorem:** `(equal (remove-duplicates-equal (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l)))) (let ((x a) (l (remove-duplicates-equal x))) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))))`

### `remove-duplicates-equal-under-set-equiv`

- **English:** If Y is a deduplication of X then Y is set-equivalent-to X.
- **Attempto's reading:** If something X1 is a deduplication of something X2 then X1 is set-equivalent-to X2.
- **Compiled:** `(set-equiv (remove-duplicates-equal x) x)`
- **Library theorem:** `(set-equiv (remove-duplicates-equal x) x)`

### `remove-duplicates-equal-when-atom`

- **English:** If X is atomic then a deduplication of X is Nil.
- **Attempto's reading:** If something X1 is atomic then a deduplication of X1 is Nil.
- **Compiled:** `(implies (atom x) (equal (remove-duplicates-equal x) nil))`
- **Library theorem:** `(implies (atom x) (equal (remove-duplicates-equal x) nil))`

### `remove-is-commutative`

- **English:** If Z is a removal of A and X, and Y is a removal of B and Z, and U is a removal of B and X then Y is a removal of A and U.
- **Attempto's reading:** If something X1 is a removal of something X2 and something X3 and something X4 is a removal of something X5 and X1 and something X6 is a removal of X5 and X3 then X4 is a removal of X2 and X6.
- **Compiled:** `(equal (remove-equal b (remove-equal a x)) (remove-equal a (remove-equal b x)))`
- **Library theorem:** `(equal (let ((x b) (l (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))))) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (let ((x a) (l (let ((x b) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))))) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))))`

### `remove-is-idempotent`

- **English:** If Y is a removal of A and X then a removal of A and Y is Y.
- **Attempto's reading:** If something X1 is a removal of something X2 and something then a removal of X2 and X1 is X1.
- **Compiled:** `(equal (remove-equal a (remove-equal a x)) (remove-equal a x))`
- **Library theorem:** `(equal (let ((x a) (l (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))))) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))))`

### `remove-of-append`

- **English:** If U is an append of X and Y, and Z is a removal of A and U, and V is a removal of A and X, and W is a removal of A and Y then Z is an append of V and W.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a removal of something X5 and X1 and something X6 is a removal of X5 and X2 and something X7 is a removal of X5 and X3 then X4 is an append of X6 and X7.
- **Compiled:** `(equal (remove-equal a (append x y)) (append (remove-equal a x) (remove-equal a y)))`
- **Library theorem:** `(equal (let ((x a) (l (append x y))) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (append (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (let ((x a) (l y)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l)))))`

### `remove-of-cons`

- **English:** If Y is a cons of B and X, and A is B then a removal of A and Y is a removal of A and X. If Z is a cons of B and X, and Y is a removal of A and Z, and U is a removal of A and X, and A is not B then Y is a cons of B and U.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is X2 then a removal of X4 and X1 is a removal of X4 and X3. If something X1 is a cons of something X2 and something X3 and something X4 is a removal of something X5 and X1 and something X6 is a removal of X5 and X3 and it is false that X5 is X2 then X4 is a cons of X2 and X6.
- **Compiled:** `(and (implies (equal a b) (equal (remove-equal a (cons b x)) (remove-equal a x))) (implies (not (equal a b)) (equal (remove-equal a (cons b x)) (cons b (remove-equal a x)))))`
- **Library theorem:** `(equal (let ((x a) (l (cons b x))) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (if (equal a b) (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (cons b (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))))))`

### `remove-of-intersection-equal`

- **English:** If U is an intersection of X and Y, and Z is a removal of A and U, and V is a removal of A and X, and W is a removal of A and Y then Z is an intersection of V and W.
- **Attempto's reading:** If something X1 is an intersection of something X2 and something X3 and something X4 is a removal of something X5 and X1 and something X6 is a removal of X5 and X2 and something X7 is a removal of X5 and X3 then X4 is an intersection of X6 and X7.
- **Compiled:** `(equal (remove-equal a (intersection-equal x y)) (intersection-equal (remove-equal a x) (remove-equal a y)))`
- **Library theorem:** `(equal (let ((x a) (l (intersection-equal x y))) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (intersection-equal (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (let ((x a) (l y)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l)))))`

### `remove-of-rev`

- **English:** If Z is a reversal of X, and Y is a removal of A and Z then Y is a reversal of a removal of A and X.
- **Attempto's reading:** If something X1 is a reversal of something X2 and something X3 is a removal of something X4 and X1 then X3 is a reversal of a removal of X4 and X2.
- **Compiled:** `(equal (remove-equal a (rev x)) (rev (remove-equal a x)))`
- **Library theorem:** `(equal (let ((x a) (l (rev x))) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (rev (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l)))))`

### `remove-of-revappend`

- **English:** If U is a revappend of X and Y, and Z is a removal of A and U, and V is a removal of A and X, and W is a removal of A and Y then Z is a revappend of V and W.
- **Attempto's reading:** If something X1 is a revappend of something X2 and something X3 and something X4 is a removal of something X5 and X1 and something X6 is a removal of X5 and X2 and something X7 is a removal of X5 and X3 then X4 is a revappend of X6 and X7.
- **Compiled:** `(equal (remove-equal a (revappend x y)) (revappend (remove-equal a x) (remove-equal a y)))`
- **Library theorem:** `(equal (let ((x a) (l (revappend x y))) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (revappend (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (let ((x a) (l y)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l)))))`

### `remove-of-set-difference-equal`

- **English:** If U is a set-difference of X and Y, and Z is a removal of A and U, and V is a removal of A and X then Z is a set-difference of V and Y.
- **Attempto's reading:** If something X1 is a set-difference of something X2 and something X3 and something X4 is a removal of something X5 and X1 and something X6 is a removal of X5 and X2 then X4 is a set-difference of X6 and X3.
- **Compiled:** `(equal (remove-equal a (set-difference-equal x y)) (set-difference-equal (remove-equal a x) y))`
- **Library theorem:** `(equal (let ((x a) (l (set-difference-equal x y))) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (set-difference-equal (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) y))`

### `remove-of-union-equal`

- **English:** If U is an union of X and Y, and Z is a removal of A and U, and V is a removal of A and X, and W is a removal of A and Y then Z is an union of V and W.
- **Attempto's reading:** If something X1 is a union of something X2 and something X3 and something X4 is a removal of something X5 and X1 and something X6 is a removal of X5 and X2 and something X7 is a removal of X5 and X3 then X4 is a union of X6 and X7.
- **Compiled:** `(equal (remove-equal a (union-equal x y)) (union-equal (remove-equal a x) (remove-equal a y)))`
- **Library theorem:** `(equal (let ((x a) (l (union-equal x y))) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (union-equal (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (let ((x a) (l y)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l)))))`

### `remove-under-iff`

- **English:** If Y is a cons of A and Nil, and Z is a removal of A and X, and Z is not Nil then X is not a subset of Y. If Y is a removal of A and X, and Z is a cons of A and Nil, and X is not a subset of Z then Y is not Nil.
- **Attempto's reading:** If something X1 is a cons of something X2 and Nil and something X3 is a removal of X2 and something X4 and it is false that X3 is Nil then it is false that X4 is a subset of X1. If something X1 is a removal of something X2 and something X3 and something X4 is a cons of X2 and Nil and it is false that X3 is a subset of X4 then it is false that X1 is Nil.
- **Compiled:** `(and (implies (not (equal (remove-equal a x) nil)) (not (subsetp-equal x (cons a nil)))) (implies (not (subsetp-equal x (cons a nil))) (not (equal (remove-equal a x) nil))))`
- **Library theorem:** `(iff (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (not (let ((y (list a))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))))`

### `remove-when-atom`

- **English:** If Y is a removal of A and X, and X is atomic then Y is Nil.
- **Attempto's reading:** If something X1 is a removal of something and something X2 and X2 is atomic then X1 is Nil.
- **Compiled:** `(implies (atom x) (equal (remove-equal a x) nil))`
- **Library theorem:** `(implies (atom x) (equal (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) nil))`

### `remove-when-non-member`

- **English:** If Y is a removal of A and X, and A is not a member of X then Y is a list-fix of X.
- **Attempto's reading:** If something X1 is a removal of something X2 and something X3 and it is false that X2 is a member of X3 then X1 is a list-fix of X3.
- **Compiled:** `(implies (not (member-equal a x)) (equal (remove-equal a x) (true-list-fix x)))`
- **Library theorem:** `(implies (not (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l)))) (equal (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))) (true-list-fix x)))`

### `repeat-1`

- **English:** If X is a repeat of 1 and A then X is a cons of A and Nil.
- **Attempto's reading:** If something X1 is a repeat of 1 and something X2 then X1 is a cons of X2 and Nil.
- **Compiled:** `(equal (repeat 1 a) (cons a nil))`
- **Library theorem:** `(equal (repeat 1 a) (list a))`

### `repeat-of-nfix`

- **English:** If Y is a natural-value of N, and Z is a repeat of Y and X then Z is a repeat of N and X.
- **Attempto's reading:** If something X1 is a natural-value of something X2 and something X3 is a repeat of X1 and something X4 then X3 is a repeat of X2 and X4.
- **Compiled:** `(equal (repeat (nfix n) x) (repeat n x))`
- **Library theorem:** `(equal (repeat (nfix n) x) (repeat n x))`

### `rev-of-append`

- **English:** If Z is an append of X and Y, and U is a reversal of Y, and V is a reversal of X then a reversal of Z is an append of U and V.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a reversal of X3 and something X5 is a reversal of X2 then a reversal of X1 is an append of X4 and X5.
- **Compiled:** `(equal (rev (append x y)) (append (rev y) (rev x)))`
- **Library theorem:** `(equal (rev (append x y)) (append (rev y) (rev x)))`

### `rev-of-cons`

- **English:** If Y is a cons of A and X, and Z is a reversal of X, and U is a cons of A and Nil then a reversal of Y is an append of Z and U.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is a reversal of X3 and something X5 is a cons of X2 and Nil then a reversal of X1 is an append of X4 and X5.
- **Compiled:** `(equal (rev (cons a x)) (append (rev x) (cons a nil)))`
- **Library theorem:** `(equal (rev (cons a x)) (append (rev x) (list a)))`

### `rev-of-list-fix`

- **English:** If Y is a list-fix of X then a reversal of Y is a reversal of X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 then a reversal of X1 is a reversal of X2.
- **Compiled:** `(equal (rev (true-list-fix x)) (rev x))`
- **Library theorem:** `(equal (rev (true-list-fix x)) (rev x))`

### `rev-of-rcons`

- **English:** If Y is a rcons of A and X, and Z is a reversal of X then a reversal of Y is a cons of A and Z.
- **Attempto's reading:** If something X1 is a rcons of something X2 and something X3 and something X4 is a reversal of X3 then a reversal of X1 is a cons of X2 and X4.
- **Compiled:** `(equal (rev (rcons a x)) (cons a (rev x)))`
- **Library theorem:** `(equal (rev (rcons a x)) (cons a (rev x)))`

### `rev-of-repeat`

- **English:** If X is a repeat of N and A then a reversal of X is X.
- **Attempto's reading:** If something X1 is a repeat of something and something then a reversal of X1 is X1.
- **Compiled:** `(equal (rev (repeat n a)) (repeat n a))`
- **Library theorem:** `(equal (rev (repeat n a)) (repeat n a))`

### `rev-of-rev`

- **English:** If Y is a reversal of X then a reversal of Y is a list-fix of X.
- **Attempto's reading:** If something X1 is a reversal of something X2 then a reversal of X1 is a list-fix of X2.
- **Compiled:** `(equal (rev (rev x)) (true-list-fix x))`
- **Library theorem:** `(equal (rev (rev x)) (true-list-fix x))`

### `rev-under-iff`

- **English:** If Y is a reversal of X, and Y is not Nil then X is a pair. If X is a pair then a reversal of X is not Nil.
- **Attempto's reading:** If something X1 is a reversal of something X2 and it is false that X1 is Nil then X2 is a pair. If something X1 is a pair then there is a reversal X2 of X1 and it is false that the reversal X2 is Nil.
- **Compiled:** `(and (implies (not (equal (rev x) nil)) (consp x)) (implies (consp x) (not (equal (rev x) nil))))`
- **Library theorem:** `(iff (rev x) (consp x))`

### `rev-under-set-equiv`

- **English:** If Y is a reversal of X then Y is set-equivalent-to X.
- **Attempto's reading:** If something X1 is a reversal of something X2 then X1 is set-equivalent-to X2.
- **Compiled:** `(set-equiv (rev x) x)`
- **Library theorem:** `(set-equiv (rev x) x)`

### `rev-when-not-consp`

- **English:** If Y is a reversal of X, and X is not a pair then Y is Nil.
- **Attempto's reading:** If something X1 is a reversal of something X2 and it is false that X2 is a pair then X1 is Nil.
- **Compiled:** `(implies (not (consp x)) (equal (rev x) nil))`
- **Library theorem:** `(implies (not (consp x)) (equal (rev x) nil))`

### `revappend-of-rcons`

- **English:** If Z is a rcons of A and X, and U is a revappend of Z and Y, and V is a revappend of X and Y then U is a cons of A and V.
- **Attempto's reading:** If something X1 is a rcons of something X2 and something X3 and something X4 is a revappend of X1 and something X5 and something X6 is a revappend of X3 and X5 then X4 is a cons of X2 and X6.
- **Compiled:** `(equal (revappend (rcons a x) y) (cons a (revappend x y)))`
- **Library theorem:** `(equal (revappend (rcons a x) y) (cons a (revappend x y)))`

### `revappend-removal`

- **English:** If Z is a revappend of X and Y, and U is a reversal of X then Z is an append of U and Y.
- **Attempto's reading:** If something X1 is a revappend of something X2 and something X3 and something X4 is a reversal of X2 then X1 is an append of X4 and X3.
- **Compiled:** `(equal (revappend x y) (append (rev x) y))`
- **Library theorem:** `(equal (revappend x y) (append (rev x) y))`

### `revappend-under-set-equiv`

- **English:** If Z is a revappend of X and Y then Z is set-equivalent-to an append of X and Y.
- **Attempto's reading:** If something X1 is a revappend of something X2 and something X3 then X1 is set-equivalent-to an append of X2 and X3.
- **Compiled:** `(set-equiv (revappend x y) (append x y))`
- **Library theorem:** `(set-equiv (revappend x y) (append x y))`

### `reverse-removal`

- **English:** If X is a true-list then a reverse of X is a reversal of X.
- **Attempto's reading:** If something X1 is a true-list then a reverse of X1 is a reversal of X1.
- **Compiled:** `(implies (true-listp x) (equal (reverse x) (rev x)))`
- **Library theorem:** `(implies (true-listp x) (equal (reverse x) (rev x)))`

### `reverse-under-set-equiv`

- **English:** If Y is a reverse of X then Y is set-equivalent-to X.
- **Attempto's reading:** If something X1 is a reverse of something X2 then X1 is set-equivalent-to X2.
- **Compiled:** `(set-equiv (reverse x) x)`
- **Library theorem:** `(set-equiv (reverse x) x)`

### `second-of-take`

- **English:** If Y is a take of N and X, and a natural-value of N is not smaller than 2 then a head of a tail of Y is a head of a tail of X.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is a take of X2 and something X4 and it is false that the natural-value X1 is smaller than 2 then a head of a tail of X3 is a head of a tail of X4.
- **Compiled:** `(implies (not (< (nfix n) 2)) (equal (car (cdr (take n x))) (car (cdr x))))`
- **Library theorem:** `(implies (<= 2 (nfix n)) (equal (cadr (take n x)) (cadr x)))`

### `set-difference-equal-of-cons`

- **English:** If Z is a cons of A and X, and A is a member of Y then a set-difference of Z and Y is a set-difference of X and Y. If Z is a cons of A and X, and U is a set-difference of Z and Y, and V is a set-difference of X and Y, and A is not a member of Y then U is a cons of A and V.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and X2 is a member of something X4 then a set-difference of X1 and X4 is a set-difference of X3 and X4. If something X1 is a cons of something X2 and something X3 and something X4 is a set-difference of X1 and something X5 and something X6 is a set-difference of X3 and X5 and it is false that X2 is a member of X5 then X4 is a cons of X2 and X6.
- **Compiled:** `(and (implies (member-equal a y) (equal (set-difference-equal (cons a x) y) (set-difference-equal x y))) (implies (not (member-equal a y)) (equal (set-difference-equal (cons a x) y) (cons a (set-difference-equal x y)))))`
- **Library theorem:** `(equal (set-difference-equal (cons a x) y) (if (member-equal a y) (set-difference-equal x y) (cons a (set-difference-equal x y))))`

### `set-difference-equal-when-atom`

- **English:** If Z is a set-difference of X and Y, and X is atomic then Z is Nil.
- **Attempto's reading:** If something X1 is a set-difference of something X2 and something and X2 is atomic then X1 is Nil.
- **Compiled:** `(implies (atom x) (equal (set-difference-equal x y) nil))`
- **Library theorem:** `(implies (atom x) (equal (set-difference-equal x y) nil))`

### `set-difference-equal-when-subsetp-equal`

- **English:** If X is a subset of Y then a set-difference of X and Y is Nil.
- **Attempto's reading:** If something X1 is a subset of something X2 then a set-difference of X1 and X2 is Nil.
- **Compiled:** `(implies (subsetp-equal x y) (equal (set-difference-equal x y) nil))`
- **Library theorem:** `(implies (subsetp-equal x y) (equal (set-difference-equal x y) nil))`

### `set-equiv-asym`

- **English:** If X is set-equivalent-to Y then Y is set-equivalent-to X. If Y is set-equivalent-to X then X is set-equivalent-to Y.
- **Attempto's reading:** If something X1 is set-equivalent-to something X2 then X2 is set-equivalent-to X1. If something X1 is set-equivalent-to something X2 then X2 is set-equivalent-to X1.
- **Compiled:** `(and (implies (set-equiv x y) (set-equiv y x)) (implies (set-equiv y x) (set-equiv x y)))`
- **Library theorem:** `(equal (set-equiv x y) (set-equiv y x))`

### `set-equiv-of-cons-self`

- **English:** If X is set-equivalent-to a cons of A and X then A is a member of X. If A is a member of X then X is set-equivalent-to a cons of A and X.
- **Attempto's reading:** If something X1 is set-equivalent-to a cons of something X2 and X1 then X2 is a member of X1. If something X1 is a member of something X2 then X2 is set-equivalent-to a cons of X1 and X2.
- **Compiled:** `(and (implies (set-equiv x (cons a x)) (member-equal a x)) (implies (member-equal a x) (set-equiv x (cons a x))))`
- **Library theorem:** `(equal (set-equiv x (cons a x)) (and (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) t))`

### `set-equiv-of-nil`

- **English:** If Nil is set-equivalent-to X then X is atomic. If X is atomic then Nil is set-equivalent-to X.
- **Attempto's reading:** If Nil is set-equivalent-to something X1 then X1 is atomic. If something X1 is atomic then Nil is set-equivalent-to X1.
- **Compiled:** `(and (implies (set-equiv nil x) (atom x)) (implies (atom x) (set-equiv nil x)))`
- **Library theorem:** `(equal (set-equiv nil x) (atom x))`

### `set-equiv-with-append-other-left`

- **English:** If X is set-equivalent-to an append of Y and X then Y is a subset of X. If Y is a subset of X then X is set-equivalent-to an append of Y and X.
- **Attempto's reading:** If something X1 is set-equivalent-to an append of something X2 and X1 then X2 is a subset of X1. If something X1 is a subset of something X2 then X2 is set-equivalent-to an append of X1 and X2.
- **Compiled:** `(and (implies (set-equiv x (append y x)) (subsetp-equal y x)) (implies (subsetp-equal y x) (set-equiv x (append y x))))`
- **Library theorem:** `(equal (set-equiv x (append y x)) (let ((x y) (y x)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))))`

### `set-equiv-with-append-other-right`

- **English:** If X is set-equivalent-to an append of X and Y then Y is a subset of X. If Y is a subset of X then X is set-equivalent-to an append of X and Y.
- **Attempto's reading:** If something X1 is set-equivalent-to an append of X1 and something X2 then X2 is a subset of X1. If something X1 is a subset of something X2 then X2 is set-equivalent-to an append of X2 and X1.
- **Compiled:** `(and (implies (set-equiv x (append x y)) (subsetp-equal y x)) (implies (subsetp-equal y x) (set-equiv x (append x y))))`
- **Library theorem:** `(equal (set-equiv x (append x y)) (let ((x y) (y x)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))))`

### `sublistp-complete`

- **English:** If Z is an nthcdr of N and Y, and X is a prefix of Z then X is a sublist of Y.
- **Attempto's reading:** If something X1 is a nthcdr of something and something X2 and something X3 is a prefix of X1 then X3 is a sublist of X2.
- **Compiled:** `(implies (prefixp x (nthcdr n y)) (sublistp x y))`
- **Library theorem:** `(implies (prefixp x (nthcdr n y)) (sublistp x y))`

### `sublistp-of-cons-right`

- **English:** If Z is a cons of A and Y, and X is a sublist of Z then X is a prefix of Z or X is a sublist of Y. If there is something X, and Z is a cons of A and Y, and X is a prefix of Z or X is a sublist of Y then X is a sublist of Z.
- **Attempto's reading:** If something X1 is a cons of something and something X2 and something X3 is a sublist of X1 then X3 is a prefix of X1 or X3 is a sublist of X2. If there is something X1 and something X2 is a cons of something and something X3, and X1 is a prefix of X2 or X1 is a sublist of X3 then X1 is a sublist of X2.
- **Compiled:** `(and (implies (sublistp x (cons a y)) (or (prefixp x (cons a y)) (sublistp x y))) (implies (or (prefixp x (cons a y)) (sublistp x y)) (sublistp x (cons a y))))`
- **Library theorem:** `(equal (sublistp x (cons a y)) (or (prefixp x (cons a y)) (sublistp x y)))`

### `sublistp-of-list-fix-left`

- **English:** If a list-fix of X is a sublist of Y then X is a sublist of Y. If X is a sublist of Y then a list-fix of X is a sublist of Y.
- **Attempto's reading:** If a list-fix of something X1 is a sublist of something X2 then X1 is a sublist of X2. If something X1 is a sublist of something X2 then a list-fix of X1 is a sublist of X2.
- **Compiled:** `(and (implies (sublistp (true-list-fix x) y) (sublistp x y)) (implies (sublistp x y) (sublistp (true-list-fix x) y)))`
- **Library theorem:** `(equal (sublistp (true-list-fix x) y) (sublistp x y))`

### `sublistp-of-list-fix-right`

- **English:** If X is a sublist of a list-fix of Y then X is a sublist of Y. If X is a sublist of Y then X is a sublist of a list-fix of Y.
- **Attempto's reading:** If something X1 is a sublist of a list-fix of something X2 then X1 is a sublist of X2. If something X1 is a sublist of something X2 then X1 is a sublist of a list-fix of X2.
- **Compiled:** `(and (implies (sublistp x (true-list-fix y)) (sublistp x y)) (implies (sublistp x y) (sublistp x (true-list-fix y))))`
- **Library theorem:** `(equal (sublistp x (true-list-fix y)) (sublistp x y))`

### `sublistp-sound`

- **English:** If U is a listpos of X and Y, and Z is an nthcdr of U and Y, and X is a sublist of Y then X is a prefix of Z.
- **Attempto's reading:** If something X1 is a listpos of something X2 and something X3 and X2 is a sublist of X3 and something X4 is a nthcdr of X1 and X3 then X2 is a prefix of X4.
- **Compiled:** `(implies (sublistp x y) (prefixp x (nthcdr (listpos x y) y)))`
- **Library theorem:** `(implies (sublistp x y) (let ((n (listpos x y))) (prefixp x (nthcdr n y))))`

### `sublistp-when-atom-left`

- **English:** If there is something Y, and X is atomic then X is a sublist of Y.
- **Attempto's reading:** If there is something X1 and something X2 is atomic then X2 is a sublist of X1.
- **Compiled:** `(implies (atom x) (sublistp x y))`
- **Library theorem:** `(implies (atom x) (equal (sublistp x y) t))`

### `sublistp-when-atom-right`

- **English:** If Y is atomic, and X is a sublist of Y then X is atomic. If Y is atomic, and X is atomic then X is a sublist of Y.
- **Attempto's reading:** If something X1 is atomic and something X2 is a sublist of X1 then X2 is atomic. If something X1 is atomic and something X2 is atomic then X2 is a sublist of X1.
- **Compiled:** `(and (implies (and (atom y) (sublistp x y)) (atom x)) (implies (and (atom y) (atom x)) (sublistp x y)))`
- **Library theorem:** `(implies (atom y) (equal (sublistp x y) (atom x)))`

### `sublistp-when-prefixp`

- **English:** If X is a prefix of Y then X is a sublist of Y.
- **Attempto's reading:** If something X1 is a prefix of something X2 then X1 is a sublist of X2.
- **Compiled:** `(implies (prefixp x y) (sublistp x y))`
- **Library theorem:** `(implies (prefixp x y) (sublistp x y))`

### `subsetp-append1`

- **English:** If an append of A and B is a subset of C then A is a subset of C and B is a subset of C. If A is a subset of C, and B is a subset of C then an append of A and B is a subset of C.
- **Attempto's reading:** If an append of something X1 and something X2 is a subset of something X3 then X1 is a subset of X3 and X2 is a subset of X3. If something X1 is a subset of something X2 and something X3 is a subset of X2 then an append of X1 and X3 is a subset of X2.
- **Compiled:** `(and (implies (subsetp-equal (append a b) c) (and (subsetp-equal a c) (subsetp-equal b c))) (implies (and (subsetp-equal a c) (subsetp-equal b c)) (subsetp-equal (append a b) c)))`
- **Library theorem:** `(equal (let ((x (append a b)) (y c)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (and (let ((x a) (y c)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (let ((x b) (y c)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))))`

### `subsetp-append2`

- **English:** If X is an append of A and B then A is a subset of X.
- **Attempto's reading:** If something X1 is an append of something X2 and something then X2 is a subset of X1.
- **Compiled:** `(subsetp-equal a (append a b))`
- **Library theorem:** `(let ((x a) (y (append a b))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))`

### `subsetp-append3`

- **English:** If X is an append of A and B then B is a subset of X.
- **Attempto's reading:** If something X1 is an append of something and something X2 then X2 is a subset of X1.
- **Compiled:** `(subsetp-equal b (append a b))`
- **Library theorem:** `(let ((x b) (y (append a b))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))`

### `subsetp-car-member`

- **English:** If X is a subset of Y, and X is a pair then a head of X is a member of Y.
- **Attempto's reading:** If something X1 is a subset of something X2 and X1 is a pair then a head of X1 is a member of X2.
- **Compiled:** `(implies (and (subsetp-equal x y) (consp x)) (member-equal (car x) y))`
- **Library theorem:** `(implies (and (let nil (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (consp x)) (let ((x (car x)) (l y)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))))`

### `subsetp-cons-2`

- **English:** If Y is a cons of X and B, and A is a subset of B then A is a subset of Y.
- **Attempto's reading:** If something X1 is a cons of something and something X2 and something X3 is a subset of X2 then X3 is a subset of X1.
- **Compiled:** `(implies (subsetp-equal a b) (subsetp-equal a (cons x b)))`
- **Library theorem:** `(implies (let ((x a) (y b)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (let ((x a) (y (cons x b))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))))`

### `subsetp-cons-same`

- **English:** If Y is a cons of X and A, and Z is a cons of X and B, and A is a subset of B then Y is a subset of Z.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is a cons of X2 and something X5 and X3 is a subset of X5 then X1 is a subset of X4.
- **Compiled:** `(implies (subsetp-equal a b) (subsetp-equal (cons x a) (cons x b)))`
- **Library theorem:** `(implies (let ((x a) (y b)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (let ((x (cons x a)) (y (cons x b))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))))`

### `subsetp-equal-of-intersection$-1`

- **English:** If Z is an intersection of X and Y then Z is a subset of X.
- **Attempto's reading:** If something X1 is an intersection of something X2 and something then X1 is a subset of X2.
- **Compiled:** `(subsetp-equal (intersection-equal x y) x)`
- **Library theorem:** `(subsetp-equal (let ((x0 x) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1))) x)`

### `subsetp-equal-of-intersection$-2`

- **English:** If Z is an intersection of X and Y then Z is a subset of Y.
- **Attempto's reading:** If something X1 is an intersection of something and something X2 then X1 is a subset of X2.
- **Compiled:** `(subsetp-equal (intersection-equal x y) y)`
- **Library theorem:** `(subsetp-equal (let ((x0 x) (x1 y)) (mbe :logic (let ((l1 x0) (l2 x1)) (prog2$ (intersection-eql-exec$guard-check l1 l2) (intersection-equal l1 l2))) :exec (intersection-eql-exec x0 x1))) y)`

### `subsetp-implies-subsetp-cdr`

- **English:** If X is a subset of Y then a tail of X is a subset of Y.
- **Attempto's reading:** If something X1 is a subset of something X2 then a tail of X1 is a subset of X2.
- **Compiled:** `(implies (subsetp-equal x y) (subsetp-equal (cdr x) y))`
- **Library theorem:** `(implies (let nil (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (let ((x (cdr x))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))))`

### `subsetp-intersection-equal`

- **English:** If X is an intersection of B and C, and A is a subset of X then A is a subset of B and A is a subset of C. If X is an intersection of B and C, and A is a subset of B, and A is a subset of C then A is a subset of X.
- **Attempto's reading:** If something X1 is an intersection of something X2 and something X3 and something X4 is a subset of X1 then X4 is a subset of X2 and X4 is a subset of X3. If something X1 is an intersection of something X2 and something X3 and something X4 is a subset of X2 and X4 is a subset of X3 then X4 is a subset of X1.
- **Compiled:** `(and (implies (subsetp-equal a (intersection-equal b c)) (and (subsetp-equal a b) (subsetp-equal a c))) (implies (and (subsetp-equal a b) (subsetp-equal a c)) (subsetp-equal a (intersection-equal b c))))`
- **Library theorem:** `(iff (let ((x a) (y (intersection-equal b c))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (and (let ((x a) (y b)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (let ((x a) (y c)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))))`

### `subsetp-member`

- **English:** If A is a member of X, and X is a subset of Y then A is a member of Y.
- **Attempto's reading:** If something X1 is a member of something X2 and X2 is a subset of something X3 then X1 is a member of X3.
- **Compiled:** `(implies (and (member-equal a x) (subsetp-equal x y)) (member-equal a y))`
- **Library theorem:** `(implies (and (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (let nil (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))) (let ((x a) (l y)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))))`

### `subsetp-nil`

- **English:** If there is something X then Nil is a subset of X.
- **Attempto's reading:** If there is something X1 then Nil is a subset of X1.
- **Compiled:** `(subsetp-equal nil x)`
- **Library theorem:** `(let ((x nil) (y x)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))`

### `subsetp-of-append-when-subset-of-either`

- **English:** If there is something A, and X is an append of B and C, and A is a subset of B or A is a subset of C then A is a subset of X.
- **Attempto's reading:** If there is something X1 and something X2 is an append of something X3 and something X4, and X1 is a subset of X3 or X1 is a subset of X4 then X1 is a subset of X2.
- **Compiled:** `(implies (or (subsetp-equal a b) (subsetp-equal a c)) (subsetp-equal a (append b c)))`
- **Library theorem:** `(implies (or (let ((x a) (y b)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (let ((x a) (y c)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))) (let ((x a) (y (append b c))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))))`

### `subsetp-of-cdr`

- **English:** If Y is a tail of X then Y is a subset of X.
- **Attempto's reading:** If something X1 is a tail of something X2 then X1 is a subset of X2.
- **Compiled:** `(subsetp-equal (cdr x) x)`
- **Library theorem:** `(let ((x (cdr x)) (y x)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))`

### `subsetp-of-cons`

- **English:** If a cons of A and X is a subset of Y then A is a member of Y and X is a subset of Y. If A is a member of Y, and X is a subset of Y then a cons of A and X is a subset of Y.
- **Attempto's reading:** If a cons of something X1 and something X2 is a subset of something X3 then X1 is a member of X3 and X2 is a subset of X3. If something X1 is a member of something X2 and something X3 is a subset of X2 then a cons of X1 and X3 is a subset of X2.
- **Compiled:** `(and (implies (subsetp-equal (cons a x) y) (and (member-equal a y) (subsetp-equal x y))) (implies (and (member-equal a y) (subsetp-equal x y)) (subsetp-equal (cons a x) y)))`
- **Library theorem:** `(equal (let ((x (cons a x))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (and (let ((x a) (l y)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (let nil (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))))`

### `subsetp-of-last`

- **English:** If Y is a last-pair of X then Y is a subset of X.
- **Attempto's reading:** If something X1 is a last-pair of something X2 then X1 is a subset of X2.
- **Compiled:** `(subsetp-equal (last x) x)`
- **Library theorem:** `(let ((x (last x)) (y x)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))`

### `subsetp-of-remove1`

- **English:** If Z is a removal of A and Y, and X is a subset of Z then X is a subset of Y and A is not a member of X. If Z is a removal of A and Y, and X is a subset of Y, and A is not a member of X then X is a subset of Z.
- **Attempto's reading:** If something X1 is a removal of something X2 and something X3 and something X4 is a subset of X1 then X4 is a subset of X3 and it is false that X2 is a member of X4. If something X1 is a removal of something X2 and something X3 and something X4 is a subset of X3 and it is false that X2 is a member of X4 then X4 is a subset of X1.
- **Compiled:** `(and (implies (subsetp-equal x (remove-equal a y)) (and (subsetp-equal x y) (not (member-equal a x)))) (implies (and (subsetp-equal x y) (not (member-equal a x))) (subsetp-equal x (remove-equal a y))))`
- **Library theorem:** `(equal (let ((y (let ((x a) (l y)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (and (let nil (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (not (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))))))`

### `subsetp-of-remove2`

- **English:** If Z is a removal of A and X, and X is a subset of Y then Z is a subset of Y.
- **Attempto's reading:** If something X1 is a removal of something and something X2 and X2 is a subset of something X3 then X1 is a subset of X3.
- **Compiled:** `(implies (subsetp-equal x y) (subsetp-equal (remove-equal a x) y))`
- **Library theorem:** `(implies (let nil (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (let ((x (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l))))) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))))`

### `subsetp-of-take`

- **English:** If a take of N and X is a subset of X then a length of X is not smaller than a natural-value of N or Nil is a member of X. If Y is a take of N and X, and a length of X is not smaller than a natural-value of N or Nil is a member of X then Y is a subset of X.
- **Attempto's reading:** If a take of something X1 and something X2 is a subset of X2 then there is a length X3 of X2 and it is false that the length X3 is smaller than a natural-value of X1 or Nil is a member of X2. If something X1 is a take of something X2 and something X3, and there is a length X4 of X3 and it is false that the length X4 is smaller than a natural-value of X2 or Nil is a member of X3 then X1 is a subset of X3.
- **Compiled:** `(and (implies (subsetp-equal (take n x) x) (or (not (< (len x) (nfix n))) (member-equal nil x))) (implies (or (not (< (len x) (nfix n))) (member-equal nil x)) (subsetp-equal (take n x) x)))`
- **Library theorem:** `(iff (let ((x (take n x)) (y x)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (or (<= (nfix n) (len x)) (member-equal nil x)))`

### `subsetp-refl`

- **English:** If there is something X then X is a subset of X.
- **Attempto's reading:** If there is something X1 then X1 is a subset of X1.
- **Compiled:** `(subsetp-equal x x)`
- **Library theorem:** `(let ((y x)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))`

### `subsetp-trans`

- **English:** If X is a subset of Y, and Y is a subset of Z then X is a subset of Z.
- **Attempto's reading:** If something X1 is a subset of something X2 and X2 is a subset of something X3 then X1 is a subset of X3.
- **Compiled:** `(implies (and (subsetp-equal x y) (subsetp-equal y z)) (subsetp-equal x z))`
- **Library theorem:** `(implies (and (let nil (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (let ((x y) (y z)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))) (let ((y z)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))))`

### `subsetp-trans2`

- **English:** If Y is a subset of Z, and X is a subset of Y then X is a subset of Z.
- **Attempto's reading:** If something X1 is a subset of something X2 and something X3 is a subset of X1 then X3 is a subset of X2.
- **Compiled:** `(implies (and (subsetp-equal y z) (subsetp-equal x y)) (subsetp-equal x z))`
- **Library theorem:** `(implies (and (let ((x y) (y z)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (let nil (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y)))) (let ((y z)) (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))))`

### `subsetp-when-atom-left`

- **English:** If there is something Y, and X is atomic then X is a subset of Y.
- **Attempto's reading:** If there is something X1 and something X2 is atomic then X2 is a subset of X1.
- **Compiled:** `(implies (atom x) (subsetp-equal x y))`
- **Library theorem:** `(implies (atom x) (let nil (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))))`

### `subsetp-when-atom-right`

- **English:** If Y is atomic, and X is a subset of Y then X is atomic. If Y is atomic, and X is atomic then X is a subset of Y.
- **Attempto's reading:** If something X1 is atomic and something X2 is a subset of X1 then X2 is atomic. If something X1 is atomic and something X2 is atomic then X2 is a subset of X1.
- **Compiled:** `(and (implies (and (atom y) (subsetp-equal x y)) (atom x)) (implies (and (atom y) (atom x)) (subsetp-equal x y)))`
- **Library theorem:** `(implies (atom y) (equal (let nil (mbe :logic (prog2$ (subsetp-eql-exec$guard-check x y) (subsetp-equal x y)) :exec (subsetp-eql-exec x y))) (atom x)))`

### `subsetp-when-prefixp`

- **English:** If X is a prefix of Y then X is a subset of Y.
- **Attempto's reading:** If something X1 is a prefix of something X2 then X1 is a subset of X2.
- **Compiled:** `(implies (prefixp x y) (subsetp-equal x y))`
- **Library theorem:** `(implies (prefixp x y) (subsetp-equal x y))`

### `suffixp-equals-nthcdr`

- **English:** If U is a length of Y, and V is a length of X, and Z is a difference of U and V, and X is a suffix of Y then X is an nthcdr of Z and Y. If U is a length of Y, and V is a length of X, and Z is a difference of U and V, and X is an nthcdr of Z and Y then X is a suffix of Y.
- **Attempto's reading:** If something X1 is a length of something X2 and something X3 is a length of something X4 and something X5 is a difference of X1 and X3 and X4 is a suffix of X2 then X4 is a nthcdr of X5 and X2. If something X1 is a length of something X2 and something X3 is a length of something X4 and something X5 is a difference of X1 and X3 and X4 is a nthcdr of X5 and X2 then X4 is a suffix of X2.
- **Compiled:** `(and (implies (suffixp x y) (equal x (nthcdr (- (len y) (len x)) y))) (implies (equal x (nthcdr (- (len y) (len x)) y)) (suffixp x y)))`
- **Library theorem:** `(equal (suffixp x y) (equal x (nthcdr (+ (len y) (- (len x))) y)))`

### `suffixp-of-cons-right`

- **English:** If X is a cons of C and B, and A is a suffix of X then A is a cons of C and B or A is a suffix of B. If there is something A, and X is a cons of C and B, and A is X or A is a suffix of B then A is a suffix of X.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is a suffix of X1 then X4 is a cons of X2 and X3 or X4 is a suffix of X3. If there is something X1 and something X2 is a cons of something and something X3, and X1 is X2 or X1 is a suffix of X3 then X1 is a suffix of X2.
- **Compiled:** `(and (implies (suffixp a (cons c b)) (or (equal a (cons c b)) (suffixp a b))) (implies (or (equal a (cons c b)) (suffixp a b)) (suffixp a (cons c b))))`
- **Library theorem:** `(equal (suffixp a (cons c b)) (or (equal a (cons c b)) (suffixp a b)))`

### `suffixp-of-self`

- **English:** If there is something X then X is a suffix of X.
- **Attempto's reading:** If there is something X1 then X1 is a suffix of X1.
- **Compiled:** `(suffixp x x)`
- **Library theorem:** `(suffixp x x)`

### `suffixp-transitive`

- **English:** If B is a suffix of C, and A is a suffix of B then A is a suffix of C.
- **Attempto's reading:** If something X1 is a suffix of something X2 and something X3 is a suffix of X1 then X3 is a suffix of X2.
- **Compiled:** `(implies (and (suffixp b c) (suffixp a b)) (suffixp a c))`
- **Library theorem:** `(implies (and (suffixp b c) (suffixp a b)) (suffixp a c))`

### `take-after-update-nth`

- **English:** If V is an update-nth of Y and U and X, and W is a take of Z and X, and a natural-value of Y is smaller than a natural-value of Z then a take of Z and V is an update-nth of Y and U and W.
- **Attempto's reading:** If something X1 is an update-nth of something X2 and something X3 and something X4 and something X5 is a take of something X6 and X4 and a natural-value of X2 is smaller than a natural-value of X6 then a take of X6 and X1 is an update-nth of X2 and X3 and X5.
- **Compiled:** `(implies (< (nfix n2) (nfix n1)) (equal (take n1 (update-nth n2 val x)) (update-nth n2 val (take n1 x))))`
- **Library theorem:** `(implies (< (nfix n2) (nfix n1)) (equal (take n1 (update-nth n2 val x)) (update-nth n2 val (take n1 x))))`

### `take-before-update-nth`

- **English:** If V is an update-nth of Y and U and X, and W is a take of Z and V, and a natural-value of Y is not smaller than a natural-value of Z then W is a take of Z and X.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is an update-nth of X2 and something and something X4 and something X5 is a take of something X6 and X3 and it is false that the natural-value X1 is smaller than a natural-value of X6 then X5 is a take of X6 and X4.
- **Compiled:** `(implies (not (< (nfix n2) (nfix n1))) (equal (take n1 (update-nth n2 val x)) (take n1 x)))`
- **Library theorem:** `(implies (<= (nfix n1) (nfix n2)) (equal (take n1 (update-nth n2 val x)) (take n1 x)))`

### `take-fewer-of-take-more`

- **English:** If Y is a take of B and X, and Z is a take of A and Y, and a natural-value of B is not smaller than a natural-value of A then Z is a take of A and X.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is a take of X2 and something X4 and something X5 is a take of something X6 and X3 and it is false that the natural-value X1 is smaller than a natural-value of X6 then X5 is a take of X6 and X4.
- **Compiled:** `(implies (not (< (nfix b) (nfix a))) (equal (take a (take b x)) (take a x)))`
- **Library theorem:** `(implies (<= (nfix a) (nfix b)) (equal (take a (take b x)) (take a x)))`

### `take-more-of-take-fewer`

- **English:** If Y is a take of B and X, and V is a natural-value of A, and W is a natural-value of B, and U is a difference of V and W, and Z is a repeat of U and Nil, and a natural-value of B is smaller than a natural-value of A then a take of A and Y is an append of Y and Z.
- **Attempto's reading:** If something X1 is a take of something X2 and something and something X3 is a natural-value of something X4 and something X5 is a natural-value of X2 and something X6 is a difference of X3 and X5 and something X7 is a repeat of X6 and Nil and a natural-value of X2 is smaller than a natural-value of X4 then a take of X4 and X1 is an append of X1 and X7.
- **Compiled:** `(implies (< (nfix b) (nfix a)) (equal (take a (take b x)) (append (take b x) (repeat (- (nfix a) (nfix b)) nil))))`
- **Library theorem:** `(implies (< (nfix b) (nfix a)) (equal (take a (take b x)) (append (take b x) (repeat (+ (nfix a) (- (nfix b))) nil))))`

### `take-of-1`

- **English:** If Y is a take of 1 and X, and Z is a head of X then Y is a cons of Z and Nil.
- **Attempto's reading:** If something X1 is a take of 1 and something X2 and something X3 is a head of X2 then X1 is a cons of X3 and Nil.
- **Compiled:** `(equal (take 1 x) (cons (car x) nil))`
- **Library theorem:** `(equal (take 1 x) (list (car x)))`

### `take-of-append`

- **English:** If Z is an append of X and Y, and a natural-value of N is smaller than a length of X then a take of N and Z is a take of N and X. If U is an append of X and Y, and Z is a take of N and U, and P is a length of X, and W is a difference of N and P, and V is a take of W and Y, and a natural-value of N is not smaller than a length of X then Z is an append of X and V.
- **Attempto's reading:** If something X1 is an append of something X2 and something and a natural-value of something X3 is smaller than a length of X2 then a take of X3 and X1 is a take of X3 and X2. If there is a natural-value X1 of something X2 and something X3 is an append of something X4 and something X5 and something X6 is a take of X2 and X3 and something X7 is a length of X4 and something X8 is a difference of X2 and X7 and something X9 is a take of X8 and X5 and it is false that the natural-value X1 is smaller than a length of X4 then X6 is an append of X4 and X9.
- **Compiled:** `(and (implies (< (nfix n) (len x)) (equal (take n (append x y)) (take n x))) (implies (not (< (nfix n) (len x))) (equal (take n (append x y)) (append x (take (- n (len x)) y)))))`
- **Library theorem:** `(equal (take n (append x y)) (if (< (nfix n) (len x)) (take n x) (append x (take (+ n (- (len x))) y))))`

### `take-of-len`

- **English:** If Y is a length of X then a take of Y and X is a list-fix of X.
- **Attempto's reading:** If something X1 is a length of something X2 then a take of X1 and X2 is a list-fix of X2.
- **Compiled:** `(equal (take (len x) x) (true-list-fix x))`
- **Library theorem:** `(equal (take (len x) x) (true-list-fix x))`

### `take-of-len-free`

- **English:** If a length of X is Y then a take of Y and X is a list-fix of X.
- **Attempto's reading:** If a length of something X1 is something X2 then a take of X2 and X1 is a list-fix of X1.
- **Compiled:** `(implies (equal (len x) len) (equal (take len x) (true-list-fix x)))`
- **Library theorem:** `(implies (equal len (len x)) (equal (take len x) (true-list-fix x)))`

### `take-of-repeat`

- **English:** If Y is a repeat of K and A, and X is a take of N and Y, and a natural-value of K is not smaller than a natural-value of N then X is a repeat of N and A. If X is a repeat of K and A, and U is a natural-value of N, and V is a natural-value of K, and Z is a difference of U and V, and Y is a repeat of Z and Nil, and a natural-value of K is smaller than a natural-value of N then a take of N and X is an append of X and Y.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is a repeat of X2 and something X4 and something X5 is a take of something X6 and X3 and it is false that the natural-value X1 is smaller than a natural-value of X6 then X5 is a repeat of X6 and X4. If something X1 is a repeat of something X2 and something and something X3 is a natural-value of something X4 and something X5 is a natural-value of X2 and something X6 is a difference of X3 and X5 and something X7 is a repeat of X6 and Nil and a natural-value of X2 is smaller than a natural-value of X4 then a take of X4 and X1 is an append of X1 and X7.
- **Compiled:** `(and (implies (not (< (nfix k) (nfix n))) (equal (take n (repeat k a)) (repeat n a))) (implies (< (nfix k) (nfix n)) (equal (take n (repeat k a)) (append (repeat k a) (repeat (- (nfix n) (nfix k)) nil)))))`
- **Library theorem:** `(equal (take n (repeat k a)) (if (<= (nfix n) (nfix k)) (repeat n a) (append (repeat k a) (repeat (+ (nfix n) (- (nfix k))) nil))))`

### `take-of-take-same`

- **English:** If Y is a take of A and X then a take of A and Y is Y.
- **Attempto's reading:** If something X1 is a take of something X2 and something then a take of X2 and X1 is X1.
- **Compiled:** `(equal (take a (take a x)) (take a x))`
- **Library theorem:** `(equal (take a (take a x)) (take a x))`

### `take-of-take-split`

- **English:** If Z is a take of B and X, and Y is a take of A and Z, and a natural-value of B is not smaller than a natural-value of A then Y is a take of A and X. If Y is a take of B and X, and V is a natural-value of A, and W is a natural-value of B, and U is a difference of V and W, and Z is a repeat of U and Nil, and a natural-value of B is smaller than a natural-value of A then a take of A and Y is an append of Y and Z.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is a take of X2 and something X4 and something X5 is a take of something X6 and X3 and it is false that the natural-value X1 is smaller than a natural-value of X6 then X5 is a take of X6 and X4. If something X1 is a take of something X2 and something and something X3 is a natural-value of something X4 and something X5 is a natural-value of X2 and something X6 is a difference of X3 and X5 and something X7 is a repeat of X6 and Nil and a natural-value of X2 is smaller than a natural-value of X4 then a take of X4 and X1 is an append of X1 and X7.
- **Compiled:** `(and (implies (not (< (nfix b) (nfix a))) (equal (take a (take b x)) (take a x))) (implies (< (nfix b) (nfix a)) (equal (take a (take b x)) (append (take b x) (repeat (- (nfix a) (nfix b)) nil)))))`
- **Library theorem:** `(equal (take a (take b x)) (if (<= (nfix a) (nfix b)) (take a x) (append (take b x) (repeat (+ (nfix a) (- (nfix b))) nil))))`

### `take-of-too-many`

- **English:** If Y is a take of N and X, and V is a natural-value of N, and W is a length of X, and U is a difference of V and W, and Z is a repeat of U and Nil, and a natural-value of N is not smaller than a length of X then Y is an append of X and Z.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is a take of X2 and something X4 and something X5 is a natural-value of X2 and something X6 is a length of X4 and something X7 is a difference of X5 and X6 and something X8 is a repeat of X7 and Nil and it is false that the natural-value X1 is smaller than a length of X4 then X3 is an append of X4 and X8.
- **Compiled:** `(implies (not (< (nfix n) (len x))) (equal (take n x) (append x (repeat (- (nfix n) (len x)) nil))))`
- **Library theorem:** `(implies (<= (len x) (nfix n)) (equal (take n x) (append x (repeat (+ (nfix n) (- (len x))) nil))))`

### `take-of-update-nth`

- **English:** If W is an update-nth of Z and U and X, and V is a take of Y and W, and a natural-value of Z is not smaller than a natural-value of Y then V is a take of Y and X. If V is an update-nth of Z and U and X, and W is a take of Y and X, and a natural-value of Z is smaller than a natural-value of Y then a take of Y and V is an update-nth of Z and U and W.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is an update-nth of X2 and something and something X4 and something X5 is a take of something X6 and X3 and it is false that the natural-value X1 is smaller than a natural-value of X6 then X5 is a take of X6 and X4. If something X1 is an update-nth of something X2 and something X3 and something X4 and something X5 is a take of something X6 and X4 and a natural-value of X2 is smaller than a natural-value of X6 then a take of X6 and X1 is an update-nth of X2 and X3 and X5.
- **Compiled:** `(and (implies (not (< (nfix n2) (nfix n1))) (equal (take n1 (update-nth n2 val x)) (take n1 x))) (implies (< (nfix n2) (nfix n1)) (equal (take n1 (update-nth n2 val x)) (update-nth n2 val (take n1 x)))))`
- **Library theorem:** `(equal (take n1 (update-nth n2 val x)) (if (<= (nfix n1) (nfix n2)) (take n1 x) (update-nth n2 val (take n1 x))))`

### `take-of-zero`

- **English:** If Y is a take of 0 and X then Y is Nil.
- **Attempto's reading:** If something X1 is a take of 0 and something then X1 is Nil.
- **Compiled:** `(equal (take 0 x) nil)`
- **Library theorem:** `(equal (take 0 x) nil)`

### `take-when-atom`

- **English:** If Y is a take of N and X, and X is atomic then Y is a repeat of N and Nil.
- **Attempto's reading:** If something X1 is a take of something X2 and something X3 and X3 is atomic then X1 is a repeat of X2 and Nil.
- **Compiled:** `(implies (atom x) (equal (take n x) (repeat n nil)))`
- **Library theorem:** `(implies (atom x) (equal (take n x) (repeat n nil)))`

### `take-when-prefixp`

- **English:** If Z is a length of X, and X is a prefix of Y then a take of Z and Y is a list-fix of X.
- **Attempto's reading:** If something X1 is a length of something X2 and X2 is a prefix of something X3 then a take of X1 and X3 is a list-fix of X2.
- **Compiled:** `(implies (prefixp x y) (equal (take (len x) y) (true-list-fix x)))`
- **Library theorem:** `(implies (prefixp x y) (equal (take (len x) y) (true-list-fix x)))`

### `third-of-take`

- **English:** If Y is a take of N and X, and a natural-value of N is not smaller than 3 then a head of a tail of a tail of Y is a head of a tail of a tail of X.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is a take of X2 and something X4 and it is false that the natural-value X1 is smaller than 3 then a head of a tail of a tail of X3 is a head of a tail of a tail of X4.
- **Compiled:** `(implies (not (< (nfix n) 3)) (equal (car (cdr (cdr (take n x)))) (car (cdr (cdr x)))))`
- **Library theorem:** `(implies (<= 3 (nfix n)) (equal (caddr (take n x)) (caddr x)))`

### `true-listp-of-append`

- **English:** If an append of X and Y is a true-list then Y is a true-list. If Z is an append of X and Y, and Y is a true-list then Z is a true-list.
- **Attempto's reading:** If an append of something and something X1 is a true-list then X1 is a true-list. If something X1 is an append of something and something X2 and X2 is a true-list then X1 is a true-list.
- **Compiled:** `(and (implies (true-listp (append x y)) (true-listp y)) (implies (true-listp y) (true-listp (append x y))))`
- **Library theorem:** `(equal (true-listp (append x y)) (true-listp y))`

### `true-listp-of-cons`

- **English:** If a cons of A and X is a true-list then X is a true-list. If Y is a cons of A and X, and X is a true-list then Y is a true-list.
- **Attempto's reading:** If a cons of something and something X1 is a true-list then X1 is a true-list. If something X1 is a cons of something and something X2 and X2 is a true-list then X1 is a true-list.
- **Compiled:** `(and (implies (true-listp (cons a x)) (true-listp x)) (implies (true-listp x) (true-listp (cons a x))))`
- **Library theorem:** `(equal (true-listp (cons a x)) (true-listp x))`

### `true-listp-of-flatten`

- **English:** If Y is a flattening of X then Y is a true-list.
- **Attempto's reading:** If something X1 is a flattening of something then X1 is a true-list.
- **Compiled:** `(true-listp (flatten x))`
- **Library theorem:** `(true-listp (flatten x))`

### `true-listp-of-last`

- **English:** If a last-pair of L is a true-list then L is a true-list. If L is a true-list then a last-pair of L is a true-list.
- **Attempto's reading:** If a last-pair of something X1 is a true-list then X1 is a true-list. If something X1 is a true-list then a last-pair of X1 is a true-list.
- **Compiled:** `(and (implies (true-listp (last l)) (true-listp l)) (implies (true-listp l) (true-listp (last l))))`
- **Library theorem:** `(equal (true-listp (last l)) (true-listp l))`

### `true-listp-of-list-fix`

- **English:** If Y is a list-fix of X then Y is a true-list.
- **Attempto's reading:** If something X1 is a list-fix of something then X1 is a true-list.
- **Compiled:** `(true-listp (true-list-fix x))`
- **Library theorem:** `(true-listp (true-list-fix x))`

### `true-listp-of-nthcdr`

- **English:** If an nthcdr of N and X is a true-list then X is a true-list or a length of X is smaller than a natural-value of N. If Y is an nthcdr of N and X, and X is a true-list or a length of X is smaller than a natural-value of N then Y is a true-list.
- **Attempto's reading:** If a nthcdr of something X1 and something X2 is a true-list then X2 is a true-list or a length of X2 is smaller than a natural-value of X1. If something X1 is a nthcdr of something X2 and something X3, and X3 is a true-list or a length of X3 is smaller than a natural-value of X2 then X1 is a true-list.
- **Compiled:** `(and (implies (true-listp (nthcdr n x)) (or (true-listp x) (< (len x) (nfix n)))) (implies (or (true-listp x) (< (len x) (nfix n))) (true-listp (nthcdr n x))))`
- **Library theorem:** `(equal (true-listp (nthcdr n x)) (or (true-listp x) (< (len x) (nfix n))))`

### `true-listp-of-revappend`

- **English:** If a revappend of X and Y is a true-list then Y is a true-list. If Z is a revappend of X and Y, and Y is a true-list then Z is a true-list.
- **Attempto's reading:** If a revappend of something and something X1 is a true-list then X1 is a true-list. If something X1 is a revappend of something and something X2 and X2 is a true-list then X1 is a true-list.
- **Compiled:** `(and (implies (true-listp (revappend x y)) (true-listp y)) (implies (true-listp y) (true-listp (revappend x y))))`
- **Library theorem:** `(equal (true-listp (revappend x y)) (true-listp y))`

### `true-listp-of-union-equal`

- **English:** If an union of X and Y is a true-list then Y is a true-list. If Z is an union of X and Y, and Y is a true-list then Z is a true-list.
- **Attempto's reading:** If a union of something and something X1 is a true-list then X1 is a true-list. If something X1 is a union of something and something X2 and X2 is a true-list then X1 is a true-list.
- **Compiled:** `(and (implies (true-listp (union-equal x y)) (true-listp y)) (implies (true-listp y) (true-listp (union-equal x y))))`
- **Library theorem:** `(equal (true-listp (union-equal x y)) (true-listp y))`

### `true-listp-of-union-equal-type`

- **English:** If Z is an union of X and Y, and Y is a true-list then Z is a true-list.
- **Attempto's reading:** If something X1 is a union of something and something X2 and X2 is a true-list then X1 is a true-list.
- **Compiled:** `(implies (true-listp y) (true-listp (union-equal x y)))`
- **Library theorem:** `(implies (true-listp y) (true-listp (union-equal x y)))`

### `true-listp-of-update-nth`

- **English:** If an update-nth of N and V and X is a true-list then a natural-value of N is not smaller than a length of X or X is a true-list. If Y is an update-nth of N and V and X, and a natural-value of N is not smaller than a length of X or X is a true-list then Y is a true-list.
- **Attempto's reading:** If an update-nth of something X1 and something and something X2 is a true-list then there is a natural-value X3 of X1 and it is false that the natural-value X3 is smaller than a length of X2 or X2 is a true-list. If something X1 is an update-nth of something X2 and something and something X3, and there is a natural-value X4 of X2 and it is false that the natural-value X4 is smaller than a length of X3 or X3 is a true-list then X1 is a true-list.
- **Compiled:** `(and (implies (true-listp (update-nth n v x)) (or (not (< (nfix n) (len x))) (true-listp x))) (implies (or (not (< (nfix n) (len x))) (true-listp x)) (true-listp (update-nth n v x))))`
- **Library theorem:** `(equal (true-listp (update-nth n v x)) (or (<= (len x) (nfix n)) (true-listp x)))`

### `true-listp-when-atom`

- **English:** If X is atomic, and X is a true-list then X is Nil. If X is atomic, and X is Nil then X is a true-list.
- **Attempto's reading:** If something X1 is atomic and X1 is a true-list then X1 is Nil. If something X1 is Nil and X1 is atomic then X1 is a true-list.
- **Compiled:** `(and (implies (and (atom x) (true-listp x)) (equal x nil)) (implies (and (atom x) (equal x nil)) (true-listp x)))`
- **Library theorem:** `(implies (atom x) (equal (true-listp x) (not x)))`

### `type-of-rcons`

- **English:** If Y is a rcons of A and X then Y is a pair and Y is a true-list.
- **Attempto's reading:** If something X1 is a rcons of something and something then X1 is a pair and X1 is a true-list.
- **Compiled:** `(and (consp (rcons a x)) (true-listp (rcons a x)))`
- **Library theorem:** `(and (consp (rcons a x)) (true-listp (rcons a x)))`

### `union-equal-under-set-equiv`

- **English:** If X is an union of A and B then X is set-equivalent-to an append of A and B.
- **Attempto's reading:** If something X1 is a union of something X2 and something X3 then X1 is set-equivalent-to an append of X2 and X3.
- **Compiled:** `(set-equiv (union-equal a b) (append a b))`
- **Library theorem:** `(set-equiv (union-equal a b) (append a b))`

### `update-nth-append`

- **English:** If Y is an append of A and B, and X is an update-nth of N and V and Y, and Z is an update-nth of N and V and A, and a natural-value of N is smaller than a length of A then X is an append of Z and B. If Y is an append of A and B, and X is an update-nth of N and V and Y, and W is a length of A, and U is a difference of N and W, and Z is an update-nth of U and V and B, and a natural-value of N is not smaller than a length of A then X is an append of A and Z.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is an update-nth of something X5 and something X6 and X1 and something X7 is an update-nth of X5 and X6 and X2 and a natural-value of X5 is smaller than a length of X2 then X4 is an append of X7 and X3. If there is a natural-value X1 of something X2 and something X3 is an append of something X4 and something X5 and something X6 is an update-nth of X2 and something X7 and X3 and something X8 is a length of X4 and something X9 is a difference of X2 and X8 and something X10 is an update-nth of X9 and X7 and X5 and it is false that the natural-value X1 is smaller than a length of X4 then X6 is an append of X4 and X10.
- **Compiled:** `(and (implies (< (nfix n) (len a)) (equal (update-nth n v (append a b)) (append (update-nth n v a) b))) (implies (not (< (nfix n) (len a))) (equal (update-nth n v (append a b)) (append a (update-nth (- n (len a)) v b)))))`
- **Library theorem:** `(equal (update-nth n v (append a b)) (if (< (nfix n) (len a)) (append (update-nth n v a) b) (append a (update-nth (+ n (- (len a))) v b))))`

### `update-nth-of-nth`

- **English:** If Y is an nth of N and X, and a natural-value of N is smaller than a length of X then an update-nth of N and Y and X is X.
- **Attempto's reading:** If something X1 is a nth of something X2 and something X3 and a natural-value of X2 is smaller than a length of X3 then an update-nth of X2 and X1 and X3 is X3.
- **Compiled:** `(implies (< (nfix n) (len x)) (equal (update-nth n (nth n x) x) x))`
- **Library theorem:** `(implies (< (nfix n) (len x)) (equal (update-nth n (nth n x) x) x))`

### `update-nth-of-nth-free`

- **English:** If an nth of N and X is Y, and a natural-value of N is smaller than a length of X then an update-nth of N and Y and X is X.
- **Attempto's reading:** If a nth of something X1 and something X2 is something X3 and a natural-value of X1 is smaller than a length of X2 then an update-nth of X1 and X3 and X2 is X2.
- **Compiled:** `(implies (and (equal (nth n x) free) (< (nfix n) (len x))) (equal (update-nth n free x) x))`
- **Library theorem:** `(implies (and (equal (nth n x) free) (< (nfix n) (len x))) (equal (update-nth n free x) x))`

### `update-nth-of-update-nth-diff`

- **English:** If P is an update-nth of Z and V and X, and W is an update-nth of Y and U and P, and Q is an update-nth of Y and U and X, and a natural-value of Y is not a natural-value of Z then W is an update-nth of Z and V and Q.
- **Attempto's reading:** If there is a natural-value X1 of something X2 and something X3 is an update-nth of something X4 and something X5 and something X6 and something X7 is an update-nth of X2 and something X8 and X3 and something X9 is an update-nth of X2 and X8 and X6 and it is false that the natural-value X1 is a natural-value of X4 then X7 is an update-nth of X4 and X5 and X9.
- **Compiled:** `(implies (not (equal (nfix n1) (nfix n2))) (equal (update-nth n1 v1 (update-nth n2 v2 x)) (update-nth n2 v2 (update-nth n1 v1 x))))`
- **Library theorem:** `(implies (not (equal (nfix n1) (nfix n2))) (equal (update-nth n1 v1 (update-nth n2 v2 x)) (update-nth n2 v2 (update-nth n1 v1 x))))`

### `update-nth-of-update-nth-same`

- **English:** If U is an update-nth of N and Z and X, and V is an update-nth of N and Y and U then V is an update-nth of N and Y and X.
- **Attempto's reading:** If something X1 is an update-nth of something X2 and something and something X3 and something X4 is an update-nth of X2 and something X5 and X1 then X4 is an update-nth of X2 and X5 and X3.
- **Compiled:** `(equal (update-nth n v1 (update-nth n v2 x)) (update-nth n v1 x))`
- **Library theorem:** `(equal (update-nth n v1 (update-nth n v2 x)) (update-nth n v1 x))`

### `update-nth-when-atom`

- **English:** If Y is an update-nth of N and V and X, and Z is a repeat of N and Nil, and U is a cons of V and Nil, and X is atomic then Y is an append of Z and U.
- **Attempto's reading:** If something X1 is an update-nth of something X2 and something X3 and something X4 and something X5 is a repeat of X2 and Nil and X4 is atomic and something X6 is a cons of X3 and Nil then X1 is an append of X5 and X6.
- **Compiled:** `(implies (atom x) (equal (update-nth n v x) (append (repeat n nil) (cons v nil))))`
- **Library theorem:** `(implies (atom x) (equal (update-nth n v x) (append (repeat n nil) (list v))))`

### `upper-bound-of-len-of-last`

- **English:** If Y is a last-pair of X then a length of Y is smaller than 2.
- **Attempto's reading:** If something X1 is a last-pair of something then a length of X1 is smaller than 2.
- **Compiled:** `(< (len (last x)) 2)`
- **Library theorem:** `(< (len (last x)) 2)`

### `upper-bound-of-len-of-remove-strong`

- **English:** If A is a member of X then a length of a removal of A and X is smaller than a length of X.
- **Attempto's reading:** If something X1 is a member of something X2 then a length of a removal of X1 and X2 is smaller than a length of X2.
- **Compiled:** `(implies (member-equal a x) (< (len (remove-equal a x)) (len x)))`
- **Library theorem:** `(implies (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (< (len (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l)))) (len x)))`

### `upper-bound-of-len-of-remove-weak`

- **English:** If Y is a length of X, and Z is a removal of A and X then Y is not smaller than a length of Z.
- **Attempto's reading:** If something X1 is a length of something X2 and something X3 is a removal of something and X2 then it is false that X1 is smaller than a length of X3.
- **Compiled:** `(not (< (len x) (len (remove-equal a x))))`
- **Library theorem:** `(<= (len (let ((x a) (l x)) (mbe :logic (prog2$ (remove-eql-exec$guard-check x l) (remove-equal x l)) :exec (remove-eql-exec x l)))) (len x))`
