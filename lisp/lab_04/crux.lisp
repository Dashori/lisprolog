 ;; загадки!)

(defun x () 9)
(defvar x 'y)
(defvar y 'x)
(defun y () 7)

(print (funcall (eval x))) ;; eval x => eval 'y  => y => 'x => 9
(print (funcall (eval 'y)))
(print (funcall 'x))

(write-line "")

(print (funcall (eval y))) ;; eval y => eval 'x => x => 'y => 7
(print (funcall (eval 'x)))
(print (funcall 'y))


(write-line "")

(print (funcall y)) ;; y => 'x => funcall 'x => 9
(print (funcall 'y)) ;; 'y => funcall y => 7

(print (funcall x)) ;; x => 'y => funcall 'y => 7
(print (funcall 'x)) ;; funcall x => 9
(print (x)) ;; 9
;; (print ('x)) ;; ERROR

(write-line "")

(print (funcall (eval x))) ;; eval x => eval 'y => funcall y => funcall 'x => 9
(print (funcall (eval 'x))) ;; eval 'x => funcall x => funcall 'y => 7

(print (funcall (eval y))) ;; eval y => eval 'x => funcall x => funcall 'y => 7
(print (funcall (eval 'y))) ;; eval 'y => funcall y => funcall 'x => 9

(write-line "")


(print (+ 2 3))
(print '(+ 2 3))
(print (eval (+ 2 3)))
(print (eval '(+ 2 3)))
;; (defvar d '*)

;; (defun d (a b)
;;         (+ a b))

;; (print (funcall d 1 2)) ;; 2, то есть умножение
;; (print (funcall 'd 1 2)) ;; 3 функция
;; (print (apply d '(1 2))) ;; 2 умножение
;; (print (apply 'd '(1 2))) ;; 3 функция
;; (print (d 1 2))          ;; 3 функция
;; ;; (print ((eval (d 1 2))))          ;; 3 функция

(write-line "")
(write-line "")

(print (defvar a (cons 1 2))) ;; A
(print a) ;; (1 . 2)

(setf (cdr a) a)
;; (print a) ;; зациклится? да

(write-line "")
(write-line "")


;; (setf h '*) ;; без разницы
(defvar h '*)
(defun h (a b)
        (+ a b))

(print (funcall h 1 2)) ;; h => '* => 2
(print (funcall 'h 1 2)) ;; 3

(print (apply h '(1 2))) ;; h => '* => 1 * 2 = 2
(print (apply 'h '(1 2))) ;; 'h => + 1 2 = 3

(print (h 1 2)) ;; h => + 1 2 = 3

;; (print ('h 1 2)) ;; ERROR

(write-line "")
(write-line "")


(print (funcall 'h 1 2)) ;; 3
(print (apply h '(1 2))) ;; 2
(print (apply 'h '(1 2))) ;; 3
(print (h 1 2)) ;; 3

(write-line "")
(write-line "")
(write-line "")


(print (* 5 2)) ;; 10
(setf * '+)

(print (funcall * 5 2)) ;; * -> '+ 5 2 = 7
(print (funcall '* 5 2)) ;; * 5 2 = 10

(print (apply * '(5 2))) ;; + 5 2 = 7
(print (apply '* '(5 2))) ;; * 5 2 = 10

(write-line "")
(write-line "")
(write-line "")

(defvar y 5)
(defvar y 'z)
(print y) ;; а все равно будет Y 
(write-line "")

;; (defun y () 9)
;; (print (y))
;; (write-line "")

(setf * 2)
;; (setf '* 2) ;; error
(print (* * * *)) ;; 8
(print (* * *)) ;; 4
(print (+ * * 5)) ;; 4 + 5 = 9
(print (+ (* * *) *)) ;; 4 + 2 = 6
(print (apply '* '(3 4))) ;; 12

;; (print (apply '* '(* 3))) ;; ERROR
;; (print (apply * '(4 5))) ;; ERROR

(write-line "")
(write-line "")


(print (eval ''(1 2 3))) ;; eval ' '(1 2 3) =  '(1 2 3)
;; (print (eval '(1 2 3))) ;; eval '(1 2 3) = (1 2 3) ERROR
;; (print (1 2 3)) ERROR
(print (eval '''(1 2 3))) ;; eval '''(1 2 3) =  ''(1 2 3) 

(write-line "")

;; (defun f (a) 
    ;; (list a a))

;; ;; (print `(,(f) 1))
;; (print `(f ,(+ 1 1)))
;; (write-line "")

;; (print `(y ,y (,y) ,(y)))
;; (write-line "")

(defun z() `+)
(defvar z `*)
(print (funcall z 1 2)) ;; * 1 2 = 2
(print (funcall (z) 1 2)) ;; (+) 1 2 = 3
;; (print (`z 1 2)) ;; ERROR
;; (print (('z) 1 2))
(write-line "")



(defun lolo(x) 
    (if (eq x 5) 
            9 
            `pepe))

(defun pepe(x) 
    (if (eq x 9) 
        `lolo 
        21))

(print (pepe 9)) ;; 'lolo 
(print (pepe 9.0)) ;; 21 
(print (pepe 12)) ;; 21 

(print (lolo 5)) ;; 9
(print (lolo 5.0)) ;; 'pepe
(print (lolo 12)) ;;  'pepe


(print (funcall (apply `pepe (list (+ (lolo 5) 0))) 12))

;; (+ (lolo 5) 0 ) это 9
;; (list (+ (lolo 5) 0))) (9)
;; (apply 'pepe '(9)) => 'lolo
;; (funcall 'lolo 12) => 'pepe

(write-line "")
