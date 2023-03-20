(defun introduce ()
    (format t 
"Чука Рума - редчайшая разновидность однорядной манкалы для одного игрока.~%
Правила игры:
Есть n маленьких лунок, расположенных слева направо. Справа от лунок есть большая лунка - Дом.
В каждой из лунок есть k камней (семен). Для хода игрок берёт все камни из любой лунки и раскладывает их
по одному в каждую лунку слева направо, по направлению к Дому, не пропуская ни одной.
Цель игры состоит в том, чтобы перенести ВСЕ камни в Дом.~%
При посеве:
- если последний камень при посеве падает в пустую лунку, игра заканчивается, пасьянс не сошёлся;
- если последний камень падает в непустую лунку, игрок берёт все камни из этой лунки и продолжает посев
в том же направлении, начиная со следующей лунки;
- если камень падает в Дом, и в руке остались камни, посев продолжается с первой лунки слева.
- если посев заканчивается в Доме, игрок может начать новый посев камнями из любой маленькой лунки;~%"))

(introduce)

;; (defparameter *glob* resultLst)
(defvar resultList ())

(defun inputCountHoles ()
    (format t "~%Введите количество лунок: ")
    (finish-output)
    (let ((holes (read)))
        ;; (when (not (numberp holes))
        ;;     (format t "Количество лунок должно быть натуральным числом.")
        ;;     (finish-output)
        ;; )
        (if (> 0 holes)
            (and (format t "Количество лунок не может быть отрицательным.")
            (finish-output) 0)
            holes
        )
    )
)

(defun againInputHole ()
    (format t "Количество камней в лунке не может быть отрицательным.")
    (finish-output)
    T
)

(defun inputStone(hole)
    (format t "Введите количество камней в лунке ~A: " (+ 1 hole))
    (finish-output)
    (let ((stone (read)))
        (if (> 0 stone)
            (and (againInputHole) (inputStone hole))
            stone
        )
    )
)


(defun inputStones (tempCount needCount stones)
    (finish-output)
    (if (< tempCount needCount)
        (cons (inputStone tempCount) (inputStones (+ 1 tempCount) needCount stones))
        (nconc stones '(0))
        ;; (cons stones (cons 0 nil))
    )
)

(defun tempPrint (stones)
    (print stones)
)

(defun isWin (stones) ;; проверяем весь лист на нули, кроме последнего элемнта
    (cond 
          ((and (eql (car stones) 0) (cddr stones)) 
                (isWin (cdr stones)))
          ((not (eql (car stones) 0))  
                NIL)
          (T T)
    )
)

;; (print (isWin '(1 2 3 4)))
;; (print (isWin '(0 0 0 0)))
;; (print (isWin '(0 0 0 1)))
;; (print (isWin '(0 2 0 1)))
;; (print (isWin '(0 0 0 0 0 1)))


(defun resize (stones index)
	(if (zerop index)
		stones
		(resize (cdr stones) (- index 1))
	)
)

(defun findNotZeroHole (stones index) ;; ищем первый не 0 и чтоб это был не дом
    (cond 
        ((and (not (eql (car stones) 0)) (cdr stones))
            index)
        ((and (eql (car stones) 0) (cdr stones))
            (findNotZeroHole (cdr stones) (+ 1 index)))
        ((cdr stones)
            NIL)
    )
)

;; (write-line "not zero hole")
;; (print (findNotZeroHole '(1 2 3 4 5) 0))
;; (print (findNotZeroHole '(0 1 3 4 5) 0))  
;; (print (findNotZeroHole '(0 0 3 4 5) 0))  
;; (print (findNotZeroHole '(0 0 0 4 5) 0))  
;; (print (findNotZeroHole '(0 0 0 0 5) 0))  
;; (write-line "")

;; (write-line "not zero hole 2")
;; (print ( + 0 (findNotZeroHole (resize '(1 2 3 4 5) 0) 0)))
;; (print ( + 1 (findNotZeroHole (resize '(1 2 3 4 5) 1) 0)))  
;; (print ( + 2 (findNotZeroHole (resize '(1 2 3 4 5) 2) 0)))
;; (print ( + 3 (findNotZeroHole (resize '(1 2 3 4 5) 3) 0)))  
;; (print ( findNotZeroHole (resize '(1 2 3 4 5) 4) 0))
;; (write-line "")


;; (write-line "resize")
;; (print (resize '(1 2 3 4 5) 0))  
;; (print (resize '(1 2 3 4 5) 1))  
;; (print (resize '(1 2 3 4 5) 2))  
;; (print (resize '(1 2 3 4 5) 3))  
;; (print (resize '(1 2 3 4 5) 4))  
;; (write-line "")

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

;; (print (shift 5 '(1 3 3 4 0) 1)) ;; 1 0 4 5 1
;; (print (shift 5 '(1 2 3 4 0) 1)) ;; 1 0 4 5 0 

;; (print (shift 4 '(1 2 3 4) 1))
;; (print (shift 6 '(1 2 3 4 20 0) 4)) ;; 5 5 6 7 3 4 
;; (print (shift 6 '(1 2 3 4 21 0) 4)) ;; 5 6 6 7 3 4 
;; (print (shift 6 '(1 2 3 4 1 0) 4)) ;; 1 2 3 4 0 1
;; (print (shift 6 '(1 2 3 4 1 0) 0)) ;; 0 3 3 4 1 0


(defun whichHole (len stones i) ;; функция для расчета куда попадет сдвиг
    (let ((i  (- i 1)))
        (if ( < (+ (- (nth i stones) len) i) 0)
            (+ (nth i stones) i)
            (mod (+ (- (nth i stones) len) i) len)
        )
    )
)

;; (write-line "WHICH HOLE")
;; (print (whichHole 6 '(1 2 3 4 20 0) 4))
;; (print (whichHole 6 '(1 2 3 4 21 0) 4))
;; (print (whichHole 6 '(1 2 3 4 22 0) 4))
;; (print (whichHole 6 '(1 2 3 4 23 0) 4))
;; (print (whichHole 6 '(1 2 3 4 24 0) 4))
;; (print (whichHole 6 '(1 2 3 4 25 0) 4))
;; (print (whichHole 6 '(1 2 3 4 26 0) 4))


;; (write-line "")
;; (print (whichHole 5 '(2 2 2 2 0) 1))
;; (print (whichHole 5 '(0 3 3 2 0) 3))
;; (write-line "")


(defun mainSolve (len stones index resizeParam) 
    (let ((hole (findNotZeroHole (resize stones resizeParam) index))) ;; ищем первую непустую лунку
        (if hole
            (let ((res (dop len stones (+ resizeParam hole))))        ;; пытаемся начать с нее игру 
                (if (not res)
                    (mainSolve len stones index (+ 1 resizeParam))   
                    (setf resultList (cons (+ 1 resizeParam hole) resultList))
                )
            )
            NIL
        )
    )
)

(defun dop (len stones i)
    (let ((resPos (whichHole len stones (+ i 1)))           ;; ищем в какую лунку попали
        (new_stones (shift (length stones) stones i)))      ;; состояние лунок после хода
        (if (isWin new_stones)
            T
            (cond 
                    ((eql resPos (- len 1))   ;; дом => опять в мейн солв
                        (if (mainSolve len new_stones 0 0)
                            T
                            NIL
                        )
                    )
                    ((eql (nth resPos new_stones) 1) ;; попали в пустую и вышли
                        NIL) 
                    (T                              ;; берем камни из лунки, в которую попали и снова ходим
                        (let ((resDop (dop len new_stones resPos))) 
                            (if resDop
                                (setf resultList (cons (+ 1 resPos) resultList))
                                NIL)))
            )
        )
    )
)

(defun printResult (stones resultList)
    (when resultList
        (let ((newStones (shift (length stones) stones (- (car resultList) 1))))
                (format t "~%Ход из лунки ~A: ~A -> ~A" (car resultList) stones newStones)
                (printResult newStones (cdr resultList))
        )
    )
)

(defun play ()
    (let ((holesCount (inputCountHoles)))
        (if holesCount
            (let ((stones  (inputStones 0 holesCount ())))
                (format t "~%Начальное состояние доски: ")
                (finish-output)
                (tempPrint stones)
                (mainSolve (length stones) stones 0 0)
                (format t "~%~%Решение:")
                (if resultList
                    (printResult stones resultList)
                    (format t "~%Пасьянс не собрался :(")
                )
            )
        )
    )
)

(play)

