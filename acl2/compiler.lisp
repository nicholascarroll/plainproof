; The compiler: an Attempto parse (DRS) to an ACL2 statement.
;
; The input is the DRS printed by english/parse.pl as an s-expression:
;   (drs REFS CONDS), where a condition is one of
;   (object R noun class unit op count)   (relation B X)   (has-part G P)
;   (be A B)   (property P adj)   (property2 P adj X)   (compare P adj X)
;   (not DRS)   (or DRS DRS)   (if DRS DRS)
; and a term is a referent symbol, (int N) or (named "C").
;
; The result is (mv nil statement), or (mv reason nil) when the sentence is
; refused.  Every function is in logic mode, so ACL2 can prove facts about it;
; see compiler-theorems.lisp.  It began as a clause-for-clause port of a Prolog
; compiler, which it replaced after agreeing with it on all 294 sentences then
; generated (NOTEBOOK.md, stage 2).
(in-package "ACL2")
(include-book "dictionary-data")

;; ---- Looking things up in the parse ----

(defun object-p (c) (and (consp c) (eq (car c) 'object)))
(defun obj-ref (c) (nth 1 c))
(defun obj-noun (c) (nth 2 c))

;; "countable na eq 1": a single, ordinary noun phrase.
(defun single-p (c)
  (and (equal (nth 3 c) "countable") (equal (nth 4 c) "na")
       (equal (nth 5 c) "eq") (equal (nth 6 c) 1)))

;; A group "X and Y": object with noun na, countable, unit na, op eq.
(defun group-obj-p (c)
  (and (equal (obj-noun c) "na") (equal (nth 3 c) "countable")
       (equal (nth 4 c) "na") (equal (nth 5 c) "eq")))

(defun something-p (c)
  (and (equal (obj-noun c) "something") (equal (nth 3 c) "dom")
       (equal (nth 4 c) "na") (equal (nth 5 c) "na") (equal (nth 6 c) "na")))

(defun find-object (r all)
  (cond ((atom all) nil)
        ((and (object-p (car all)) (equal (obj-ref (car all)) r)) (car all))
        (t (find-object r (cdr all)))))

(defun lookup (word table) (assoc-equal word table))

(defun result-entry (c)
  (and (object-p c) (single-p c) (lookup (obj-noun c) *result-nouns*)))

;; The X in every (relation B X), in order.
(defun ofs (b all)
  (cond ((atom all) nil)
        ((and (consp (car all)) (eq (caar all) 'relation) (equal (nth 1 (car all)) b))
         (cons (nth 2 (car all)) (ofs b (cdr all))))
        (t (ofs b (cdr all)))))

;; The P in every (has-part G P), in order.
(defun parts (g all)
  (cond ((atom all) nil)
        ((and (consp (car all)) (eq (caar all) 'has-part) (equal (nth 1 (car all)) g))
         (cons (nth 2 (car all)) (parts g (cdr all))))
        (t (parts g (cdr all)))))

(defun group-ref-p (x all)
  (and (symbolp x) x
       (let ((o (find-object x all))) (and o (group-obj-p o)))))

;; A several-argument noun: its "of" phrase is a group.
(defun has-group-argument (p all)
  (and (symbolp p) p
       (result-entry (find-object p all))
       (let ((xs (ofs p all)))
         (and (consp xs) (null (cdr xs)) (group-ref-p (car xs) all)))))

(defun any-has-group-argument (ps all)
  (cond ((atom ps) nil)
        ((has-group-argument (car ps) all) t)
        (t (any-has-group-argument (cdr ps) all))))

;; ---- Flattening "not" and "or", for lookups ----

(defun drs-conds (d) (nth 2 d))
(defun drs-refs (d) (nth 1 d))

(defun flatten-conds (conds)
  (declare (xargs :measure (acl2-count conds)))
  (cond ((atom conds) nil)
        ((and (consp (car conds)) (eq (caar conds) 'not))
         (append (flatten-conds (caddr (cadr (car conds))))
                 (flatten-conds (cdr conds))))
        ((and (consp (car conds)) (eq (caar conds) 'or))
         (append (flatten-conds (caddr (cadr (car conds))))
                 (flatten-conds (caddr (caddr (car conds))))
                 (flatten-conds (cdr conds))))
        (t (cons (car conds) (flatten-conds (cdr conds))))))

;; ---- Individuals and complements ----

;; A classifying noun that is the complement of "is" is a test, not an individual.
(defun complements (conds all)
  (cond ((atom conds) nil)
        ((and (consp (car conds)) (eq (caar conds) 'be)
              (symbolp (nth 2 (car conds))) (nth 2 (car conds))
              (let ((o (find-object (nth 2 (car conds)) all)))
                (and o (lookup (obj-noun o) *type-nouns*))))
         (add-to-set-equal (nth 2 (car conds)) (complements (cdr conds) all)))
        (t (complements (cdr conds) all))))

(defun individuals (conds comps)
  (cond ((atom conds) nil)
        ((and (object-p (car conds))
              (not (member-equal (obj-ref (car conds)) comps))
              (or (equal (obj-noun (car conds)) "something")
                  (lookup (obj-noun (car conds)) *type-nouns*)))
         (cons (obj-ref (car conds)) (individuals (cdr conds) comps)))
        (t (individuals (cdr conds) comps))))

(defconst *var-names*
  '(X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20
    X21 X22 X23 X24 X25 X26 X27 X28 X29 X30 X31 X32 X33 X34 X35 X36 X37 X38 X39 X40))

(defun number-them (refs vars)
  (if (or (atom refs) (atom vars)) nil
    (cons (cons (car refs) (car vars)) (number-them (cdr refs) (cdr vars)))))

(defun intersects (xs ys)
  (cond ((atom xs) nil) ((member-equal (car xs) ys) t) (t (intersects (cdr xs) ys))))

;; ---- The three structural guards ----

;; A thing first mentioned after "then" would mean "there is some ...".
(defun introduced-after-then (r2 inds) (intersects r2 inds))

;; A thing first mentioned inside "not" is quantified inside the negation.
(defun introduced-inside-not (a inds)
  (cond ((atom a) nil)
        ((and (consp (car a)) (eq (caar a) 'not)
              (intersects (drs-refs (cadr (car a))) inds)) t)
        (t (introduced-inside-not (cdr a) inds))))

;; Likewise for either side of "or".
(defun introduced-inside-or (conds inds)
  (cond ((atom conds) nil)
        ((and (consp (car conds)) (eq (caar conds) 'or)
              (or (intersects (drs-refs (cadr (car conds))) inds)
                  (intersects (drs-refs (caddr (car conds))) inds))) t)
        (t (introduced-inside-or (cdr conds) inds))))

;; ---- Terms ----

(mutual-recursion
 (defun term (r all names fuel)
   (declare (xargs :measure (list (nfix fuel) 1) :well-founded-relation l<))
   (cond ((zp fuel) (mv "cyclic_reference" nil))
         ((and (consp r) (eq (car r) 'int) (integerp (cadr r))) (mv nil (cadr r)))
         ((and (consp r) (eq (car r) 'named))
          (let ((e (lookup (cadr r) *constants*)))
            (if e (mv nil (cdr e)) (mv "unknown_constant" nil))))
         ((consp r) (mv "unsupported_term" nil))
         ((assoc-equal r names) (mv nil (cdr (assoc-equal r names))))
         (t (let* ((o (find-object r all)) (e (result-entry o)))
              (if (not e) (mv "no_meaning_for" nil)
                (let ((xs (ofs r all)))
                  (if (or (atom xs) (consp (cdr xs))) (mv "needs_one_of_phrase" nil)
                    (let* ((x (car xs))
                           (ps (if (group-ref-p x all) (parts x all) (list x)))
                           (k (len ps)))
                      (cond ((not (equal k (nth 2 e))) (mv "wrong_number_of_arguments" nil))
                            ((and (< 1 k) (any-has-group-argument ps all))
                             (mv "several_argument_noun_inside_another" nil))
                            (t (mv-let (err args) (terms ps all names (1- fuel))
                                 (if err (mv err nil) (mv nil (cons (nth 1 e) args))))))))))))))
 (defun terms (ps all names fuel)
   (declare (xargs :measure (list (nfix fuel) (+ 2 (acl2-count ps)))))
   (if (atom ps) (mv nil nil)
     (mv-let (err t1) (term (car ps) all names fuel)
       (if err (mv err nil)
         (mv-let (err2 ts) (terms (cdr ps) all names fuel)
           (if err2 (mv err2 nil) (mv nil (cons t1 ts)))))))))

;; ---- "A is B" ----

(defun find-cond (tag b all)
  (cond ((atom all) nil)
        ((and (consp (car all)) (eq (caar all) tag) (equal (nth 1 (car all)) b)) (car all))
        (t (find-cond tag b (cdr all)))))

(defun be-goal (a b all names comps fuel)
  (let ((prop (and (symbolp b) b (find-cond 'property b all)))
        (cmp (and (symbolp b) b (find-cond 'compare b all)))
        (rel2 (and (symbolp b) b (find-cond 'property2 b all)))
        (o (and (symbolp b) b (find-object b all))))
    (cond
     ;; "X is atomic"
     (prop (let ((e (lookup (nth 2 prop) *adjectives*)))
             (if (not e) (mv "unknown_adjective" nil)
               (mv-let (err ta) (term a all names fuel)
                 (if err (mv err nil) (mv nil (list (cdr e) ta)))))))
     ;; "X is a true-list"
     ((and (symbolp b) b (member-equal b comps))
      (let ((e (lookup (obj-noun o) *type-nouns*)))
        (if (not e) (mv "unknown_type_noun" nil)
          (mv-let (err ta) (term a all names fuel)
            (if err (mv err nil) (mv nil (list (cdr e) ta)))))))
     ;; "A is a member of X"
     ((and o (single-p o) (lookup (obj-noun o) *relation-nouns*))
      (let ((e (lookup (obj-noun o) *relation-nouns*)) (xs (ofs b all)))
        (cond ((or (atom xs) (consp (cdr xs))) (mv "needs_one_of_phrase" nil))
              ((group-ref-p (car xs) all) (mv "relation_noun_with_several_arguments" nil))
              (t (mv-let (err ta) (term a all names fuel)
                   (if err (mv err nil)
                     (mv-let (err2 tx) (term (car xs) all names fuel)
                       (if err2 (mv err2 nil) (mv nil (list (cdr e) ta tx))))))))))
     ;; "N is smaller than M"
     (cmp (let ((e (lookup (nth 2 cmp) *comparisons*)))
            (if (not e) (mv "unknown_comparison" nil)
              (mv-let (err ta) (term a all names fuel)
                (if err (mv err nil)
                  (mv-let (err2 tx) (term (nth 3 cmp) all names fuel)
                    (if err2 (mv err2 nil) (mv nil (list (cdr e) ta tx)))))))))
     ;; "X is set-equivalent-to Y"
     (rel2 (let ((e (lookup (nth 2 rel2) *relation-adjectives*)))
             (if (not e) (mv "unknown_relation_adjective" nil)
               (mv-let (err ta) (term a all names fuel)
                 (if err (mv err nil)
                   (mv-let (err2 tx) (term (nth 3 rel2) all names fuel)
                     (if err2 (mv err2 nil) (mv nil (list (cdr e) ta tx)))))))))
     ;; "Z is Y"
     (t (mv-let (err ta) (term a all names fuel)
          (if err (mv err nil)
            (mv-let (err2 tb) (term b all names fuel)
              (if err2 (mv err2 nil) (mv nil (list 'equal ta tb))))))))))

;; ---- Conditions ----

(defun one-or-and (gs) (if (and (consp gs) (null (cdr gs))) (car gs) (cons 'and gs)))

(mutual-recursion
 (defun conjuncts (conds all names comps fuel)
   (declare (xargs :measure (acl2-count conds)))
   (if (atom conds) (mv nil nil)
     (mv-let (err g1) (cond-goals (car conds) all names comps fuel)
       (if err (mv err nil)
         (mv-let (err2 gs) (conjuncts (cdr conds) all names comps fuel)
           (if err2 (mv err2 nil) (mv nil (append g1 gs))))))))
 (defun cond-goals (c all names comps fuel)
   (declare (xargs :measure (acl2-count c)))
   (cond
    ((atom c) (mv "unsupported_condition" nil))
    ((eq (car c) 'object)
     (cond ((something-p c) (mv nil nil))
           ((and (single-p c) (lookup (obj-noun c) *type-nouns*))
            (if (member-equal (obj-ref c) comps) (mv nil nil)
              (mv-let (err tm) (term (obj-ref c) all names fuel)
                (if err (mv err nil)
                  (mv nil (list (list (cdr (lookup (obj-noun c) *type-nouns*)) tm)))))))
           ((and (single-p c) (lookup (obj-noun c) *result-nouns*)) (mv nil nil))
           ((and (single-p c) (lookup (obj-noun c) *relation-nouns*)) (mv nil nil))
           ((group-obj-p c) (mv nil nil))
           (t (mv "unsupported_condition" nil))))
    ((member-eq (car c) '(has-part relation property property2 compare)) (mv nil nil))
    ((eq (car c) 'be)
     (mv-let (err g) (be-goal (nth 1 c) (nth 2 c) all names comps fuel)
       (if err (mv err nil) (mv nil (list g)))))
    ((eq (car c) 'not)
     (mv-let (err gs) (conjuncts (caddr (cadr c)) all names comps fuel)
       (if err (mv err nil)
         (mv nil (list (list 'not (one-or-and gs)))))))
    ((eq (car c) 'or)
     (mv-let (err gs1) (conjuncts (caddr (cadr c)) all names comps fuel)
       (if err (mv err nil)
         (mv-let (err2 gs2) (conjuncts (caddr (caddr c)) all names comps fuel)
           (if err2 (mv err2 nil)
             (mv nil (list (list 'or (one-or-and gs1) (one-or-and gs2)))))))))
    (t (mv "unsupported_condition" nil)))))

;; ---- Definitions in the antecedent ----
;; "Z is an append of X and Y", with Z untyped and defined once, is replaced by
;; its definition everywhere.  For any T not mentioning Z,
;; (for all Z: Z = T implies P(Z)) is P(T).

(defun pp-subst (v tm x)
  (cond ((equal x v) tm)
        ((atom x) x)
        (t (cons (pp-subst v tm (car x)) (pp-subst v tm (cdr x))))))

(defun pp-occurs (v x)
  (cond ((equal x v) t) ((atom x) nil) (t (or (pp-occurs v (car x)) (pp-occurs v (cdr x))))))

(defun pp-defines-p (v hyps)
  (cond ((atom hyps) nil)
        ((and (consp (car hyps)) (eq (caar hyps) 'equal) (equal (nth 1 (car hyps)) v)) t)
        (t (pp-defines-p v (cdr hyps)))))

(defun substitutable (h rest names all)
  (and (consp h) (eq (car h) 'equal)
       (let* ((v (nth 1 h)) (tm (nth 2 h)) (pr (rassoc-equal v names)))
         (and pr (symbolp v)
              (let ((o (find-object (car pr) all))) (and o (something-p o)))
              (consp tm)
              (not (pp-occurs v tm))
              (not (pp-defines-p v rest))))))

;; The first substitutable hypothesis, as (mv found before after).
(defun pp-pick (seen hyps names all)
  (declare (xargs :measure (acl2-count hyps)))
  (cond ((atom hyps) (mv nil nil nil))
        ((substitutable (car hyps) (append (revappend seen nil) (cdr hyps)) names all)
         (mv (car hyps) (revappend seen nil) (cdr hyps)))
        (t (pp-pick (cons (car hyps) seen) (cdr hyps) names all))))

(defun pp-subst-all (v tm xs)
  (if (atom xs) nil (cons (pp-subst v tm (car xs)) (pp-subst-all v tm (cdr xs)))))

(defun substitute-definitions (hyps concls names all fuel)
  (declare (xargs :measure (nfix fuel)))
  (if (zp fuel) (mv hyps concls)
    (mv-let (h before after) (pp-pick nil hyps names all)
      (if (not h) (mv hyps concls)
        (let ((v (nth 1 h)) (tm (nth 2 h)))
          (substitute-definitions (pp-subst-all v tm (append before after))
                                  (pp-subst-all v tm concls) names all (1- fuel)))))))

(defun pp-build (hyps concls)
  (let ((c (if (and (consp concls) (null (cdr concls))) (car concls) (cons 'and concls))))
    (cond ((atom hyps) c)
          ((null (cdr hyps)) (list 'implies (car hyps) c))
          (t (list 'implies (cons 'and hyps) c)))))

;; ---- One sentence, and a text ----

;; The pieces of a sentence (if (drs R1 A) (drs R2 C)), named so theorems can refer to them.
(defun sentence-all (c) (flatten-conds (append (drs-conds (nth 1 c)) (drs-conds (nth 2 c)))))
(defun sentence-individuals (c)
  (individuals (sentence-all c) (complements (sentence-all c) (sentence-all c))))

(defun compile-sentence (c)
  ;; c is (if (drs R1 A) (drs R2 C))
  (if (not (and (consp c) (eq (car c) 'if)))
      (mv "unsupported_shape" nil)
    (let* ((a (drs-conds (nth 1 c))) (r2 (drs-refs (nth 2 c))) (cs (drs-conds (nth 2 c)))
           (all (sentence-all c))
           (comps (complements all all))
           (inds (sentence-individuals c))
           (fuel (+ 1 (len all))))
      (cond ((introduced-after-then r2 inds) (mv "individual_introduced_after_then" nil))
            ((introduced-inside-not a inds) (mv "individual_introduced_inside_not" nil))
            ((introduced-inside-or a inds) (mv "individual_introduced_inside_or" nil))
            ((introduced-inside-or cs inds) (mv "individual_introduced_inside_or" nil))
            ((< (len *var-names*) (len inds)) (mv "too_many_individuals" nil))
            (t (let ((names (number-them inds *var-names*)))
                 (mv-let (err hyps) (conjuncts a all names comps fuel)
                   (if err (mv err nil)
                     (mv-let (err2 concls) (conjuncts cs all names comps fuel)
                       (cond (err2 (mv err2 nil))
                             ((atom concls) (mv "empty_conclusion" nil))
                             (t (mv-let (hyps2 concls2)
                                    (substitute-definitions hyps concls names all (+ 1 (len hyps)))
                                  (mv nil (pp-build hyps2 concls2))))))))))))))

(defun compile-sentences (cs)
  (if (atom cs) (mv nil nil)
    (mv-let (err s) (compile-sentence (car cs))
      (if err (mv err nil)
        (mv-let (err2 ss) (compile-sentences (cdr cs))
          (if err2 (mv err2 nil) (mv nil (cons s ss))))))))

(defun compile-drs (d)
  (cond ((not (and (consp d) (eq (car d) 'drs) (null (drs-refs d)) (consp (drs-conds d))))
         (mv "unsupported_shape" nil))
        ((null (cdr (drs-conds d))) (compile-sentence (car (drs-conds d))))
        (t (mv-let (err ss) (compile-sentences (drs-conds d))
             (if err (mv err nil) (mv nil (cons 'and ss)))))))
