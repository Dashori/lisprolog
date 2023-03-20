(defun copyList (stones)
    (if (atom stones)
        stones
        (cons (car stones) (copyList (cdr stones)))
    )
)

(defun shift (len stones index)  ;; функция для сдвига 
  (let ((val (nth index stones))
        (newlist (copyList stones))
        (i (+ index 1)))
    (setf (nth index newlist) 0)
    (dotimes (j val)
      (setf (nth i newlist)
            (+ 1 (nth i newlist)))
      (setf i (mod (+ i 1) len)))
    newlist
    )
)

(defun resize (stones index)
	(if (zerop index)
		stones
		(resize (cdr stones) (- index 1))
	)
)


(defun plusAll (stones number)
   (cond    ((not stones) 
                NIL)
            (T 
                (cons (+ (car stones) number)
            (plusAll 
                (cdr stones) number)))
    )
)

(write-line "")
(write-line "plus all")
(print (plusAll '(1 2 3 4 5) 5 ))
(print (plusAll '(0 -1 3 54 5) 1))
(write-line "")

(defun plusFromtN (stones number n)
    (cond   ((not stones) 
                    NIL)
            ((<= n 0)  
                    (cons (+ (car stones) number)
                           (plusFromtN (cdr stones) number 0)))
            (T  
                (cons (car stones)
                  (plusFromtN (cdr stones) number (- n 1)))
            )             
    )              
)

(write-line "")
(write-line "plus all from")
(print (plusFromtN '(1 1 1 1 1) 5 1))
(print (plusFromtN '(0 0 0 0 0) 1 2))
(print (plusFromtN '(0 0 0 0 0) 1 0))
(write-line "")


(defun plusToN (stones number n)
    (if (or (not stones) (<= n 0))
        stones
        (cons (+ (car stones) number)
            (plusToN (cdr stones) number (- n 1)))
    )
)


(write-line "")
(write-line "plus to N")
(print (plusToN '(1 1 1 1 1) 5 1))
(print (plusToN '(0 0 0 0 0) 1 2))
(print (plusToN '(0 0 0 0 0) 1 1))
(print (plusToN '(0 0 0 0 0) 1 0))
(write-line "")


(defun plusInterval2 (stones number start end)
    (if (or (null stones) (eql start end))
            stones
            (cons (+ (car stones) number)
                (plusInterval (cdr stones) number (+ start 1) end ))
    )
)

(defun plusInterval (stones number start end indexStart)
    (cond  
            ((not (eql start indexStart))
                (plusInterval (cdr stones) number start end (+ 1 indexStart)))
            ((or (null stones) (eql start end))
                stones)
            (T
                (cons (+ (car stones) number)
                    (plusInterval (cdr stones) number (+ start 1) end indexStart))
            )
    )
)

;; (defun plusInterval (lst num start end)
;;   (if (null lst)
;;       nil
;;     (if (and (>= (car lst) start) (<= (car lst) end))
;;         (cons (+ (car lst) num) (plusInterval (cdr lst) num start end))
;;       (cons (car lst) (plusInterval (cdr lst) num start end)))))

(defun plusInterval (lst num start end index)
  (if (not lst)
        NIL
        (if (<= index end)
            (if (>= index start)
                (cons (+ (car lst) num) (plusInterval (cdr lst) num start end (+ index 1)))
                (cons (car lst) (plusInterval (cdr lst) num start end (+ index 1)))
            )
            (cons (car lst) (plusInterval (cdr lst) num start end index))
        )
    )
)


;; Пример использования:

(print (plusInterval '(1 1 1 1 1) 3 2 4 0))
(print (plusInterval '(1 1 1 1 1) 3 2 5 0))
(print (plusInterval '(1 1 1 1 1) 3 1 2 0))
(print (plusInterval '(1 1 1 1 1) 3 0 1 0))
(print (plusInterval '(1 1 1 1 1) 3 1 1 0))
(print (plusInterval '(1 1 1 1 1) 3 0 0 0))

(print (plusInterval '(5 5 6 7 23 3) 1 5 6 0))
 



;; (defun add-to-list-in-interval (list number start end)
;;   (if (or (null list) (= start end))
;;       list
;;       (cons (+ (car list) number)
;;             (add-to-list-in-interval (cdr list) number (1+ start) end))))



; Пример использования функции
(write-line "")
(write-line "plus interval")
;; (print (plusInterval '(1 1 1 1 1) 5 1 2))
;; (print (plusInterval '(1 1 1 1 1) 5 0 3))
(write-line "plus interval")
; Результат: (1 7 8 9 5)


(defun whichHole (len stones i) ;; функция для расчета куда попадет сдвиг
    (let ((i  (- i 1)))
        (if ( < (+ (- (nth i stones) len) i) 0)
            (+ (nth i stones) i)
            (mod (+ (- (nth i stones) len) i) len)
        )
    )
)

(defun shift2 (len stones index)  ;; функция для сдвига2
    (let ((val (nth index stones))
        (index (+ index 1)))

        ;; прибавляем начиная с pos до end
        (format t "~%Val: ~A len: ~A index: ~A ~%" val len index)
        (if (< index len) ;; проверяем что не последняя ячейка
            ;; (format t "конец нужно заполнить ~A" (- len index))
            (if (> val (- len index)) ;;  то есть у нас есть ресурсы чтоб заполнить 
                (setf stones (plusInterval stones 1 index len 0))
                ;; (print "AAA")
            )
        )

        (print stones)
        ;; (if (eql (mod (- val (- len index)) len) 0)
        ;;     (print "нечего модить")
        ;;     (progn 
        ;;     (format t "есть что модить: ~A" (mod (- val (- len index)) len))
        ;;         ;; (setf stones (plusFromtN stones 1 ))
        ;;     )
        ;; )

        ;; добавляем остатки в начало
        (format t "~%Val: ~A len: ~A index: ~A " val len index)
        (if (eql (mod (- val (- len index)) len) 0)
            (print "начало нечего модить")
            (progn 
            (format t "начало есть что модить: ~A" (mod (- val (- len index)) len))
                (setf stones (plusToN stones 1 (mod (- val (- len index)) len)))
            )
        )

        ;; прибавляем основную часть
        (if (< (floor (- val (- len index)) len ) 0)
            (print (floor (- val (- len index)) len ))
            (plusAll stones (floor (- val (- len index)) len )) ;; плюсуем все лунки
        )

    )
)

;; (print (plusAll '(1 2 3 4) 6))

;; (write-line "old shift")
;; (print (shift 4 '(1 2 3 4) 1))      ;; 1 0 4 5
;; (print (shift 6 '(1 2 3 4 20 0) 4)) ;; 5 5 6 7 3 4 
;; (print (shift 6 '(1 2 3 4 21 0) 4)) ;; 5 6 6 7 3 4 
;; (print (shift 6 '(1 2 3 4 1 0) 4)) ;; 1 2 3 4 0 1
;; (print (shift 6 '(1 2 3 4 1 0) 0)) ;; 0 3 3 4 1 0

(write-line "new shift")
;; (print (shift2 4 '(1 2 3 4) 1))      ;; 1 0 4 5
(print (shift2 6 '(1 2 3 4 20 0) 4)) ;; 5 5 6 7 3 4 
(print (shift2 6 '(1 2 3 4 21 0) 4)) ;; 5 6 6 7 3 4 
(print (shift2 6 '(1 2 3 4 22 0) 4)) ;; 5 6 6 7 3 4 
(print (shift2 6 '(1 2 3 4 23 0) 4)) ;; 5 6 6 7 3 4 
(print (shift2 6 '(1 2 3 4 24 0) 4)) ;; 5 6 6 7 3 4 
;; (print (shift2 6 '(1 2 3 4 25 0) 4)) ;; 5 6 6 7 3 4 
;; (print (shift2 6 '(1 2 3 4 1 0) 4)) ;; 1 2 3 4 0 1
;; (print (shift 6 '(1 2 3 4 1 0) 0)) ;; 0 3 3 4 1 0



