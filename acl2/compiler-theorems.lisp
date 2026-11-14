; Theorems about the compiler (compiler.lisp).
(in-package "ACL2")
(include-book "compiler")
(include-book "tools/flag" :dir :system)
(local (include-book "std/lists/top" :dir :system))

;; ======================================================================
;; 1. The structural guards.  A parse in which something is first mentioned
;;    after "then", inside "not", or inside either side of "or" is refused.
;; ======================================================================

(defthm compiler-refuses-introduction-after-then
  (implies (and (consp c) (eq (car c) 'if)
                (introduced-after-then (drs-refs (nth 2 c)) (sentence-individuals c)))
           (mv-nth 0 (compile-sentence c))))

(defthm compiler-refuses-introduction-inside-not
  (implies (and (consp c) (eq (car c) 'if)
                (introduced-inside-not (drs-conds (nth 1 c)) (sentence-individuals c)))
           (mv-nth 0 (compile-sentence c))))

(defthm compiler-refuses-introduction-inside-or
  (implies (and (consp c) (eq (car c) 'if)
                (or (introduced-inside-or (drs-conds (nth 1 c)) (sentence-individuals c))
                    (introduced-inside-or (drs-conds (nth 2 c)) (sentence-individuals c))))
           (mv-nth 0 (compile-sentence c))))

;; A text of several sentences is refused if any one of its sentences is.
(defthm compile-sentences-refuses-if-any-sentence-is-refused
  (implies (and (member-equal s cs) (mv-nth 0 (compile-sentence s)))
           (mv-nth 0 (compile-sentences cs)))
  :hints (("Goal" :induct (compile-sentences cs) :in-theory (disable compile-sentence))))

;; ======================================================================
;; 2. Vocabulary soundness.  Every function in a compiled statement is the
;;    meaning of a dictionary word, or one of the logical connectives.
;; ======================================================================

(defconst *allowed*
  (append '(implies and or not equal)
          (strip-cdrs *type-nouns*) (strip-cadrs *result-nouns*)
          (strip-cdrs *relation-nouns*) (strip-cdrs *relation-adjectives*)
          (strip-cdrs *adjectives*) (strip-cdrs *comparisons*)))

(defun allowed-fn-p (f) (member-equal f *allowed*))

;; (vok t x): x is a term whose every function is allowed.  (vok nil x): a list of such terms.
(defun vok (term-p x)
  (declare (xargs :measure (acl2-count x)))
  (if term-p
      (or (atom x) (and (allowed-fn-p (car x)) (vok nil (cdr x))))
    (or (atom x) (and (vok t (car x)) (vok nil (cdr x))))))

(defun atom-values-p (al)
  (or (atom al) (and (consp (car al)) (atom (cdar al)) (atom-values-p (cdr al)))))

;; ---- Proof of vocabulary soundness ----

;; Tables: a word's meaning is among the allowed functions.
(defthm cadr-assoc-in-strip-cadrs
  (implies (assoc-equal k l) (member-equal (cadr (assoc-equal k l)) (strip-cadrs l))))
(defthm cdr-assoc-in-strip-cdrs
  (implies (assoc-equal k l) (member-equal (cdr (assoc-equal k l)) (strip-cdrs l))))
(defthm member-of-subset
  (implies (and (member-equal x a) (subsetp-equal a b)) (member-equal x b)))
(defthm tables-allowed
  (and (subsetp-equal (strip-cadrs *result-nouns*) *allowed*)
       (subsetp-equal (strip-cdrs *type-nouns*) *allowed*)
       (subsetp-equal (strip-cdrs *relation-nouns*) *allowed*)
       (subsetp-equal (strip-cdrs *relation-adjectives*) *allowed*)
       (subsetp-equal (strip-cdrs *adjectives*) *allowed*)
       (subsetp-equal (strip-cdrs *comparisons*) *allowed*)))
(in-theory (disable tables-allowed))
(defthm result-entry-allowed
  (implies (result-entry o) (allowed-fn-p (cadr (result-entry o))))
  :hints (("Goal" :use (tables-allowed (:instance member-of-subset (x (cadr (assoc-equal (obj-noun o) *result-nouns*))) (a (strip-cadrs *result-nouns*)) (b *allowed*)))
           :in-theory (disable member-of-subset))))
(defmacro table-allowed (name table)
  `(defthm ,name
     (implies (lookup w ,table) (allowed-fn-p (cdr (lookup w ,table))))
     :hints (("Goal" :use (tables-allowed (:instance member-of-subset (x (cdr (assoc-equal w ,table))) (a (strip-cdrs ,table)) (b *allowed*)))
              :in-theory (disable member-of-subset)))))
(table-allowed type-noun-allowed *type-nouns*)
(table-allowed relation-noun-allowed *relation-nouns*)
(table-allowed relation-adjective-allowed *relation-adjectives*)
(table-allowed adjective-allowed *adjectives*)
(table-allowed comparison-allowed *comparisons*)
(defthm constants-are-atoms
  (implies (lookup w *constants*) (atom (cdr (lookup w *constants*)))))
(defthm connectives-allowed
  (and (allowed-fn-p 'implies) (allowed-fn-p 'and) (allowed-fn-p 'or)
       (allowed-fn-p 'not) (allowed-fn-p 'equal)))
(in-theory (disable lookup result-entry find-object ofs parts group-ref-p any-has-group-argument
                    allowed-fn-p))

;; Names are atoms.
(defthm atom-values-p-number-them
  (implies (atom-listp vars) (atom-values-p (number-them refs vars))))
(defthm atom-of-assoc-in-atom-values
  (implies (and (atom-values-p al) (assoc-equal r al)) (atom (cdr (assoc-equal r al)))))

;; Atoms are fine: names and constants.
(defthm vok-of-atom (implies (atom x) (vok flg x)))
(defthm vok-of-name
  (implies (and (atom-values-p al) (assoc-equal r al)) (vok flg (cdr (assoc-equal r al))))
  :hints (("Goal" :use atom-of-assoc-in-atom-values :in-theory (disable atom-of-assoc-in-atom-values))))
(defthm vok-of-constant
  (implies (lookup w *constants*) (vok flg (cdr (lookup w *constants*))))
  :hints (("Goal" :use constants-are-atoms :in-theory (disable constants-are-atoms))))

;; Terms.
(make-flag term-flag term)
(defthm-term-flag
  (defthm vok-of-term
    (implies (and (not (mv-nth 0 (term r all names fuel))) (atom-values-p names))
             (vok t (mv-nth 1 (term r all names fuel))))
    :flag term)
  (defthm vok-of-terms
    (implies (and (not (mv-nth 0 (terms ps all names fuel))) (atom-values-p names))
             (vok nil (mv-nth 1 (terms ps all names fuel))))
    :flag terms))

;; "A is B".
(defthm vok-of-be-goal
  (implies (and (not (mv-nth 0 (be-goal a b all names comps fuel))) (atom-values-p names))
           (vok t (mv-nth 1 (be-goal a b all names comps fuel)))))

;; Lists of goals.
(defthm vok-nil-of-append
  (implies (and (vok nil a) (vok nil b)) (vok nil (append a b))))
(defthm vok-of-one-or-and
  (implies (vok nil gs) (vok t (one-or-and gs)))
  :hints (("Goal" :expand ((vok t (cons 'and gs))))))
(in-theory (disable be-goal one-or-and))

(make-flag conjuncts-flag conjuncts)
(defthm-conjuncts-flag
  (defthm vok-of-conjuncts
    (implies (and (not (mv-nth 0 (conjuncts conds all names comps fuel))) (atom-values-p names))
             (vok nil (mv-nth 1 (conjuncts conds all names comps fuel))))
    :flag conjuncts)
  (defthm vok-of-cond-goals
    (implies (and (not (mv-nth 0 (cond-goals c all names comps fuel))) (atom-values-p names))
             (vok nil (mv-nth 1 (cond-goals c all names comps fuel))))
    :flag cond-goals))

;; Function names are atoms, and substitution leaves them alone.
(defthm allowed-fns-are-atoms
  (implies (allowed-fn-p f) (not (consp f)))
  :hints (("Goal" :in-theory (enable allowed-fn-p))))
(defthm pp-subst-of-allowed
  (implies (and (allowed-fn-p f) (not (allowed-fn-p v)))
           (equal (pp-subst v tm f) f))
  :hints (("Goal" :expand ((pp-subst v tm f)))))

;; Substituting a definition keeps every function allowed, because the variable
;; replaced is never itself an allowed function.
(defthm vok-of-pp-subst
  (implies (and (vok flg x) (vok t tm) (vok nil tm) (atom v) (not (allowed-fn-p v)))
           (vok flg (pp-subst v tm x)))
  :hints (("Goal" :induct (vok flg x))))
(defthm vok-of-pp-subst-all
  (implies (and (vok nil xs) (vok t tm) (vok nil tm) (atom v) (not (allowed-fn-p v)))
           (vok nil (pp-subst-all v tm xs))))
(local (defthm vok-nil-of-rev
  (implies (vok nil a) (vok nil (rev a)))))
(defthm vok-nil-of-revappend
  (implies (and (vok nil a) (vok nil b)) (vok nil (revappend a b))))

(defun names-ok (names)
  (and (atom-values-p names) (subsetp-equal (strip-cdrs names) *var-names*)))
(defun var-name-p (v) (member-equal v *var-names*))
(defthm var-names-not-allowed
  (implies (var-name-p v) (not (allowed-fn-p v)))
  :hints (("Goal" :in-theory (enable allowed-fn-p))))
(defthm subset-var-name
  (implies (and (member-equal v l) (subsetp-equal l *var-names*)) (var-name-p v))
  :hints (("Goal" :use (:instance member-of-subset (x v) (a l) (b *var-names*))
           :in-theory (disable member-of-subset))))
(in-theory (disable var-name-p))
(defthm rassoc-in-strip-cdrs
  (implies (rassoc-equal v al) (member-equal v (strip-cdrs al))))
(defthm substitutable-var-facts
  (implies (substitutable h rest names all)
           (and (member-equal (nth 1 h) (strip-cdrs names))
                (atom (nth 1 h)))))
(defthm substitutable-var-not-allowed
  (implies (and (substitutable h rest names all) (names-ok names))
           (not (allowed-fn-p (nth 1 h))))
  :hints (("Goal" :in-theory (disable substitutable substitutable-var-facts subset-var-name)
           :use (substitutable-var-facts
                 (:instance subset-var-name (v (nth 1 h)) (l (strip-cdrs names)))))))

(defthm pp-pick-ok
  (implies (and (vok nil hyps) (vok nil seen))
           (and (vok nil (mv-nth 1 (pp-pick seen hyps names all)))
                (vok nil (mv-nth 2 (pp-pick seen hyps names all)))
                (vok t (mv-nth 0 (pp-pick seen hyps names all))))))
(defthm pp-pick-substitutable
  (implies (mv-nth 0 (pp-pick seen hyps names all))
           (substitutable (mv-nth 0 (pp-pick seen hyps names all))
                          (append (mv-nth 1 (pp-pick seen hyps names all))
                                  (mv-nth 2 (pp-pick seen hyps names all)))
                          names all)))

(defthm vok-t-of-cons-term
  (implies (and (vok t x) (consp x)) (vok nil x))
  :hints (("Goal" :expand ((vok t x) (vok nil x)))))
(defthm vok-of-third-of-equal
  (implies (and (vok t h) (consp h) (eq (car h) 'equal))
           (vok t (nth 2 h)))
  :hints (("Goal" :expand ((vok t h) (vok nil (cdr h)) (vok nil (cddr h))))))
(defthm vok-nil-of-third-of-equal
  (implies (and (vok t h) (consp h) (eq (car h) 'equal) (consp (nth 2 h)))
           (vok nil (nth 2 h)))
  :hints (("Goal" :use vok-of-third-of-equal :in-theory (disable vok-of-third-of-equal))))
(defthm substitutable-is-equal
  (implies (substitutable h rest names all)
           (and (consp h) (eq (car h) 'equal) (consp (nth 2 h)))))
(defthm pp-pick-facts
  (implies (and (mv-nth 0 (pp-pick nil hyps names all)) (vok nil hyps) (names-ok names))
           (let ((h (mv-nth 0 (pp-pick nil hyps names all))))
             (and (atom (cadr h)) (not (allowed-fn-p (cadr h)))
                  (vok t (caddr h)) (vok nil (caddr h))
                  (vok nil (append (mv-nth 1 (pp-pick nil hyps names all))
                                   (mv-nth 2 (pp-pick nil hyps names all)))))))
  :hints (("Goal" :in-theory (disable substitutable-var-not-allowed substitutable-var-facts
                                      substitutable-is-equal pp-pick-ok pp-pick-substitutable
                                      vok-of-third-of-equal vok-nil-of-third-of-equal names-ok)
           :use ((:instance pp-pick-ok (seen nil))
                 (:instance pp-pick-substitutable (seen nil))
                 (:instance substitutable-var-not-allowed
                            (h (mv-nth 0 (pp-pick nil hyps names all)))
                            (rest (append (mv-nth 1 (pp-pick nil hyps names all))
                                          (mv-nth 2 (pp-pick nil hyps names all)))))
                 (:instance substitutable-var-facts
                            (h (mv-nth 0 (pp-pick nil hyps names all)))
                            (rest (append (mv-nth 1 (pp-pick nil hyps names all))
                                          (mv-nth 2 (pp-pick nil hyps names all)))))
                 (:instance substitutable-is-equal
                            (h (mv-nth 0 (pp-pick nil hyps names all)))
                            (rest (append (mv-nth 1 (pp-pick nil hyps names all))
                                          (mv-nth 2 (pp-pick nil hyps names all)))))
                 (:instance vok-of-third-of-equal (h (mv-nth 0 (pp-pick nil hyps names all))))
                 (:instance vok-nil-of-third-of-equal (h (mv-nth 0 (pp-pick nil hyps names all))))))))
(defthm substitution-step-ok
  (implies (and (mv-nth 0 (pp-pick nil hyps names all)) (vok nil hyps) (vok nil xs) (names-ok names))
           (vok nil (pp-subst-all (cadr (mv-nth 0 (pp-pick nil hyps names all)))
                                  (caddr (mv-nth 0 (pp-pick nil hyps names all)))
                                  xs)))
  :hints (("Goal" :in-theory (disable pp-pick-facts vok-of-pp-subst-all)
           :use (pp-pick-facts
                 (:instance vok-of-pp-subst-all
                            (v (cadr (mv-nth 0 (pp-pick nil hyps names all))))
                            (tm (caddr (mv-nth 0 (pp-pick nil hyps names all)))))))))
(defthm substitution-step-ok-rest
  (implies (and (mv-nth 0 (pp-pick nil hyps names all)) (vok nil hyps) (names-ok names))
           (vok nil (pp-subst-all (cadr (mv-nth 0 (pp-pick nil hyps names all)))
                                  (caddr (mv-nth 0 (pp-pick nil hyps names all)))
                                  (append (mv-nth 1 (pp-pick nil hyps names all))
                                          (mv-nth 2 (pp-pick nil hyps names all))))))
  :hints (("Goal" :in-theory (disable pp-pick-facts substitution-step-ok)
           :use (pp-pick-facts
                 (:instance substitution-step-ok
                            (xs (append (mv-nth 1 (pp-pick nil hyps names all))
                                        (mv-nth 2 (pp-pick nil hyps names all)))))))))
(in-theory (disable substitutable pp-pick names-ok pp-subst-all))

(defthm vok-of-substitute-definitions
  (implies (and (vok nil hyps) (vok nil concls) (names-ok names))
           (and (vok nil (mv-nth 0 (substitute-definitions hyps concls names all fuel)))
                (vok nil (mv-nth 1 (substitute-definitions hyps concls names all fuel)))))
  :hints (("Goal" :induct (substitute-definitions hyps concls names all fuel))))

(defthm vok-of-pp-build
  (implies (and (vok nil hyps) (vok nil concls))
           (vok t (pp-build hyps concls)))
  :hints (("Goal" :expand ((:free (x) (vok t (cons 'and x))) (:free (x) (vok t (cons 'implies x)))))))

(defthm subsetp-strip-cdrs-number-them
  (subsetp-equal (strip-cdrs (number-them refs vars)) vars))
(defthm names-ok-number-them
  (names-ok (number-them refs *var-names*))
  :hints (("Goal" :in-theory (enable names-ok))))

(defthm vok-of-compile-sentence
  (implies (not (mv-nth 0 (compile-sentence c)))
           (vok t (mv-nth 1 (compile-sentence c))))
  :hints (("Goal" :in-theory (disable conjuncts cond-goals substitute-definitions pp-build
                                      number-them sentence-all sentence-individuals individuals
                                      complements flatten-conds introduced-after-then
                                      introduced-inside-not introduced-inside-or))))

(defthm vok-of-compile-sentences
  (implies (not (mv-nth 0 (compile-sentences cs)))
           (vok nil (mv-nth 1 (compile-sentences cs))))
  :hints (("Goal" :in-theory (disable compile-sentence))))

;; The main theorem.  Whatever text the compiler accepts, every function in the
;; statement it produces is the meaning of a dictionary word, or one of
;; implies, and, or, not, equal.
(defthm compiled-statements-use-only-dictionary-words
  (implies (not (mv-nth 0 (compile-drs d)))
           (vok t (mv-nth 1 (compile-drs d))))
  :hints (("Goal" :in-theory (disable compile-sentence compile-sentences)
           :expand ((:free (x) (vok t (cons 'and x)))))))
