;; Написать функцию, которая принимает целое число 
;; и возвращает первое четное число, не меньшее аргумента.


(defun f-to-c (temp)
    (* 5/9 (- temp 32.0)))


(defun firstOdd(num)
    (if (evenp num)
        num
        (+ num 1)
    )
)

(print (firstOdd 5))
(print (firstOdd 6))

(print (firstOdd -1))
(print (firstOdd -2))


;;  Написать функцию, которая принимает число и возвращает число того же знака, 
;;  но с модулем на 1 больше модуля аргумента.


(defun oneMore (num)
    (if (< num 0)
        (- num 1)
        (+ num 1)
    )
)

(print (oneMore 4))
(print (oneMore -4))
(print (oneMore 0))



;; Написать функцию, которая принимает два числа
;; и возвращает список из этих чисел, расположенный по возрастанию.


(defun sortList (x y)
    (if (< x y)
        (list x y)
        (list y x)
    )
)

(print (sortList 1 2))
(print (sortList -1 -2))
(print (sortList -3 -3))


;; Написать функцию, которая принимает три числа
;; и возвращает Т только тогда, когда первое число 
;; расположено между вторым и третьим.

(defun between (x y z)
    (if (>= x y)
        (<= x z)
        (>= x z)
    )
)

(print "between")
(print (between 1 2 3))     ;; NIL
(print (between -1 2 -3))   ;; T
(print (between -1 -2 -3))  ;; NIL
(print (between 10 5 -3))   ;; NIL
(print (between 2 1 3))     ;;T


;; 5. Каков результат вычисления следующих выражений?
(and 'fee 'fie 'foe)
;; (or nil 'fie 'foe)
;; (and (equal 'abc 'abc) 'yes)
;; (or 'fee 'fie 'foe)
;; (and nil 'fie 'foe)
;; (or (equal 'abc 'abc) 'yes)

;; AND если находит NIL, то бан, а иначе выводит последний T
;; OR ищет первый Т

(print (and 'fee 'fie 'foe)) ;; last => foe
(print (or nil 'fie 'foe)) ;; before T => fie

(print (or 'fee 'fie 'foe)) ;; FEE

(print (and (equal 'abc 'abc) 'yes)) ;; YES 

(print (and nil 'fie 'foe)) ;; NIL

(print (and 'fie  nil 'foe)) ;; NIL

(print (or (equal 'abc 'abc) 'yes)) ;; T



(let ((x 1) (y 2))
    (print (+ x y )))

(let ((x 1))
    (print x))

;; (defun ask-number ()
;;     (format t "Please enter a number. ")
;;     ;; (read)
;;     (let ((val (read)))
;;         (if (numberp val)   
;;            val
;;            (ask-number)))
;; )

;; (ask-number)

;; Предикат -- функция возвр Т или НИЛ

;; listp - T if list
;; (listp '(a b c))

;; numberp - T if number 

;; not - T if NIL

;; AND if all arguments T => last


;; Написать предикат, который принимает два числа-аргумента и возвращает Т, если первое число не меньше второго.

(defun my-compare (x y)
    (if (>= x y)
        T 
        NIL)
)

(PRINT "MY COMPARE")

(print (my-compare 100 5))

(print (my-compare 5 10))

(print (my-compare 4 6))


;; Написать функцию, которая принимает три числа
;; и возвращает Т только тогда, когда первое число 
;; расположено между вторым и третьим.

;; 4 задача только IF - solve
;; только COND

(defun between-cond (x y z)
    (cond ((>= x y) (<= x z))
          ((< x y) (> x z))
    )
)

(print "between-cond")
(print (between-cond 1 2 3))     ;; NIL
(print (between-cond -1 2 -3))   ;; T
(print (between-cond -1 -2 -3))  ;; NIL
(print (between-cond 10 5 -3))   ;; NIL
(print (between-cond 2 1 3))     ;; T


;;  только AND/OR.

(defun between-and (x y z)
    (or (and (>= x y) (<= x z)) 
        (and (< x y) (> x z))
    )
)

(print "between-and")
(print (between-and 1 2 3))     ;; NIL
(print (between-and -1 2 -3))   ;; T
(print (between-and -1 -2 -3))  ;; NIL
(print (between-and 10 5 -3))   ;; NIL
(print (between-and 2 1 3))     ;; T


(defun how_alike (x y)
(cond ((or (= x y) (equal x y)) 'the_same)
    ((and (oddp x) (oddp y)) 'both_odd) 
    ((and (evenp x) (evenp y)) 'both_even)
    (t 'difference)))



(print "how_alike lecture")
(print (how_alike 1 2))
(print (how_alike 2 4))
(print (how_alike 5 9))
(print (how_alike 3 3))
(print (how_alike (+ 1 2) 3))


;; Только IF, AND/OR
(defun how-alike-if (x y)
    (if (= x y)
        'the_same
        (if (equal x y)
            'the_same
            (if (oddp x)
                (if (oddp y)
                    'both_odd
                    'difference)
                (if (evenp y)
                    'both_even
                    'difference)
            )      
        )
    )
)


(print "how-alike-if ")
(print (how-alike-if 1 2))
(print (how-alike-if 2 4))
(print (how-alike-if 5 9))
(print (how-alike-if 3 3))
(print (how-alike-if (+ 1 2) 3))


(defun how-alike-and (x y)
    (or 
        (and (or (= x y) (equal x y)) 'the_same)
        (and (and (evenp x) (evenp y)) 'both_even)
        (and (and (oddp x) (oddp y)) 'both_odd)
        (and T 'difference)
    )
)

(print "how-alike-and ")
(print (how-alike-and 1 2))
(print (how-alike-and 2 4))
(print (how-alike-and 5 9))
(print (how-alike-and 3 3))
(print (how-alike-and (+ 1 2) 3))
