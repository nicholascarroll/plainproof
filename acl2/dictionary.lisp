; The dictionary's meanings, checked.  Each word in english/dictionary.pl names
; an ACL2 function; here each one gets a one-line meaning and examples that are
; checked when this book certifies.  An example that's wrong stops certification.
(in-package "ACL2")
(include-book "std/lists/top" :dir :system)

;; true-list (true-listp): a list that ends in nil.
(assert-event (true-listp '(1 2)))
(assert-event (not (true-listp '(1 . 2))))

;; pair (consp): a cons, so a list with at least one element.
(assert-event (consp '(1)))
(assert-event (not (consp nil)))

;; atomic (atom): not a pair.
(assert-event (atom 3))
(assert-event (not (atom '(1))))

;; length (len): the number of elements, ignoring a non-nil final tail.
(assert-event (equal (len '(a b c)) 3))
(assert-event (equal (len '(a b . c)) 2))

;; reversal (rev): the elements in reverse order, as a true list.
(assert-event (equal (rev '(1 2 3)) '(3 2 1)))
(assert-event (equal (rev '(1 2 . 3)) '(2 1)))

;; reverse: Common Lisp's reverse, which also works on strings.
(assert-event (equal (reverse '(1 2 3)) '(3 2 1)))
(assert-event (equal (reverse "abc") "cba"))

;; list-fix (true-list-fix): the same elements, ending in nil.
(assert-event (equal (true-list-fix '(1 2 . 3)) '(1 2)))

;; natural-value (nfix): N if N is a natural number, otherwise 0.
(assert-event (equal (nfix 4) 4))
(assert-event (equal (nfix -3) 0))

;; append: the elements of X followed by Y.
(assert-event (equal (append '(1 2) '(3)) '(1 2 3)))

;; revappend: X reversed, followed by Y.
(assert-event (equal (revappend '(1 2) '(3)) '(2 1 3)))

;; cons: A in front of X.
(assert-event (equal (cons 1 '(2)) '(1 2)))

;; take: the first N elements of X, padded with nil if X is shorter.
(assert-event (equal (take 2 '(a b c)) '(a b)))
(assert-event (equal (take 3 '(a)) '(a nil nil)))

;; nthcdr: X without its first N elements.
(assert-event (equal (nthcdr 2 '(a b c)) '(c)))

;; repeat: a list of N copies of X.
(assert-event (equal (repeat 3 'x) '(x x x)))

;; sum (+) and difference (-).
(assert-event (equal (+ 2 3) 5))
(assert-event (equal (- 5 3) 2))

;; Nil: the empty list.
(assert-event (equal (len nil) 0))

;; ---- Added in round 2 ----

;; head (car) and tail (cdr): the first element, and the rest.
(assert-event (equal (car '(a b c)) 'a))
(assert-event (equal (cdr '(a b c)) '(b c)))

;; last-pair (last): the last pair of X.  final-cdr: what's left after the last pair.
(assert-event (equal (last '(a b c)) '(c)))
(assert-event (equal (final-cdr '(a b . c)) 'c))

;; flattening (flatten): the elements of each element of X, in order.
(assert-event (equal (flatten '((1 2) (3))) '(1 2 3)))

;; deduplication (remove-duplicates-equal): X with repeats removed, keeping last occurrences.
(assert-event (equal (remove-duplicates-equal '(a b a c)) '(b a c)))

;; nth: the element at position N, counting from 0.
(assert-event (equal (nth 1 '(a b c)) 'b))

;; rcons: X with A added at the end.
(assert-event (equal (rcons 'd '(a b c)) '(a b c d)))

;; removal (remove-equal): X without any copies of A.
(assert-event (equal (remove-equal 'a '(a b a c)) '(b c)))

;; duplicity: how many times A occurs in X.
(assert-event (equal (duplicity 'a '(a b a)) 2))

;; intersection, union and set-difference (the -equal versions).
(assert-event (equal (intersection-equal '(a b c) '(b c d)) '(b c)))
(assert-event (equal (union-equal '(a b) '(b c)) '(a b c)))
(assert-event (equal (set-difference-equal '(a b c) '(b)) '(a c)))

;; index (index-of): the position of K in X, or nil if absent.
(assert-event (equal (index-of 'c '(a b c)) 2))
(assert-event (equal (index-of 'z '(a b c)) nil))

;; listpos: the position at which X occurs as a sublist of Y, or nil.
(assert-event (equal (listpos '(b c) '(a b c d)) 1))

;; update-nth: X with position N replaced by V.
(assert-event (equal (update-nth 1 'z '(a b c)) '(a z c)))

;; member (member-equal): A occurs in X.  The value is the tail starting at A.
(assert-event (member-equal 'b '(a b c)))
(assert-event (not (member-equal 'z '(a b c))))

;; subset (subsetp-equal): every element of X is in Y.
(assert-event (subsetp-equal '(a c) '(a b c)))

;; prefix (prefixp), suffix (suffixp), sublist (sublistp).
(assert-event (prefixp '(a b) '(a b c)))
(assert-event (suffixp '(b c) '(a b c)))
(assert-event (sublistp '(b c) '(a b c d)))
(assert-event (not (sublistp '(a c) '(a b c))))

;; set-equivalent-to (set-equiv): the same elements, ignoring order and repeats.
(assert-event (set-equiv '(a b a) '(b a)))

;; list-equivalent-to (list-equiv): equal after list-fix.
(assert-event (list-equiv '(a b . c) '(a b)))

;; duplicate-free (no-duplicatesp-equal) and natural (natp).
(assert-event (no-duplicatesp-equal '(a b c)))
(assert-event (not (no-duplicatesp-equal '(a b a))))
(assert-event (natp 3))
(assert-event (not (natp -1)))
