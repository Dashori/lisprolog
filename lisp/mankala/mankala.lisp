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

(defvar resultList ())

(defun inputCountHoles ()
    (format t "~%Введите количество лунок: ")
    (finish-output)
    (let ((holes (read)))
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

(defun plusInterval (stones num start end index) ;; + num ко всем элементам списка в интервале start end
  (if (not stones)
        NIL
        (if (<= index end)
            (if (>= index start)
                (cons (+ (car stones) num) 
                        (plusInterval (cdr stones) num start end (+ index 1)))
                (cons (car stones) 
                        (plusInterval (cdr stones) num start end (+ index 1)))
            )
            (cons (car stones) 
                    (plusInterval (cdr stones) num start end index))
        )
    )
)

(defun zeroElement (stones index) ;; зануляем элемент по индексу
    (if (not stones)
        NIL
        (if (eql index 0)
            (cons 0 
                    (cdr stones))
            (cons (car stones) 
                  (zeroElement (cdr stones) (- index 1)))
        )
    )
)

;; заполняем конец 
(defun dopShiftEnd (len stones index)
    (let  ((val (nth index stones))
            (index (+ index 1))
            (stones (zeroElement stones index)))

        (if (<= index len) ;; проверяем что не последняя ячейка
            (if (> val (- len index)) ;; то есть у нас есть ресурсы чтоб заполнить 
                (plusInterval stones 1 index len 0)   ;; прибавляем начиная с pos до end
                (plusInterval stones 1 index (- (+ val index) 1) 0) ;; прибавляем сколько можем
            )
        )
    )
)

;; добавляем остатки в начало
(defun dopShiftStart (len stones index val)
    (if (eql (mod (- val (- len index)) len) 0)
        stones
        (plusInterval stones 1 0  (- (mod (- val (- len index)) len) 1) 0)
    )
)

(defun shift (len stones index)  ;; функция для сдвига2
    (let    
            ((val (nth index stones))
            (stones (dopShiftEnd len stones index)) ;; прибавляем конец
            (index (+ index 1)))

        (if (> (- val (- len index)) 0)
                (let  ((stones (dopShiftStart len stones index val))) ;; прибавляем начало
                ;; прибавляем основную часть
                    (if (< (floor (- val (- len index)) len) 0)
                        stones
                        (plusInterval stones (floor (- val (- len index)) len) 0 len 0) ;; плюсуем все лунки
                    )
                )
            stones
        )
    )
)

(defun whichHole (len stones i) ;; функция для расчета куда попадет сдвиг
    (let ((i  (- i 1)))
        (if ( < (+ (- (nth i stones) len) i) 0)
            (+ (nth i stones) i)
            (mod (+ (- (nth i stones) len) i) len)
        )
    )
)


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
    (introduce)
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

;; (play)

