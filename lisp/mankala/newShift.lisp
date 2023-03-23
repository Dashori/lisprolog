;; (defun plusAll (stones number)
;;    (cond    ((not stones) 
;;                 NIL)
;;             (T 
;;                 (cons (+ (car stones) number)
;;             (plusAll 
;;                 (cdr stones) number)))
;;     )
;; )

;; (write-line "")
;; (write-line "plus all")
;; (print (plusAll '(1 2 3 4 5) 5 ))
;; (print (plusAll '(0 -1 3 54 5) 1))
;; (write-line "")


;; (defun plusToN (stones number n)
;;     (if (or (not stones) (<= n 0))
;;         stones
;;         (cons (+ (car stones) number)
;;             (plusToN (cdr stones) number (- n 1)))
;;     )
;; )


;; (write-line "")
;; (write-line "plus to N")
;; (print (plusToN '(1 1 1 1 1) 5 1))
;; (print (plusToN '(0 0 0 0 0) 1 2))
;; (print (plusToN '(0 0 0 0 0) 1 1))
;; (print (plusToN '(0 0 0 0 0) 1 0))
;; (write-line "")



;; (print (plusInterval '(1 1 1 1 1) 3 2 4 0))
;; (print (plusInterval '(1 1 1 1 1) 3 2 5 0))
;; (print (plusInterval '(1 1 1 1 1) 3 1 2 0))
;; (print (plusInterval '(1 1 1 1 1) 3 0 1 0))
;; (print (plusInterval '(1 1 1 1 1) 3 1 1 0))
;; (print (plusInterval '(1 1 1 1 1) 3 0 0 0))

;; (print (plusInterval '(5 5 6 7 23 3) 1 5 6 0))
 



;; (defun add-to-list-in-interval (list number start end)
;;   (if (or (null list) (= start end))
;;       list
;;       (cons (+ (car list) number)
;;             (add-to-list-in-interval (cdr list) number (1+ start) end))))



; Пример использования функции
;; (write-line "")
;; (write-line "plus interval")
;; ;; (print (plusInterval '(1 1 1 1 1) 5 1 2))
;; ;; (print (plusInterval '(1 1 1 1 1) 5 0 3))
;; (write-line "plus interval")
;; ; Результат: (1 7 8 9 5)



(defun plusInterval (stones num start end index)
  (if (not stones)
        NIL
        (if (<= index end)
            (if (>= index start)
                (cons (+ (car stones) num) (plusInterval (cdr stones) num start end (+ index 1)))
                (cons (car stones) (plusInterval (cdr stones) num start end (+ index 1)))
            )
            (cons (car stones) (plusInterval (cdr stones) num start end index))
        )
    )
)


(defun zeroElement (stones index)
    (if (null stones)
        nil
        (if (eql index 0)
            (cons 0 
                    (cdr stones))
            (cons (car stones) 
                  (zeroElement (cdr stones) (- index 1)))
        )
    )
)

;; (write-line "")
;; (write-line "")
;; (write-line "zerolem")
;; (print (zeroElement '(1 2 3 4 5) 4))
;; (write-line "")
;; (write-line "")


;; заполняем конец 
(defun dopShiftEnd (len stones index)
    (let  ((val (nth index stones))
            (index (+ index 1))
            (stones (zeroElement stones index)))

        (if (< index len) ;; проверяем что не последняя ячейка
            (if (> val (- len index)) ;; то есть у нас есть ресурсы чтоб заполнить 
                (plusInterval stones 1 index len 0)   ;; прибавляем начиная с pos до end
                (plusInterval stones 1 index (- (+ val index) 1) 0) ;; прибавляем сколько можем
            )
        )
    )
)

;; добавляем остатки в начало
(defun dopShiftStart (len stones index val)
    (let   ((index (+ 1 index)))
        (if (eql (mod (- val (- len index)) len) 0)
            stones
            (plusInterval stones 1 0  (mod (- val (- len index)) len) 0)
        )
    )
)

(defun shift2 (len stones index)  ;; функция для сдвига2
    (let    
            ((val (nth index stones))
            (stones (dopShiftEnd len stones index)) ;; прибавляем конец
            (index (+ index 1)))

        (if (> (- val (- len index)) 0)
            (progn 
                (let  ((stones (dopShiftStart len stones index val))) ;; прибавляем начало
                ;; прибавляем основную часть
                    (if (< (floor (- val (- len index)) len) 0)
                        stones
                        (plusInterval stones (floor (- val (- len index)) len) 0 len 0) ;; плюсуем все лунки
                    )
                )
            )
            stones
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


(defun copyList (stones)
    (if (atom stones)
        stones
        (cons (car stones) (copyList (cdr stones)))
    )
)

(defun shiftOld (len stones index)  ;; функция для сдвига 
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


(write-line "new shift")
(print (shift2 4 '(1 2 3 4) 1))      ;; 1 0 4 5
;; (print (shiftOld 4 '(1 2 3 4) 1))      ;; 1 0 4 5


(print (shift2 6 '(1 2 3 4 20 0) 4)) ;; 5 5 6 7 3 4 
;; (print (shiftOld 6 '(1 2 3 4 20 0) 4)) ;; 5 5 6 7 3 4 

(print (shift2 6 '(1 2 3 4 21 0) 4)) ;; 5 6 6 7 3 4 
(print (shift2 6 '(1 2 3 4 22 0) 4)) ;; 5 6 7 7 3 4 
(print (shift2 6 '(1 2 3 4 23 0) 4)) ;; 5 6 7 8 3 4 
(print (shift2 6 '(1 2 3 4 24 0) 4)) ;; 5 6 7 8 4 4 
(print (shift2 6 '(1 2 3 4 25 0) 4)) ;; 5 6 7 8 4 5 
(print (shift2 6 '(1 2 3 4 26 0) 4)) ;; 6 6 7 8 4 5 
(print (shift2 6 '(0 1 0 0 0 0) 1)) ;; 0 0 1 0 0 0





