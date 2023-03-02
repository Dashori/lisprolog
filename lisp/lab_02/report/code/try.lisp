(print (list 'a 'c))
(print (cons 'a '(b c)))
(print (cons 'a 'b))
(print (caddr '(1 2 3 4 5)))
;; (print (cons 'a 'b 'c))
(print (list 'a '(b c)))

(print (length '(1 2 3)))


(print (+ 1 '4))

(print (list (+ 1 (length '(1 2 3)))))


(print (cons 3 (list 5 6)))

(print (list 3 'from 9 'lives (- 9 3)))

;; (print (+ (length for 2 too)) (car '(21 22 23)))

(print (cdr '(cons is short for ans)))

;; (print (car (list one two)))

(print (cons 3 '(list 5 6)))

(PRINT (car (list 'one 'two)))


(defun mystery (x) (list (second x) (first x)))

(print (mystery '(1 2 3 4) ))
(print (mystery '(free)))

(print (list 'cons t NIL))

(print (eval '(list 1 2 3)))

;; (print (eval (eval (list 'cons t NIL))))
(defun f-to-c (temp)
    (* 5/9 (- temp 32.0)))


(print (apply 'f-to-c '(451)))


(print (eval (list 'cons t nil)))

(print (list 'cons t nil))

;; (print (eval (eval (list 'cons t nil))))

(print (list 'eval 'a))

;; (print (eval (list 'eval NIL)))

(print (eval (EVAL NIL)))