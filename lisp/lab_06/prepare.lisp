;; Написать хвостовую рекурсивную функцию my-reverse, которая развернет верхний уровень своего списка-аргумента lst.

(defun my-reverse (lst &optional (buf-lst NIL))
    (cond ((null lst) buf-lst)
          (T (my-reverse (cdr lst) (cons (car lst) buf-lst)))))


(write-line "1 task")

(print (my-reverse '(a b c (d e) f)))
(print (my-reverse '(a '(b (d f)) c (d e) f)))

(write-line "NOT NULL LIST")
;; Написать функцию, которая возвращает первый элемент списка - аргумента, который сам является непустым списком.

(defun not-null-list (lst)
    (cond ((not lst) NIL)
        ((and (listp (car lst)) ((caar lst))) (car lst))
        (T (not-null-list (cdr lst)))))

(print (not-null-list '(1 aa () n (1 3))))


;; Напишите рекурсивную функцию, которая умножает на заданное число-аргумент 
;; все числа из заданного списка-аргумента, когда
;; a) все элементы списка --- числа,
;; 6) элементы списка -- любые объекты.

(defun append-elem (lst elem &optional (before-lst Nil))
    (cond ((and (null lst) 
                (null before-lst)) (cons elem NIL))
          ((null lst) 
                (my-reverse (cons elem before-lst)))
          (T 
                (append-elem (cdr lst) elem 
                            (cons (car lst) before-lst)))))

(defun all-numbers (num lst &optional (res-lst NIL))
     (cond ((null lst) res-lst)
           (T (all-numbers num (cdr lst) 
                (append-elem res-lst (* (car lst) num))))))

(print (all-numbers 2 '(1 5.9 6 -12)))
(print (append-elem '(1 2 3 4) -5))

(defun not-all-numbers (num lst &optional (res-lst NIL))
     (cond ((null lst) res-lst)
           ((numberp (car lst)) 
                (not-all-numbers num (cdr lst) 
                    (append-elem res-lst (* num (car lst)))))
           ((listp (car lst)) 
                (not-all-numbers num (cdr lst) 
                    (append-elem res-lst (not-all-numbers num (car lst)))))
           (T   (not-all-numbers num (cdr lst)
                    (append-elem res-lst (car lst))))))

(print (not-all-numbers 2 '(1 vja (5 -1 (0)) haf 9)))

;; Напишите функцию, select-between, которая из списка-аргумента, содержащего 
;; только числа, выбирает только те, которые расположены  между двумя указанными 
;; границами-аргументами и возвращает их в виде списка 

;; (defun select-between (num1 num2 lst &optional (res-lst NIL))
;;      (cond  ((null lst) res-lst)
;;             ((< num1 (car lst) num2) 
;;                 (select-between num1 num2 (cdr lst) 
;;                 (append-elem res-lst (car lst))))
;;             (T (select-between num1 num2 (cdr lst) res-lst))))

;; (print (select-between -3 10 '(8 12 3 9 1.0 -6)))


;; Написать рекурсивную версию (с именем rec-add) вычисления суммы чисел заданного списка:
;; а) одноуровнего смешанного, б) структурированного.

;; (defun rec-add-a (lst &optional (sum 0))
;;     (cond ((null lst) sum)
;;         ((numberp (car lst)) (rec-add-a (cdr lst) (+ sum (car lst))))
;;         (T (rec-add-a (cdr lst) sum))))

;; (print (rec-add-a '(1 v 4 0)))

;; (defun rec-add-b (lst &optional (sum 0))
;;     (cond ((null lst) sum)
;;         ((numberp (car lst)) (rec-add-b (cdr lst) (+ sum (car lst))))
;;         ((listp (car lst)) (rec-add-b (cdr lst) (+ sum (rec-add-b (car lst)))))
;;         (T (rec-add-b (cdr lst) sum))))

;; (print (rec-add-b '(1 (b 19 (0 a)) (1.24) l)))