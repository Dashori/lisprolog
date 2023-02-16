(print(list 'Fred 'and 'Wilma))
(print(list 'Fred '(and Wilma))) 
(print(cons Nil Nil))
(print(cons Nil '(cons Nil Nil)))

(print(cons 'a '(b)))
(print(cons 'a 'b))

(print(cons 'a (cons 'b '(c))))
;; (print(cons 'a (cons 'b '(c))))

(print(cons T Nil))
(print(cons Nil T))
(print  (list Nil))
(print (cons ' (T) Nil))
(print (list ' (one two) ' (free temp)))



(print (cons 1 2))
(print (list 1 2))
(print (cons 1 (cons 2 nil)))
; 
(PRINT "PART 2")

(print (cons 'Fred '(and Wilma))) 
(print (list 'Fred '(and Wilma))) 

(print (cons 'Fred '(Wilma)))
(print (cons 'Fred 'Wilma))

(print (cons 1 2))
(print (cons 1 (cons 2 nil)))

(print (list Nil Nil))
(print  (list T Nil))
(print (list Nil T))

(print (list Nil))

(print "last\n")
(print (cons T (list Nil)))
(print (list '(T) Nil))
(print (cons '(one two) '(free temp)))

(print (cons 'a 'b))
(print (cons 'a '(b)))
(print (cons '(a) 'b))
(print (cons '(a) '(b)))

; 
; 


; (f arl ar2 ar3 ar4), возвращающую список: ((arl ar2) (ar3 ar4)).
(print
((lambda (ar1 ar2 ar3 ar4) 
(list (list ar1 ar2) (list ar3 ar4)))
 1 2 3 4)
)

((lambda (ar1 ar2 ar3 ar4) (list (list ar1 ar2) (list ar3 ar4))) 1 2 3 4)


(defun f1 (ar1 ar2 ar3 ar4) 
(list (list ar1 ar2) (list ar3 ar4)))

(print (f1 1 2 3 4))


((lambda (ar1 ar2) 
(list (list ar1) (list ar2)))
1 2)

(print ((lambda (ar1 ar2) 
(list (list ar1) (list ar2)))
1 2))


(defun f1 (ar1 ar2) 
(list (list ar1) (list ar2)))

(f1 1 2)


((lambda (arl)
(list (list (list arl))))
1)

(defun f1 (arl)
(list (list (list arl))))

(print ((lambda (arl)
(list (list (list arl))))
1))

(print (f1 1))



(print (cons 1 2))
(print (list 1 2 ))

(print (defvar x (cons 1 2)))
(print (setf (cdr x ) x))



