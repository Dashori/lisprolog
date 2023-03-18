;; (defun play1 ()
;;   (format t "Welcome to Mancala!~%")
;; )


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
        stones
    )
)


(defun play ()
    (let ((holesCount (inputCountHoles)))
        (if holesCount
            (let ((stones  (inputStones 0 holesCount ())))
                 (print stones)
            )
        )
    )

)


(play)

;; (print ((format t "Количество камней в лунке не может быть отрицательным.")))