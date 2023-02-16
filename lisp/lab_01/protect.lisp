;; представить в виде списковых ячеек и cons'ами
;; '(1 ((2 NIL 3) (4 5 (6 7) 8) 9) ((A)) B)


;; какие-то вспомогательные штуки

(print (cons 1 (cons 2 nil)))

(print (cons 4 (cons 5 (cons (cons 6 (cons 7 nil)) (cons 8 nil)))))

(print (cons (cons (cons 'a nil) nil) nil))


(print (cons 1 (cons (cons (cons 2 (cons nil (cons 3 nil))) (cons 'A 'V)) nil)))

(print "()")

(print (cons 1 (cons (cons (cons 2 (cons nil (cons 3 (cons (
    cons 4 (cons 5 (cons (cons 6 (cons 7 nil)) (cons 8 nil)))) (cons 9 nil)
)))) nil) nil)))


(print (cons 1 (cons (cons (cons 2 (cons nil (cons 3 nil))) 
(cons (cons 4 (cons 5 (cons (cons 6 (cons 7 nil)) (cons 8 nil)))) 
    (cons 9 nil))) nil)))


(print (cons 1 (cons (cons (cons 2  (cons nil (cons 3 nil))) 
(cons (cons 4 (cons 5 (cons (cons 6 (cons 7 nil)) (cons 8 nil)))) 
    (cons 9 nil))) (cons (cons (cons 'a nil) nil) 'b))))



;; Итог: 
(print "ИТОГ:")
(print (cons 1 (cons (cons (cons 2 (cons nil (cons 3 nil)))
(cons (cons 4 (cons 5 (cons (cons 6 (cons 7 nil))(cons 8 nil)))) (cons 9 nil)))
(cons (cons (cons 'a nil) nil) (cons 'b nil)))))

;; Надо правильно оформить, чтоб это было как AST, но кажется у меня не до конца получилось
(print (cons    1 
                (cons (cons (cons 2 
                                    (cons nil 
                                            (cons 3
                                                     nil)))
                            (cons (cons 4
                                            (cons 5 
                                                    (cons (cons 6 
                                                                (cons 7 
                                                                        nil))
                                                        (cons 8 
                                                                nil)))) 
                                    (cons 9
                                            nil)))
                        (cons (cons (cons 'a 
                                                nil)
                                                     nil) 
                                (cons 'b 
                                        nil)))))


;; разница cons list
(print (cons 1 2))
(print (list 1 2 ))

;; нарисовать в виде списковых ячеек и объяснить
(print (defvar x (cons 1 2)))
(print (setf (cdr x ) x))

