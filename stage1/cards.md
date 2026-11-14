# Review cards for certified sentences

### `len-of-append`

- **English:** If Z is an append of X and Y, and U is a length of X, and V is a length of Y then a length of Z is a sum of U and V.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a length of X2 and something X5 is a length of X3 then a length of X1 is a sum of X4 and X5.
- **Compiled:** `(equal (len (append x y)) (+ (len x) (len y)))`
- **Library theorem:** `(equal (len (append x y)) (+ (len x) (len y)))`

### `len-of-rev`

- **English:** If Y is a reversal of X then a length of Y is a length of X.
- **Attempto's reading:** If something X1 is a reversal of something X2 then a length of X1 is a length of X2.
- **Compiled:** `(equal (len (rev x)) (len x))`
- **Library theorem:** `(equal (len (rev x)) (len x))`

### `rev-of-append`

- **English:** If Z is an append of X and Y, and U is a reversal of Y, and V is a reversal of X then a reversal of Z is an append of U and V.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a reversal of X3 and something X5 is a reversal of X2 then a reversal of X1 is an append of X4 and X5.
- **Compiled:** `(equal (rev (append x y)) (append (rev y) (rev x)))`
- **Library theorem:** `(equal (rev (append x y)) (append (rev y) (rev x)))`

### `rev-of-rev`

- **English:** If Y is a reversal of X then a reversal of Y is a list-fix of X.
- **Attempto's reading:** If something X1 is a reversal of something X2 then a reversal of X1 is a list-fix of X2.
- **Compiled:** `(equal (rev (rev x)) (true-list-fix x))`
- **Library theorem:** `(equal (rev (rev x)) (true-list-fix x))`

### `len-of-list-fix`

- **English:** If Y is a list-fix of X then a length of Y is a length of X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 then a length of X1 is a length of X2.
- **Compiled:** `(equal (len (true-list-fix x)) (len x))`
- **Library theorem:** `(equal (len (true-list-fix x)) (len x))`

### `rev-of-list-fix`

- **English:** If Y is a list-fix of X then a reversal of Y is a reversal of X.
- **Attempto's reading:** If something X1 is a list-fix of something X2 then a reversal of X1 is a reversal of X2.
- **Compiled:** `(equal (rev (true-list-fix x)) (rev x))`
- **Library theorem:** `(equal (rev (true-list-fix x)) (rev x))`

### `list-fix-of-append`

- **English:** If Z is an append of X and Y, and U is a list-fix of Y then a list-fix of Z is an append of X and U.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a list-fix of X3 then a list-fix of X1 is an append of X2 and X4.
- **Compiled:** `(equal (true-list-fix (append x y)) (append x (true-list-fix y)))`
- **Library theorem:** `(equal (true-list-fix (append x y)) (append x (true-list-fix y)))`

### `append-of-nil`

- **English:** If Y is an append of X and Nil then Y is a list-fix of X.
- **Attempto's reading:** If something X1 is an append of something X2 and Nil then X1 is a list-fix of X2.
- **Compiled:** `(equal (append x nil) (true-list-fix x))`
- **Library theorem:** `(equal (append x nil) (true-list-fix x))`

### `true-listp-of-list-fix`

- **English:** If Y is a list-fix of X then Y is a true-list.
- **Attempto's reading:** If something X1 is a list-fix of something then X1 is a true-list.
- **Compiled:** `(true-listp (true-list-fix x))`
- **Library theorem:** `(true-listp (true-list-fix x))`

### `list-fix-when-true-listp`

- **English:** If X is a true-list then a list-fix of X is X.
- **Attempto's reading:** If something X1 is a true-list then a list-fix of X1 is X1.
- **Compiled:** `(implies (true-listp x) (equal (true-list-fix x) x))`
- **Library theorem:** `(implies (true-listp x) (equal (true-list-fix x) x))`

### `reverse-removal`

- **English:** If X is a true-list then a reverse of X is a reversal of X.
- **Attempto's reading:** If something X1 is a true-list then a reverse of X1 is a reversal of X1.
- **Compiled:** `(implies (true-listp x) (equal (reverse x) (rev x)))`
- **Library theorem:** `(implies (true-listp x) (equal (reverse x) (rev x)))`

