(defun not-null-list (lst)
    (cond ((not lst) NIL)
        ((and (not (atom (car lst))) 
            (not (not (caar lst)))) (car lst))
        (T (not-null-list (cdr lst)))))


(print (not-null-list '(1 2 3 4)))

(print (not-null-list '(() 1 2 (3 (g 3)) 4)))


;; (defun not-not-test (lst)
;;     (print (not (not (caar lst))))
;; )

(defun not-not-test (lst)
    (print (null (null (caar lst))))
)

(not-not-test '('(1 2) 3 4))
(not-not-test '('(1) 3 4))
(not-not-test '(() 3 4))

(print ())
(print (null ()))
(print (caar '((1 2) 3 4)))