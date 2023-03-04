(print (listp 1))
(print (listp '(1 2)))


(print (if (listp 1)
            (+ 1 2)
            (+ -1 -2) ))


(print (and (listp '(2 3)) 3 ))
(print (and (listp '(2 3))  (listp 'a)))

(print (or (listp '(2 3)) 4))
(print (or (listp '(2 3))  (listp 'a)))
(print (or (listp 'a) (listp 'b)))

(defun my-third (x)
    (car (cdr (cdr x))))

(print (list 1 2 3 4 5))
(print '(list 1 2 3 4 5))


(print (my-third '(list 1 2 3 4 5 )))
(print (my-third (list 1 2 3 4 5)))


(print (> (+ 1 3) 5))
(print (> (+ 1 2) 3))


;; check if obj in out list on the first two position

(defun firstwo (lst obj)
    (if (eql lst nil)   ;(null lst)
        'empty
        (if (eql (car lst) obj)
            'super1
            ;; 'no
            (if (eql (car (cdr lst)) obj)
                'super2
                'no
))))

(print "test func")
(print (firstwo nil nil))
(print (firstwo '(1 2 3 4 ) nil))
(print (firstwo '(1 2) nil))
(print (firstwo '(1 2) 1))
(print (firstwo '(1 2) 2))



(defun inList (lst obj)
    (if (eql lst nil)
        'empty
        (if (eql (car lst) obj)
            'yes
            (inList (cdr lst) obj)  
        )
    )
)

(print "")
(print "inList test")

(print (inList nil nil))
(print (inList '(1 2 3 4 5 6 7) nil))

(print (inList '(1 2 3 4 5 6 7) 7))
(print (inList '(1 2 3 4 5 6 7) 8))


;; (print (car '(a b)))
;(print (firstwo ( list 1 2 3 4 5) '5 ))

(print (eql 2 2))

(print "EQ EQL EQUAL:")

(print (eq (cons 'a 'b) (cons 'a 'b))) 

(print (eql (cons 'a 'b) (cons 'a 'b))) 

(print (equal (cons 'a 'b) (cons 'a 'b))) 



(print '(+ 2 3))
(print `(+ 2 3))

(print ( = ( + 1 6 ) (/ 8 2)))


(print (if (= (+ 2 3) 5)
            'yes1   
            'no1))


(print (cond ( ( eql (+ 2 3) 6)  'yes1)
             ( ( not (eql (+ 2 3) 6))  'no1)
        ))


;;  Написать функцию, вычисляющую гипотенузу прямоугольного треугольника 
;; по заданным катетам и составить диаграмму её вычисления.


(defun pifagor (x y)
    (sqrt (+ (* x x) (* y y)))
) 

(print (pifagor 3 4))

;; (print `(y ,y (,y) ,(y)))

(print (eval ''(1 2 3)))
;; (print (eval '(1 2 3))) // bad



(defvar y 5)
(print y)
(print 'y)


(defun y (x)
    6
    )

(print y)
(print (y 3))
;; (print (funcall y))
;; (write-line "5")


(print (eval '2))
(print (eval '2))


(print (eval ''a))
;; (print (eval 'a))
;; (print (eval a))

