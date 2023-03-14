(defun roll_dice ()
    ( setf *random-state* (make-random-state t))
    (+ (random 6) 1))

(defun check_continue_game (result) 
    (not (or (= result 7) (= result 11))) )

(defun make_a_move (player_i)
    (let ((dice1 (roll_dice)) (dice2 (roll_dice)))

    (if (and 
        (print (list 'Игрок player_i 'бросает 'кости))
        (= dice1 dice2) (or (= dice1 1) (= dice1 6)))
        (and
            (print (list 'Выпало dice1 dice2 'повтор))
            (make_a_move player_i )
        )
        (and
            (print (list 'Выпало dice1 dice2))
            (+ dice1 dice2)))))

(defun compare_results (res1 res2) 
    (if (check_continue_game res2)
    (and
        (print (list 'Сравнение 'по 'очкам)) 
        (print ( list 'Игрок 1 'набрал res1)) 
        (print ( list 'Игрок 2 'набрал res2)) 
        (cond
            ((< res1 res2) 
            (and  
            (print (list 'Игрок 2 'выиграл 'по 'очкам))
            2 )) 

            ((> res1 res2) 
            (and
            (print (list 'Игрок 1 'выиграл 'по 'очкам)) 
            1 ))
            ((and (print 'Ничья ()) 0))))

    (and 
        (print (list 'Игрок 2 'набрал res2 'очков
        'и 'выиграл 'абсолютно)) 2 )))

(defun game ()
    (let ((res1 (make_a_move 1)))
        (if (check_continue_game res1)
            (compare_results res1 (make_a_move 2))
            (and (print (list 'Игрок 1 'набрал res1 'очков
            'и 'выиграл 'абсолютно)) 1))))

(game)