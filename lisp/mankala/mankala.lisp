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
    (format t "Введите количество лунок: ")
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
    (setf resultList (cons 1 resultList))
    T
)

(defun inputStone(hole)
    (format t "Введите количество камней в ~A лунке: " (+ 1 hole))
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

(print (isWin '(1 2 3 4)))
(print (isWin '(0 0 0 0)))
(print (isWin '(0 0 0 1)))
(print (isWin '(0 2 0 1)))
(print (isWin '(0 0 0 0 0 1)))

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

(write-line "not zero hole")
(print (findNotZeroHole '(1 2 3 4 5) 0))
(print (findNotZeroHole '(0 1 3 4 5) 0))  
(print (findNotZeroHole '(0 0 3 4 5) 0))  
(print (findNotZeroHole '(0 0 0 4 5) 0))  
(print (findNotZeroHole '(0 0 0 0 5) 0))  
(write-line "")

(defun shift (size lst idx)  ;; функция для сдвига 
  (let ((val (nth idx lst))
        (newlst (copy-list lst))
        (i (+ idx 1)))
    (setf (nth idx newlst) 0)
    (dotimes (j val)
    ;;   (print newlst)
      (setf (nth i newlst)
            (+ 1 (nth i newlst)))
      (setf i (mod (+ i 1) size)))
    newlst
    )
)

(defun whichHole (len stones i) ;; функция для расчета куда попадет сдвиг
    (let ((i  (- i 1)))
        ;; (print (nth i stones))
        (if ( < (+ (- (nth i stones) len) i) 0)
            (+ (nth i stones) i)
            (mod (+ (- (nth i stones) len) i) len)
        )
    )
)

(write-line "WHICH HOLE")
(print (whichHole 6 '(1 2 3 4 20 0) 5))
(print (whichHole 6 '(1 2 3 4 21 0) 5))
(print (whichHole 6 '(1 2 3 4 22 0) 5))
(print (whichHole 6 '(1 2 3 4 23 0) 5))
(print (whichHole 6 '(1 2 3 4 24 0) 5))
(print (whichHole 6 '(1 2 3 4 25 0) 5))
(print (whichHole 6 '(1 2 3 4 26 0) 5))

(write-line "")


;; (defun dop (len stones i)
;;     (let ((resPos )))

;; )

(defun mainSolve (len stones)
    (let ((hole (findNotZeroHole stones 0)))
        (if hole
            ;; (let (res (dop len stones hole))
                (print hole)
            ;; )
            
            (print "loh")
        )
    )
)

;; (defun solve (stones temp stonesBegin)
;;     ()
;; )

(defun play ()
    (let ((holesCount (inputCountHoles)))
        (if holesCount
            (let ((stones  (inputStones 0 holesCount ())))
                ;; (cons stones '(0))
                (tempPrint stones)
                (mainSolve (length stones) stones)
            )
        )
    )

    (print resultList)
)

;; (play)

(print (shift 5 '(1 3 3 4 0) 1))
(print (shift 5 '(1 2 3 4 0) 1))
(print (shift 4 '(1 2 3 4) 1))
(print (shift 6 '(1 2 3 4 20 0) 4)) ;; 5 5 6 7 3 4 
(print (shift 6 '(1 2 3 4 21 0) 4)) ;; 5 6 6 7 3 4 
(print (shift 6 '(1 2 3 4 1 0) 4)) ;; 1 2 3 4 0 1
(print (shift 6 '(1 2 3 4 1 0) 0)) ;; 0 3 3 4 1 0

;; (print (length '(1 2 3 4 )))

;; (print (cons '(1 2 3 4 5) '(0 nil) ))
;; (print (cons '0 '(1 2 3 4 5) ))