### `revappend-removal`

- **English:** If Z is a revappend of X and Y, and U is a reversal of X then Z is an append of U and Y.
- **Attempto's reading:** If something X1 is a revappend of something X2 and something X3 and something X4 is a reversal of X2 then X1 is an append of X4 and X3.
- **Compiled:** `(equal (revappend x y) (append (rev x) y))`
- **Library theorem:** `(equal (revappend x y) (append (rev x) y))`

### `len-of-take`

- **English:** If Y is a take of N and X then a length of Y is a natural-value of N.
- **Attempto's reading:** If something X1 is a take of something X2 and something then a length of X1 is a natural-value of X2.
- **Compiled:** `(equal (len (take n xs)) (nfix n))`
- **Library theorem:** `(equal (len (take n xs)) (nfix n))`

### `len-of-repeat`

- **English:** If Y is a repeat of N and X then a length of Y is a natural-value of N.
- **Attempto's reading:** If something X1 is a repeat of something X2 and something then a length of X1 is a natural-value of X2.
- **Compiled:** `(equal (len (repeat n x)) (nfix n))`
- **Library theorem:** `(equal (len (repeat n x)) (nfix n))`

### `append-of-cons`

- **English:** If Z is a cons of A and X, and U is an append of Z and Y, and V is an append of X and Y then U is a cons of A and V.
- **Attempto's reading:** If something X1 is a cons of something X2 and something X3 and something X4 is an append of X1 and something X5 and something X6 is an append of X3 and X5 then X4 is a cons of X2 and X6.
- **Compiled:** `(equal (append (cons a x) y) (cons a (append x y)))`
- **Library theorem:** `(equal (append (cons a x) y) (cons a (append x y)))`

### `append-when-not-consp`

- **English:** If Z is an append of X and Y, and X is not a pair then Z is Y.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and it is false that X2 is a pair then X1 is X3.
- **Compiled:** `(implies (not (consp x)) (equal (append x y) y))`
- **Library theorem:** `(implies (not (consp x)) (equal (append x y) y))`

### `len-when-atom`

- **English:** If X is atomic then a length of X is 0.
- **Attempto's reading:** If something X1 is atomic then a length of X1 is 0.
- **Compiled:** `(implies (atom x) (equal (len x) 0))`
- **Library theorem:** `(implies (atom x) (equal (len x) 0))`

### `nthcdr-of-nthcdr`

- **English:** If Z is an nthcdr of B and X, and Y is an nthcdr of A and Z, and V is a natural-value of A, and W is a natural-value of B, and U is a sum of V and W then Y is an nthcdr of U and X.
- **Attempto's reading:** If something X1 is a nthcdr of something X2 and something X3 and something X4 is a nthcdr of something X5 and X1 and something X6 is a natural-value of X5 and something X7 is a natural-value of X2 and something X8 is a sum of X6 and X7 then X4 is a nthcdr of X8 and X3.
- **Compiled:** `(equal (nthcdr a (nthcdr b x)) (nthcdr (+ (nfix a) (nfix b)) x))`
- **Library theorem:** `(equal (nthcdr a (nthcdr b x)) (nthcdr (+ (nfix a) (nfix b)) x))`

### `len-of-nthcdr`

- **English:** If X is an nthcdr of N and L, and Y is a length of L, and Z is a natural-value of N then a length of X is a natural-value of a difference of Y and Z.
- **Attempto's reading:** If something X1 is a nthcdr of something X2 and something X3 and something X4 is a length of X3 and something X5 is a natural-value of X2 then a length of X1 is a natural-value of a difference of X4 and X5.
- **Compiled:** `(equal (len (nthcdr n l)) (nfix (- (len l) (nfix n))))`
- **Library theorem:** `(equal (len (nthcdr n l)) (nfix (+ (len l) (- (nfix n)))))`

### `take-of-len-free`

- **English:** If a length of X is Y then a take of Y and X is a list-fix of X.
- **Attempto's reading:** If a length of something X1 is something X2 then a take of X2 and X1 is a list-fix of X1.
- **Compiled:** `(implies (equal (len x) len) (equal (take len x) (true-list-fix x)))`
- **Library theorem:** `(implies (equal len (len x)) (equal (take len x) (true-list-fix x)))`

