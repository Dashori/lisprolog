;; (setf lst1 '(a b c))
;; (setf lst2 '(d e))

(defvar lst1 '(a b c))
(defvar lst2 '(d e))

(print (cons lst1 lst2)) ;; ((a b c) d e)

(print (list lst1 lst2)) ;; ((a b c) (d e))
	
(print (append lst1 lst2)) ;; A B C D E

(print (append '(1 2 3 '(4 5)) '(6 '(7)))) ;; (1 2 3 (4 5) 6 (7))
	
(write-line "")
(write-line "")

(print (reverse '(a b c))) ;; C B A
(print (reverse '(a b (c (d)))) ) ;; ((C (D)) B A)
(print (reverse '(a))) ; A
(print (last '(a b c))) ; C
(print (last '(a))) ; A
(print (last '((a b c)))) ; (A B C)
(print (reverse ()) ) ; ()
(print (reverse '((a b c)))) ; (A B C)
(print (last '(a b (c)))) ;( (C))
(print (last ())) ; ()


(write-line "")
(write-line "")
;; Написать, по крайней мере, два варианта функции, которая возвращает последний элемент своего списка-аргумента.


(defun lastVar1 (x)
    (car (reverse x)))

(print (lastVar1 '(1 2 4)))

(defun lastVar2 (x)
    (if (null (cdr x))
        (car x)
        (lastVar2 (cdr x))
    )
)

;; (defun lastVar3 (x) ERROR
;;     (if (null (cdr x))
;;         (x)
;;         (lastVar3 (cdr x))
;;     )
;; )


(print (lastVar2 '(1 2 4)))

(write-line "")
(write-line "")

;; Написать, по крайней мере, два варианта функции, которая возвращает свой список аргумент без последнего элемента.

(defun withoutLast1 (x)
    (reverse (cdr (reverse x))))

(print (withoutLast1 '(1 2 3 4)))
(print (withoutLast1 '(1)))


(defun withoutLast2 (x)
    (if (null (cdr x))
        NIL
        (cons (car x) (withoutLast2 (cdr x)) )
    )
)

(print (withoutLast2 '(1 2 3 4)))
(print (withoutLast2 '(1)))


;; (defun swap-first-last (x)
;;     (setf myfirst (car x))
;;     (setf mylast (car (reverse x)))

;;     (setf (car x) (car mylast))
;;     (setf (car mylast) (car myfirst))
;;     ;; (x)
;; )

;; (defun swap-first-last (x)
;;     (let ((myfirst (car x)))
;;           (mylast (car (reverse x)))
;;         ;; (list myfirst cdr(x) mylast) 
         
;;     )
;; )




(defun myLast (x)
    (if (not x)
        x
        (if (not (cdr x))
            x
            (myLast (cdr x)))))


(defun changeLast (x el)
    (if (not x)
        x
        (if (not (cdr x))
            (cons el Nil)
            (cons (car x) (changeLast (cdr x) el)))))

(defun swap-first-last (x)
    (changeLast (cons (car (myLast x)) (cdr x)) (car x)))

(write-line "")
(write-line "")
(write-line "")
(print (swap-first-last '(1 2 3 4)))
(print (swap-first-last '(1 2 3 4 5)))
(print (swap-first-last '(1 5)))

(print (changeLast '(1 2 3 4) '5))

(write-line "")
(write-line "")
(write-line "")


(print (myLast '(1 2 3 4)))
(print (myLast '(4)))


(print ( eq 5 ( + 2 3)))


;; Написать простой вариант игры в кости, в котором бросаются две правильные кости.
;; Если сумма выпавших очков равна 7 или 11 — выигрыш, если выпало (1,1) или (6,6) — игрок имеет право снова бросить кости,
;; во всех остальных случаях ход переходит ко второму игроку, но запоминается сумма выпавших очков.
;; Если второй игрок не выигрывает абсолютно, то выигрывает тот игрок, у которого больше
;; очков. Результат игры и значения выпавших костей выводить на экран с помощью функции print.

(write-line "")
(write-line "")

(defun roll_dice ()
    ( setf *random-state* (make-random-state t))
    (+ (random 6) 1)
)


(print (roll_dice))

(defun firstPlayer ()
    (setf firstCube (roll_dice))
    (setf secondCube (roll_dice))
    (setf firstSum (+ firstCube secondCube))
    (setf result 0)

    (print (list 'Игрок 1 'получил (list firstCube secondCube)))

    (if (or (eq firstSum 7) (eq firstSum 11))
        (setf result 1) 

        (if (or (and (eq firstCube 6) (eq secondCube 6))
                (and (eq firstCube 1) (eq secondCube 1)))

            (and (print (list 1 'игрок 'перебрасывает))
                (firstPlayer))
                NIL
        )
    )
)

(defun secondPlayer ()
    (setf firstCube (roll_dice))
    (setf secondCube (roll_dice))
    (setf secondSum (+ firstCube secondCube))
    

)

(defun game ()
    (firstPlayer)
    (if (eql result 1)
        (print (list 1 'игрок 'победил))
        (and (print (list 'Ход 'переходит 'ко 2 'игроку))
            (secondPlayer)
        )

            )
    
    ;; (print firstSum)
            ;; (print 'A)
                ;; (print B)
                ;; (setf firstCube2 (roll_dice))
                ;; (setf secondCube2 (roll_dice))
                ;; (setf secondSum (+ firstCube secondCube))

                ;; (print (list 'Игрок 2 'набрал (list firstCube secondCube)))
        ;; )   
    ;; )
    ;; (print 'firstCube)
    ;; 1 
)

;; (print (game))
(game)


;; таблица из 4х пар (страна . столица)

(defun countryByCapital (table capital)
    (if (equal capital (cdr (car table)))
        (car (car table))    
        (countryByCapital (cdr table) capital)
    )
)

(defun capitalByCountry (table country)
    (if (equal country (car (car table)))
        (cdr (car table))    
        (capitalByCountry (cdr table) country)
    )
)

(defvar myTable (list   (cons 'a 'b)
                        (cons 'c 'd)
                        (cons 'e 'f)
                        (cons 'g 'h)))


(print (countryByCapital myTable 'f))
(print (capitalByCountry myTable 'e))


(defun mulFirstNumbers (lst number)
    (cons (* number (car lst)) (cdr lst)))

(print (mulFirstNumbers '(1 2 3) 5))
;; (mulFirst '(1 2 3) '3)

(defun mulFirstAny (lst number)
    (cond ((null lst)   lst)

          ((numberp (car lst))
                    (cons (* (car lst) number) (cdr lst)))

          (T (cons (car lst) 
                   (mulFirstAny (cdr lst) number)))))

(print (mulFirstAny '('a 2 3) 5))
(print (mulFirstAny '('('a 1) 2 3) 5))