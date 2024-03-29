;; НА ЛИСТОЧКЕ ПОД НАДЗОРОМ написать функцию а, которая принимает три списка вида  '(1 2 3) и число k
;; Например списки  '(1 2 3) '(4 5 6 ) '(7 8 9) и k=2 

;; Если все последние элементы списков больше k, то вернуть ( (1 . 2) (4 . 5) (7 . 8)), иначе (NIL)

(defun myfunc (a b c k)
    (if (and ( > (car (cdr (cdr a))) k)
             ( > (car (cdr (cdr b))) k)
             ( > (car (cdr (cdr c))) k))

        (list   (cons (car a) (car (cdr a)))
                (cons (car b) (car (cdr b)))
                (cons (car c) (car (cdr c))))

        ()
    )
)

(print (myfunc '(1 2 3) '(4 5 6) '(7 8 9) '2))

(print (myfunc '(1 2 3) '(4 5 6) '(7 8 9) '7))