### `true-listp-of-append`

- **English:** If an append of X and Y is a true-list then Y is a true-list. If Z is an append of X and Y, and Y is a true-list then Z is a true-list.
- **Attempto's reading:** If an append of something and something X1 is a true-list then X1 is a true-list. If something X1 is an append of something and something X2 and X2 is a true-list then X1 is a true-list.
- **Compiled:** `(and (implies (true-listp (append x y)) (true-listp y)) (implies (true-listp y) (true-listp (append x y))))`
- **Library theorem:** `(equal (true-listp (append x y)) (true-listp y))`

### `consp-of-append`

- **English:** If an append of X and Y is a pair then X is a pair or Y is a pair. If Z is an append of X and Y, and X is a pair or Y is a pair then Z is a pair.
- **Attempto's reading:** If an append of something X1 and something X2 is a pair then X1 is a pair or X2 is a pair. If something X1 is an append of something X2 and something X3, and X2 is a pair or X3 is a pair then X1 is a pair.
- **Compiled:** `(and (implies (consp (append x y)) (or (consp x) (consp y))) (implies (or (consp x) (consp y)) (consp (append x y))))`
- **Library theorem:** `(equal (consp (append x y)) (or (consp x) (consp y)))`

### `car-of-append`

- **English:** If Z is an append of X and Y, and X is a pair then a head of Z is a head of X. If Z is an append of X and Y, and X is not a pair then a head of Z is a head of Y.
- **Attempto's reading:** If something X1 is an append of something X2 and something and X2 is a pair then a head of X1 is a head of X2. If something X1 is an append of something X2 and something X3 and it is false that X2 is a pair then a head of X1 is a head of X3.
- **Compiled:** `(and (implies (consp x) (equal (car (append x y)) (car x))) (implies (not (consp x)) (equal (car (append x y)) (car y))))`
- **Library theorem:** `(equal (car (append x y)) (if (consp x) (car x) (car y)))`

### `take-of-append`

- **English:** If Z is an append of X and Y, and a natural-value of N is smaller than a length of X then a take of N and Z is a take of N and X. If U is an append of X and Y, and Z is a take of N and U, and P is a length of X, and W is a difference of N and P, and V is a take of W and Y, and a natural-value of N is not smaller than a length of X then Z is an append of X and V.
- **Attempto's reading:** If something X1 is an append of something X2 and something and a natural-value of something X3 is smaller than a length of X2 then a take of X3 and X1 is a take of X3 and X2. If there is a natural-value X1 of something X2 and something X3 is an append of something X4 and something X5 and something X6 is a take of X2 and X3 and something X7 is a length of X4 and something X8 is a difference of X2 and X7 and something X9 is a take of X8 and X5 and it is false that the natural-value X1 is smaller than a length of X4 then X6 is an append of X4 and X9.
- **Compiled:** `(and (implies (< (nfix n) (len x)) (equal (take n (append x y)) (take n x))) (implies (not (< (nfix n) (len x))) (equal (take n (append x y)) (append x (take (- n (len x)) y)))))`
- **Library theorem:** `(equal (take n (append x y)) (if (< (nfix n) (len x)) (take n x) (append x (take (+ n (- (len x))) y))))`

### `member-of-append`

- **English:** If Z is an append of X and Y, and A is a member of Z then A is a member of X or A is a member of Y. If there is something A, and Z is an append of X and Y, and A is a member of X or A is a member of Y then A is a member of Z.
- **Attempto's reading:** If something X1 is an append of something X2 and something X3 and something X4 is a member of X1 then X4 is a member of X2 or X4 is a member of X3. If there is something X1 and something X2 is an append of something X3 and something X4, and X1 is a member of X3 or X1 is a member of X4 then X1 is a member of X2.
- **Compiled:** `(and (implies (member-equal a (append x y)) (or (member-equal a x) (member-equal a y))) (implies (or (member-equal a x) (member-equal a y)) (member-equal a (append x y))))`
- **Library theorem:** `(iff (let ((x a) (l (append x y))) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (or (let ((x a) (l x)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l))) (let ((x a) (l y)) (mbe :logic (prog2$ (member-eql-exec$guard-check x l) (member-equal x l)) :exec (member-eql-exec x l)))))`
