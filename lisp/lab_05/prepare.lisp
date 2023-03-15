;; Используя функционалы:
;; 1. Напишите функцию, которая уменьшает на 10 все числа из списка-аргумента этой
;; функции, проходя по верхнему уровню списковых ячеек. ( * Список смешанный структурированный)

(defun all-num-minus-10 (lst) 
     (mapcar #'(lambda (x)
         (cond ((null x) Nil)
               ((numberp x) (- x 10))
               ((listp x) (all-num-minus-10 x))
               (t x))) lst))

(print (all-num-minus-10 '(10 (a b 20) 30)))


;; Написать функцию которая получает как аргумент список чисел, а возвращает список квадратов этих чисел в том же порядке.

(defun sqaure-numbers (lst)
    (mapcar #'(lambda (x)
                (* x x))
                lst)
)

(print (sqaure-numbers '(-1 2 -3 4)))


;; Напишите функцию, которая умножает на заданное число-аргумент все числа из заданного списка-аргумента, когда
;; a) все элементы списка --- числа,
;; б) элементы списка -- любые объекты.

(defun all-numbers (lst num)
    (mapcar #'(lambda (x)
                (* x num))
                lst))


(print (all-numbers '(-1 2 -3 4) 5))


(defun not-all-numbers (lst num)
    (mapcar #'(lambda (x)
                (cond ((null x) NIL)
                    ((numberp x) (* x num))
                    ((listp x) (not-all-numbers x num))
                    (T x)))
                lst
    )
)


(print (not-all-numbers '(-1 2 -3 4) 5))
(print (not-all-numbers '(-1 'a -3 '('b '('c 4))) 5))

;; Написать функцию, которая по своему списку-аргументу lst определяет 
;; является ли он палиндромом (то есть равны ли lst и (reverse lst)), для одноуровнего смешанного списка.


 (defun my-reverse (lst &optional (buf-lst NIL))
     (cond 
        ((null lst) buf-lst)
        (T (my-reverse (cdr lst) (cons (car lst) buf-lst)))))


(defun reverse1 (lst)
    (when lst
        (append (reverse1 (cdr lst))
                (list (car lst)))))

; (print (my-reverse '(a b c (d e) f)))

(defun palyndrom-lst (lst) 
    (reduce #'(lambda (x y) (and x y))
        (mapcar #'equal lst (reverse1 lst))))

(print (palyndrom-lst '(a b c (d e) c b a)))
(print (palyndrom-lst '(a)))
(print (palyndrom-lst '(1 2 3)))



;; Используя функционалы, написать предикат set-equal, который возвращает t, 
;; если два его множества-аргумента (одноуровневые списки) содержат одни и те же элементы, 
;; порядок которых не имеет значения.



(defun set-size (set1 &optional (size 0))
    (cond ((null set1) size)
    (T (set-size (cdr set1) (+ size 1)) )))

(print (set-size '(1 2 3)))


(defun set-include (set1 set2)
    (reduce #'(lambda (x y) (and x y))
        (mapcar #'(lambda (x) 
                    (reduce #'(lambda (x y) (or x y)) 
                    x)) 

                (mapcar #'(lambda (elem) 
                        (maplist #'(lambda (x) 
                            (equalp (car x) elem))
                            set2))
                    set1)
        )
    )
)

(print (set-include '(a b c) '(a d e c b))) ;; T
(print (set-include '(a b c e) '(a c b))) ;; NIL

(defun set-equal (set1 set2)
     (and (= (set-size set1) (set-size set2))
     (set-include set1 set2) (set-include set2 set1)))

(print (set-equal '(a b d (c e)) '((c e) d a b)))
(print (set-equal '(a b d (c e)) '((c e) d a b)))

(print (mapcar #'list '(1 2 3) '('a 'b 'c)))
(print (maplist #'list '(1 2 3) '('a 'b 'c)))


(write-line "")
(write-line "")


(defun get-between (num1 num2 lst)
     (cond ((null lst) NIL)
        (T (reduce #'(lambda (x y)
            (if (< num1 y num2) 
                (cons y x) 
                x)) 
            lst :initial-value NIL))))

(print (get-between 3 10 '(8 12 3 9 1.0)))

(print (get-between 1 10 '(-8 -12 3.4 9 1.0)))
(defun insert-elem (lst elem &optional (before-lst Nil))
     (cond 
           ((and (null lst) (not (null before-lst)))    
                    (append before-lst (cons elem Nil)))
           ((null lst) (cons elem Nil))
           ((< elem (car lst)) 
                    (append before-lst (cons elem Nil) lst))
           (T (insert-elem (cdr lst) elem 
                    (append before-lst (cons (car lst) Nil))))))

(defun sort-lst (lst)
     (cond 
            ((null lst) Nil)
            (T (reduce #'(lambda (sorted x)
                         (insert-elem sorted x))
                    lst :initial-value Nil))))

(defun select-between (num1 num2 lst)
     (cond 
            ((null lst) Nil)
            ((< num2 num1) (sort-lst (get-between num2 num1 lst)))
            (T (sort-lst (get-between num1 num2 lst)))))
           
(print (select-between 3 9.184 '(0 8 7.1 3 9 1.0)))


(write-line "")
(write-line "")

(defun decart (lst1 lst2)
    (mapcar #'(lambda (x)
        (mapcar #'(lambda (y) (list x y))
                 lst2))
        lst1))


(print (decart '(a b (c d)) '((f) e k)))



(write-line "")
(write-line "")

(defun len-list (lst &optional (cnt 0))
    (cond ((null lst) cnt)
          ((atom (car lst)) (len-list (cdr lst) (+ cnt 1)))
          ((listp (car lst)) (len-list (cdr lst) (+ cnt (len-list (car lst)))))
          (T (len-list (cdr lst) cnt))))

(defun set-size (set1 &optional (size 0))
    (cond ((null set1) size)
    (T (set-size (cdr set1) (+ size 1)) )))

(defun len-list-of-list (lst)
    (cond ((null lst) 0)
          (T (reduce #'+ (mapcar #'set-size lst)))))

(print (len-list-of-list '((a b) (c d) (e f d))))
