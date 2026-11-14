; The generator: an ACL2 theorem to an Attempto sentence.  And the normaliser it
; reads from.  In logic mode.  It began as a function-for-function port of a
; Python generator, which it replaced after giving identical output on all 565
; theorems tried (NOTEBOOK.md, stage 2).
;
; Not trusted: every sentence it writes is parsed by Attempto, compiled back by
; compiler.lisp, and certified only if ACL2 shows the result is the original
; theorem.  It's in ACL2 so that the whole English layer, apart from Attempto's
; parser, is something ACL2 can reason about.
(in-package "ACL2")
(include-book "dictionary-data")

;; ======================================================================
;; Strings
;; ======================================================================

(defun str-cat (xs)
  (if (atom xs) "" (concatenate 'string (if (stringp (car xs)) (car xs) "") (str-cat (cdr xs)))))

(defun str-join (xs sep)
  (cond ((atom xs) "")
        ((atom (cdr xs)) (if (stringp (car xs)) (car xs) ""))
        (t (concatenate 'string (if (stringp (car xs)) (car xs) "") sep (str-join (cdr xs) sep)))))

(defun nat-str (n) (coerce (explode-nonnegative-integer (nfix n) 10 nil) 'string))
(defun int-str (n) (if (< (ifix n) 0) (concatenate 'string "-" (nat-str (- (ifix n)))) (nat-str n)))

;; How a term is printed: symbols by name, numbers in decimal, lists in parens.
(mutual-recursion
 (defun show (x)
   (declare (xargs :measure (list (acl2-count x) 1) :well-founded-relation l<))
   (cond ((symbolp x) (symbol-name x))
         ((integerp x) (int-str x))
         ((stringp x) x)
         ((atom x) "?")
         (t (concatenate 'string "(" (show-list x) ")"))))
 (defun show-list (xs)
   (declare (xargs :measure (list (acl2-count xs) 0)))
   (cond ((atom xs) "")
         ((atom (cdr xs)) (show (car xs)))
         (t (concatenate 'string (show (car xs)) " " (show-list (cdr xs)))))))

(defun lower (x) (string-downcase (show x)))

;; ======================================================================
;; The normaliser: a translated formula to the plain term the generator reads.
;;   ((lambda (v...) body) a...)  becomes body with v replaced by a  (let)
;;   (return-last 'f exec logic)  becomes logic                       (mbe, prog2$)
;;   (if a b 'nil) becomes (and a b); (if a t b) and (if a a b) become (or a b)
;;   (quote c) becomes c; binary-+ becomes +, unary-- becomes -, and so on.
;; Not trusted: a theorem whose formula changes here is certified by proving it
;; and the English claim from each other, not by comparing them.
;; ======================================================================

;; Replace variables by terms, leaving quoted constants and function names alone.
(mutual-recursion
 (defun gen-subst (x m)
   (declare (xargs :measure (acl2-count x)))
   (cond ((atom x) (if (assoc-equal x m) (cdr (assoc-equal x m)) x))
         ((eq (car x) 'quote) x)
         (t (cons (if (consp (car x)) (gen-subst (car x) m) (car x)) (gen-subst-list (cdr x) m)))))
 (defun gen-subst-list (xs m)
   (declare (xargs :measure (acl2-count xs)))
   (if (atom xs) nil (cons (gen-subst (car xs) m) (gen-subst-list (cdr xs) m)))))

(defun and-parts (x) (if (and (consp x) (eq (car x) 'and)) (cdr x) (list x)))

(defun rename-fn (f)
  (case f (binary-+ '+) (unary-- '-) (binary-append 'append) (binary-* '*) (otherwise f)))

;; Beta-reduction is bounded by fuel: a substitution can make a term larger.
(mutual-recursion
 (defun norm (x fuel)
   (declare (xargs :measure (list (nfix fuel) (acl2-count x)) :well-founded-relation l<))
   (cond ((zp fuel) x)
         ((atom x) x)
         ((eq (car x) 'quote) (if (atom (cadr x)) (cadr x) x))
         ((and (consp (car x)) (eq (caar x) 'lambda))
          (let ((args (norm-list (cdr x) fuel)))
            (norm (gen-subst (caddr (car x)) (pairlis$ (cadr (car x)) args)) (1- fuel))))
         ((eq (car x) 'return-last) (norm (cadddr x) fuel))
         (t (let ((args (norm-list (cdr x) fuel)))
              (cond ((and (eq (car x) 'if) (equal (len args) 3) (equal (nth 2 args) nil))
                     (cons 'and (append (and-parts (nth 0 args)) (and-parts (nth 1 args)))))
                    ((and (eq (car x) 'if) (equal (len args) 3)
                          (or (equal (nth 1 args) t) (equal (nth 1 args) (nth 0 args))))
                     (list 'or (nth 0 args) (nth 2 args)))
                    (t (cons (rename-fn (car x)) args)))))))
 (defun norm-list (xs fuel)
   (declare (xargs :measure (list (nfix fuel) (acl2-count xs))))
   (if (atom xs) nil (cons (norm (car xs) fuel) (norm-list (cdr xs) fuel)))))

;; ======================================================================
;; Words
;; ======================================================================

(defun result-word (fn tbl)
  (cond ((atom tbl) nil)
        ((equal (cadr (car tbl)) fn) (cons (car (car tbl)) (caddr (car tbl))))
        (t (result-word fn (cdr tbl)))))

(defun word-for (fn tbl) (car (rassoc-equal fn tbl)))
(defun in-table (fn tbl) (and (rassoc-equal fn tbl) t))

(defun test-fn-p (fn)
  (or (in-table fn *type-nouns*) (in-table fn *adjectives*)
      (in-table fn *relation-nouns*) (in-table fn *relation-adjectives*)))

(defun article (w)
  (let ((cs (coerce w 'list)))
    (if (or (member (car cs) '(#\a #\e #\i #\o #\u))
            (and (consp (cdr cs)) (consp (cddr cs))
                 (equal (car cs) #\n) (equal (cadr cs) #\t) (equal (caddr cs) #\h)))
        "an" "a")))

;; ======================================================================
;; Variables and their letters
;; ======================================================================

(defun var-sym-p (x) (and (symbolp x) x (not (eq x t)) (not (keywordp x))))

(mutual-recursion
 (defun collect-vars (x acc)
   (declare (xargs :measure (acl2-count x)))
   (cond ((atom x) (if (and (var-sym-p x) (not (member-equal x acc))) (append acc (list x)) acc))
         (t (collect-vars-list (cdr x) acc))))
 (defun collect-vars-list (xs acc)
   (declare (xargs :measure (acl2-count xs)))
   (if (atom xs) acc (collect-vars-list (cdr xs) (collect-vars (car xs) acc)))))

(defconst *letters* '("X" "Y" "Z" "U" "V" "W" "P" "Q" "R" "S" "T" "K" "M"))

(defun single-letter-p (s)
  (and (stringp s) (equal (length s) 1)
       (let ((c (char s 0))) (and (char<= #\A c) (char<= c #\Z)))))

(defun first-free (letters used avoid)
  (cond ((atom letters) "?")
        ((or (member-equal (car letters) used) (member-equal (car letters) avoid))
         (first-free (cdr letters) used avoid))
        (t (car letters))))

(defun name-vars (vars used var-names)
  (if (atom vars) nil
    (let* ((s (symbol-name (car vars)))
           (name (if (and (single-letter-p s) (not (member-equal s used))) s
                   (first-free *letters* used var-names))))
      (cons (cons (car vars) name)
            (name-vars (cdr vars) (cons name used) var-names)))))

(defun symbol-names (xs) (if (atom xs) nil (cons (symbol-name (car xs)) (symbol-names (cdr xs)))))

(defun global-names (formula)
  (let ((vars (collect-vars formula nil)))
    (name-vars vars nil (symbol-names vars))))

;; (+ a (- b)) is a difference.
(mutual-recursion
 (defun difference-normal (x)
   (declare (xargs :measure (acl2-count x)))
   (cond ((atom x) x)
         ((and (eq (car x) '+) (equal (len x) 3) (consp (caddr x))
               (eq (car (caddr x)) '-) (equal (len (caddr x)) 2))
          (list '- (difference-normal (cadr x)) (difference-normal (cadr (caddr x)))))
         (t (cons (car x) (difference-normal-list (cdr x))))))
 (defun difference-normal-list (xs)
   (declare (xargs :measure (acl2-count xs)))
   (if (atom xs) nil (cons (difference-normal (car xs)) (difference-normal-list (cdr xs))))))

;; ======================================================================
;; Generating noun phrases.  st is (names used defs defined), threaded through.
;; ======================================================================

(defun st-names (st) (nth 0 st))
(defun st-used (st) (nth 1 st))
(defun st-defs (st) (nth 2 st))
(defun st-defined (st) (nth 3 st))

(defun atom-np (x st)
  (cond ((rassoc-equal x *constants*) (mv nil (word-for x *constants*) st))
        ((and (integerp x) (<= 0 x)) (mv nil (nat-str x) st))
        ((assoc-equal x (st-names st)) (mv nil (cdr (assoc-equal x (st-names st))) st))
        (t (mv (str-cat (list "constant " (show x) " has no word")) nil st))))

(mutual-recursion
 (defun gen-np (x st)
   (declare (xargs :measure (list (acl2-count x) 0) :well-founded-relation l<))
   (if (atom x) (atom-np x st)
     (let ((e (result-word (car x) *result-nouns*)))
       (cond ((not e) (mv (str-cat (list "no word for the function " (lower (car x)))) nil st))
             ((not (equal (cdr e) (len (cdr x))))
              (mv (str-cat (list (lower (car x)) " with " (nat-str (len (cdr x))) " arguments")) nil st))
             ((equal (cdr e) 1)
              (mv-let (err s st) (gen-np (cadr x) st)
                (if err (mv err nil st)
                  (mv nil (str-cat (list (article (car e)) " " (car e) " of " s)) st))))
             (t (mv-let (err parts st) (gen-parts (cdr x) st)
                  (if err (mv err nil st)
                    (mv nil (str-cat (list (article (car e)) " " (car e) " of " (str-join parts " and "))) st))))))))
 (defun gen-parts (xs st)
   (declare (xargs :measure (list (acl2-count xs) 0)))
   (if (atom xs) (mv nil nil st)
     (mv-let (err p st) (if (atom (car xs)) (atom-np (car xs) st) (gen-define (car xs) st))
       (if err (mv err nil st)
         (mv-let (err2 ps st) (gen-parts (cdr xs) st)
           (if err2 (mv err2 nil st) (mv nil (cons p ps) st)))))))
 ;; Name a compound term in the antecedent and return its letter.  The same
 ;; term always gets the same name.
 (defun gen-define (x st)
   (declare (xargs :measure (list (acl2-count x) 1)))
   (let ((memo (assoc-equal x (st-defined st))))
     (if memo (mv nil (cdr memo) st)
       (let* ((v (first-free *letters* (st-used st) nil))
              (st (list (st-names st) (cons v (st-used st)) (st-defs st) (st-defined st))))
         (mv-let (err s st) (gen-np x st)
           (if err (mv err nil st)
             (mv nil v (list (st-names st) (st-used st)
                             (append (st-defs st) (list (str-cat (list v " is " s))))
                             (cons (cons x v) (st-defined st)))))))))))

;; ======================================================================
;; Tests and statements
;; ======================================================================

(defun not-str (negated) (if negated " not" ""))

(mutual-recursion
 (defun gen-test (x negated st)
   (declare (xargs :measure (list (acl2-count x) 0) :well-founded-relation l<))
   (cond
    ((and (consp x) (eq (car x) 'or) (not negated)) (gen-or-list (cdr x) st))
    ((and (consp x) (eq (car x) '<) (equal (len x) 3))
     (mv-let (err a st) (gen-np (cadr x) st)
       (if err (mv err nil st)
         (mv-let (err2 b st) (gen-np (caddr x) st)
           (if err2 (mv err2 nil st)
             (mv nil (str-cat (list a " is" (not-str negated) " smaller than " b)) st))))))
    ((and (consp x) (eq (car x) 'not))
     (if negated (mv "double negation" nil st) (gen-test (cadr x) t st)))
    ((and (consp x) (equal (len x) 3) (in-table (car x) *relation-nouns*))
     (let ((w (word-for (car x) *relation-nouns*)) (o (caddr x)))
       (mv-let (err obj st)
           (if (or (atom o) (equal (cdr (result-word (car o) *result-nouns*)) 1))
               (gen-np o st)
             (gen-define o st))
         (if err (mv err nil st)
           (mv-let (err2 subj st) (gen-np (cadr x) st)
             (if err2 (mv err2 nil st)
               (mv nil (str-cat (list subj " is" (not-str negated) " " (article w) " " w " of " obj)) st)))))))
    ((and (consp x) (equal (len x) 3) (in-table (car x) *relation-adjectives*))
     (mv-let (err a st) (gen-np (cadr x) st)
       (if err (mv err nil st)
         (mv-let (err2 b st) (gen-np (caddr x) st)
           (if err2 (mv err2 nil st)
             (mv nil (str-cat (list a " is" (not-str negated) " "
                                    (word-for (car x) *relation-adjectives*) " " b)) st))))))
    ((and (consp x) (eq (car x) 'equal) (equal (len x) 3))
     (mv-let (err a st) (gen-np (cadr x) st)
       (if err (mv err nil st)
         (mv-let (err2 b st) (gen-np (caddr x) st)
           (if err2 (mv err2 nil st)
             (mv nil (str-cat (list a " is" (not-str negated) " " b)) st))))))
    ((or (atom x) (not (equal (len x) 2)))
     (mv (str-cat (list "hypothesis or conclusion " (show x) " is not a test on one term")) nil st))
    ((in-table (car x) *type-nouns*)
     (let ((w (word-for (car x) *type-nouns*)))
       (mv-let (err a st) (gen-np (cadr x) st)
         (if err (mv err nil st)
           (mv nil (str-cat (list a " is" (not-str negated) " " (article w) " " w)) st)))))
    ((in-table (car x) *adjectives*)
     (mv-let (err a st) (gen-np (cadr x) st)
       (if err (mv err nil st)
         (mv nil (str-cat (list a " is" (not-str negated) " " (word-for (car x) *adjectives*))) st))))
    (t (mv (str-cat (list "no word for the test " (lower (car x)))) nil st))))
 ;; "A or B", each side a test or an equality.
 (defun gen-or-list (xs st)
   (declare (xargs :measure (list (acl2-count xs) 0)))
   (if (atom xs) (mv nil "" st)
     (mv-let (err s st) (gen-test-or-eq (car xs) st)
       (if err (mv err nil st)
         (if (atom (cdr xs)) (mv nil s st)
           (mv-let (err2 rest st) (gen-or-list (cdr xs) st)
             (if err2 (mv err2 nil st) (mv nil (str-cat (list s " or " rest)) st))))))))
 (defun gen-test-or-eq (x st)
   (declare (xargs :measure (list (acl2-count x) 1)))
   (if (and (consp x) (eq (car x) 'equal))
       (mv-let (err a st) (gen-np (cadr x) st)
         (if err (mv err nil st)
           (mv-let (err2 b st) (gen-np (caddr x) st)
             (if err2 (mv err2 nil st) (mv nil (str-cat (list a " is " b)) st)))))
     (gen-test x nil st))))

;; "A and B", each side a test or an equality.  An "or" inside would need brackets.
(defun gen-and-list (xs st)
  (if (atom xs) (mv nil "" st)
    (if (and (consp (car xs)) (eq (car (car xs)) 'or))
        (mv "'or' inside 'and' in a conclusion is not in the grammar yet" nil st)
      (mv-let (err s st) (gen-test-or-eq (car xs) st)
        (if err (mv err nil st)
          (if (atom (cdr xs)) (mv nil s st)
            (mv-let (err2 rest st) (gen-and-list (cdr xs) st)
              (if err2 (mv err2 nil st) (mv nil (str-cat (list s " and " rest)) st)))))))))

(defun gen-statement (x st)
  (cond ((and (consp x) (eq (car x) 'or)) (gen-or-list (cdr x) st))
        ((and (consp x) (eq (car x) 'and) (consp (cdr x))) (gen-and-list (cdr x) st))
        ((and (consp x) (eq (car x) 'equal))
         (if (or (and (consp (cadr x)) (test-fn-p (car (cadr x))))
                 (and (consp (caddr x)) (test-fn-p (car (caddr x)))))
             (mv "an equality between two tests needs 'if and only if'" nil st)
           (mv-let (err a st) (gen-np (cadr x) st)
             (if err (mv err nil st)
               (mv-let (err2 b st) (gen-np (caddr x) st)
                 (if err2 (mv err2 nil st) (mv nil (str-cat (list a " is " b)) st)))))))
        ((and (consp x) (member-eq (car x) '(if or iff let mbe)))
         (mv (str-cat (list (lower (car x)) " is not in the grammar yet")) nil st))
        (t (gen-test x nil st))))

(defun gen-tests (xs st)
  (if (atom xs) (mv nil nil st)
    (mv-let (err s st) (gen-test (car xs) nil st)
      (if err (mv err nil st)
        (mv-let (err2 ss st) (gen-tests (cdr xs) st)
          (if err2 (mv err2 nil st) (mv nil (cons s ss) st)))))))

;; ======================================================================
;; One sentence
;; ======================================================================

(defun neg-p (x) (and (consp x) (member-eq (car x) '(not or))))
(defun pos-hyps (hs) (cond ((atom hs) nil) ((neg-p (car hs)) (pos-hyps (cdr hs))) (t (cons (car hs) (pos-hyps (cdr hs))))))
(defun neg-hyps (hs) (cond ((atom hs) nil) ((neg-p (car hs)) (cons (car hs) (neg-hyps (cdr hs)))) (t (neg-hyps (cdr hs)))))

;; The compiler reads "V is <a compound term without V>" as a definition, and
;; substitutes it away.  Any other equality stays an equality.
(defun substituted-equality-p (h)
  (and (consp h) (eq (car h) 'equal) (var-sym-p (cadr h)) (consp (caddr h))
       (not (member-equal (cadr h) (collect-vars (caddr h) nil)))))

(defun any-substituted-equality (hs)
  (cond ((atom hs) nil) ((substituted-equality-p (car hs)) t) (t (any-substituted-equality (cdr hs)))))

(defun vars-of-list (xs) (collect-vars-list xs nil))

;; The innermost function application with V as a direct argument, deepest first.
(mutual-recursion
 (defun find-target (v x)
   (declare (xargs :measure (acl2-count x)))
   (if (atom x) nil
     (or (find-target-list v (cdr x))
         (and (member-equal v (cdr x)) (result-word (car x) *result-nouns*) x))))
 (defun find-target-list (v xs)
   (declare (xargs :measure (acl2-count xs)))
   (if (atom xs) nil (or (find-target v (car xs)) (find-target-list v (cdr xs))))))

(defun find-in-list (v xs) (if (atom xs) nil (or (find-target v (car xs)) (find-in-list v (cdr xs)))))

(mutual-recursion
 (defun replace-term (old new x)
   (declare (xargs :measure (acl2-count x)))
   (cond ((equal x old) new)
         ((atom x) x)
         (t (cons (car x) (replace-term-list old new (cdr x))))))
 (defun replace-term-list (old new xs)
   (declare (xargs :measure (acl2-count xs)))
   (if (atom xs) nil (cons (replace-term old new (car xs)) (replace-term-list old new (cdr xs))))))

;; Introduce, in the global order, every variable not already introduced: name
;; the innermost term that has it as a direct argument, or say "there is something V".
(defun introduce (vs introduced concl rest there-is st)
  (if (atom vs) (mv nil concl rest there-is st)
    (let ((v (car vs)))
      (if (member-equal v introduced)
          (introduce (cdr vs) introduced concl rest there-is st)
        (let ((target (or (find-target v concl) (find-in-list v rest))))
          (if (not target)
              (mv-let (err s st) (atom-np v st)
                (if err (mv err nil nil nil st)
                  (introduce (cdr vs) (cons v introduced) concl rest
                             (append there-is (list (str-cat (list "there is something " s)))) st)))
            (mv-let (err letter st) (gen-define target st)
              (if err (mv err nil nil nil st)
                (let* ((ph (intern-in-package-of-symbol (concatenate 'string "@" letter) 'acl2))
                       (st (list (cons (cons ph letter) (st-names st)) (st-used st)
                                 (st-defs st) (st-defined st))))
                  (introduce (cdr vs) (append (collect-vars target nil) introduced)
                             (replace-term target ph concl) (replace-term-list target ph rest)
                             there-is st))))))))))

(defun ordered-filter (vs keep drop)
  (cond ((atom vs) nil)
        ((and (member-equal (car vs) keep) (not (member-equal (car vs) drop)))
         (cons (car vs) (ordered-filter (cdr vs) keep drop)))
        (t (ordered-filter (cdr vs) keep drop))))

;; Returns (mv err text order): the sentence, and its hypotheses in the order the
;; compiler will produce them (definitions are substituted away).
(defun gen-sentence (names hyps concl)
  (if (any-substituted-equality (pos-hyps hyps))
      (mv "an equality hypothesis would be substituted away, changing the form" nil nil)
    (let* ((pos (pos-hyps hyps)) (rest (neg-hyps hyps))
           (st (list names (strip-cdrs names) nil nil))
           (introduced (vars-of-list pos))
           (every (vars-of-list (append hyps (list concl))))
           (order-vars (ordered-filter (strip-cars names) every introduced)))
      (mv-let (err pos-text st) (gen-tests pos st)
        (if err (mv err nil nil)
          (mv-let (err2 concl2 rest2 there-is st) (introduce order-vars introduced concl rest nil st)
            (if err2 (mv err2 nil nil)
              (mv-let (err3 rest-text st) (gen-tests rest2 st)
                (if err3 (mv err3 nil nil)
                  (mv-let (err4 body st) (gen-statement concl2 st)
                    (if err4 (mv err4 nil nil)
                      (let ((clauses (append there-is (st-defs st) pos-text rest-text)))
                        (if (atom clauses) (mv "nothing to put before 'then'" nil nil)
                          (mv nil (str-cat (list "If " (str-join clauses ", and ") " then " body "."))
                              (append pos rest)))))))))))))))

(defun shape (hyps concl)
  (cond ((atom hyps) concl)
        ((atom (cdr hyps)) (list 'implies (car hyps) concl))
        (t (list 'implies (cons 'and hyps) concl))))

;; ======================================================================
;; Cases
;; ======================================================================

;; A test: true or false, never another value.  (Relation nouns count: ACL2's
;; member-equal returns a tail, so a claim built on that may fail to certify, but
;; it can never certify wrongly.)
(mutual-recursion
 (defun test-like-p (x)
   (declare (xargs :measure (acl2-count x)))
   (or (eq x t) (eq x nil)
    (and (consp x)
        (or (test-fn-p (car x))
            (member-eq (car x) '(< not or equal iff))
            (and (eq (car x) 'and) (consp (cdr x)) (test-like-list-p (cdr x)))
            (and (eq (car x) 'if) (equal (len x) 4) (test-like-list-p (cddr x)))))))
 (defun test-like-list-p (xs)
   (declare (xargs :measure (acl2-count xs)))
   (if (atom xs) t (and (test-like-p (car xs)) (test-like-list-p (cdr xs))))))

(defun flatten-hyps (hs)
  (declare (xargs :measure (acl2-count hs)))
  (cond ((atom hs) nil)
        ((and (consp (car hs)) (eq (car (car hs)) 'and))
         (append (flatten-hyps (cdr (car hs))) (flatten-hyps (cdr hs))))
        (t (cons (car hs) (flatten-hyps (cdr hs))))))

;; Where a value is wanted, (and c v) is (if c v nil), and (and c1 c2 ... v) is
;; (if c1 (and c2 ... v) nil).
(defun value-and-as-if (x)
  (if (consp (cdddr x)) (list 'if (cadr x) (cons 'and (cddr x)) nil)
    (list 'if (cadr x) (caddr x) nil)))

(defun logical-p (f) (member-eq f '(not or and iff implies)))

;; The first choice between values in X, outermost first: (if c a b) anywhere, or
;; (and ...) where a value is wanted.  Returned as an (if c a b) term, with the
;; subterm it replaces.
(mutual-recursion
 (defun find-choice (x value-pos)
   (declare (xargs :measure (acl2-count x)))
   (cond ((atom x) nil)
         ((eq (car x) 'quote) nil)
         ((and (eq (car x) 'if) (equal (len x) 4)) (cons x x))
         ((and value-pos (eq (car x) 'and) (consp (cdr x)) (consp (cddr x)))
          (cons x (value-and-as-if x)))
         (t (find-choice-list (cdr x) (not (logical-p (car x)))))))
 (defun find-choice-list (xs value-pos)
   (declare (xargs :measure (acl2-count xs)))
   (if (atom xs) nil (or (find-choice (car xs) value-pos) (find-choice-list (cdr xs) value-pos)))))

(defun negate (c) (if (and (consp c) (eq (car c) 'not)) (cadr c) (list 'not c)))

;; A case is (hyps . conclusion).  A choice (if c a b) splits a case into two:
;; one assuming c, with a in its place, and one assuming not c, with b.  The
;; conclusion is searched first, then the hypotheses.
(defun split-cases (cases fuel)
  (declare (xargs :measure (list (nfix fuel) (len cases)) :well-founded-relation l<))
  (if (or (zp fuel) (atom cases)) cases
    (let* ((hyps (car (car cases))) (concl (cdr (car cases)))
           (ch (or (find-choice concl nil) (find-choice-list hyps nil))))
      (if (not ch) (cons (car cases) (split-cases (cdr cases) fuel))
        (let ((old (car ch)) (c (nth 1 (cdr ch))) (a (nth 2 (cdr ch))) (b (nth 3 (cdr ch))))
          (split-cases (list* (cons (append (replace-term-list old a hyps) (list c))
                                    (replace-term old a concl))
                              (cons (append (replace-term-list old b hyps) (list (negate c)))
                                    (replace-term old b concl))
                              (cdr cases))
                       (1- fuel)))))))

;; Where a truth value is wanted, ACL2 reads any value other than nil as true.  So
;; a value V there means "V is not Nil", and (not V) means "V is Nil".  A T
;; conjunct says nothing, and is dropped.
(defun value-term-p (x)
  (or (var-sym-p x)
      (and (consp x) (result-word (car x) *result-nouns*) t)))

(mutual-recursion
 (defun truthy (x)
   (declare (xargs :measure (acl2-count x)))
   (cond ((value-term-p x) (list 'not (list 'equal x nil)))
         ((atom x) x)
         ((and (eq (car x) 'not) (value-term-p (cadr x))) (list 'equal (cadr x) nil))
         ((eq (car x) 'and)
          (let ((args (remove-equal t (truthy-list (cdr x)))))
            (if (and (consp args) (atom (cdr args))) (car args) (cons 'and args))))
         ((member-eq (car x) '(not or iff)) (cons (car x) (truthy-list (cdr x))))
         (t x)))
 (defun truthy-list (xs)
   (declare (xargs :measure (acl2-count xs)))
   (if (atom xs) nil (cons (truthy (car xs)) (truthy-list (cdr xs))))))

;; "V is <a compound term>" would be read as a definition of V and substituted
;; away, so such a hypothesis is written the other way round.
(defun orient-equality (h)
  (if (substituted-equality-p h) (list 'equal (caddr h) (cadr h)) h))
(defun orient-equalities (hs)
  (if (atom hs) nil (cons (orient-equality (car hs)) (orient-equalities (cdr hs)))))

;; A case assuming false, or concluding true, says nothing: it is dropped.  A true
;; hypothesis is dropped.  A case concluding false says its last hypothesis is false.
(defun tidy-case (hyps concl)
  (let ((hyps (remove-equal t hyps)))
    (cond ((or (member-equal nil hyps) (eq concl t)) (mv t nil nil))
          ((and (eq concl nil) (consp hyps))
           (mv nil (orient-equalities (butlast hyps 1)) (negate (car (last hyps)))))
          (t (mv nil (orient-equalities hyps) concl)))))

(defun gen-cases (names cases)
  (if (atom cases) (mv nil nil nil)
    (mv-let (drop hyps concl)
        (tidy-case (flatten-hyps (truthy-list (car (car cases)))) (truthy (cdr (car cases))))
      (if drop (gen-cases names (cdr cases))
        (mv-let (err s o) (gen-sentence names hyps concl)
          (if err (mv err nil nil)
            (mv-let (err2 ss shapes) (gen-cases names (cdr cases))
              (if err2 (mv err2 nil nil)
                (mv nil (cons s ss) (cons (shape o concl) shapes))))))))))

(defconst *max-sentences* 4)

;; ======================================================================
;; A theorem
;; ======================================================================

;; Returns (mv err text intended): the Attempto text, and the formula it is meant
;; to compile to, in the compiler's order.  'intended' only guides the renaming of
;; variables; correctness is established by certification.
;; Returns (mv err text intended): the Attempto text, and the formula it is meant
;; to compile to, in the compiler's order.  'intended' only guides the renaming of
;; variables; correctness is established by certification.
;;   - An equality between two tests is "if and only if".
;;   - "if and only if" is two sentences, one for each direction.
;;   - A choice between values in a conclusion is one sentence per case.
(defun generate (formula)
  (let* ((names (global-names formula))
         (x (difference-normal formula))
         (imp (and (consp x) (eq (car x) 'implies)))
         (hyps (if imp (list (cadr x)) nil))
         (concl (if imp (caddr x) x))
         (concl (if (and (consp concl) (eq (car concl) 'equal)
                         (test-like-p (cadr concl)) (test-like-p (caddr concl)))
                    (cons 'iff (cdr concl))
                  concl))
         (cases (if (and (consp concl) (eq (car concl) 'iff))
                    (list (cons (append hyps (list (cadr concl))) (caddr concl))
                          (cons (append hyps (list (caddr concl))) (cadr concl)))
                  (list (cons hyps concl))))
         (cases (split-cases cases (+ 1 *max-sentences*))))
    (if (< *max-sentences* (len cases))
        (mv (str-cat (list "more than " (nat-str *max-sentences*) " cases")) nil nil)
      (mv-let (err ss shapes) (gen-cases names cases)
        (cond (err (mv err nil nil))
              ((atom shapes) (mv "every case is trivially true" nil nil))
              ((atom (cdr shapes)) (mv nil (car ss) (car shapes)))
              (t (mv nil (str-join ss " ") (cons 'and shapes))))))))
