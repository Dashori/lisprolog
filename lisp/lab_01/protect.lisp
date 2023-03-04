;; РїСЂРµРґСЃС‚Р°РІРёС‚СЊ РІ РІРёРґРµ СЃРїРёСЃРєРѕРІС‹С… СЏС‡РµРµРє Рё cons'Р°РјРё
;; '(1 ((2 ()) 3) (4 5 (6 7) 8) 9) ((A)) B)


;; РєР°РєРёРµ-С‚Рѕ РІСЃРїРѕРјРѕРіР°С‚РµР»СЊРЅС‹Рµ С€С‚СѓРєРё

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



;; Р�С‚РѕРі: 
(print "Р�РўРћР“:")
(print (cons 1 (cons (cons (cons 2 (cons nil (cons 3 nil)))
(cons (cons 4 (cons 5 (cons (cons 6 (cons 7 nil))(cons 8 nil)))) (cons 9 nil)))
(cons (cons (cons 'a nil) nil) (cons 'b nil)))))

;; РќР°РґРѕ РїСЂР°РІРёР»СЊРЅРѕ РѕС„РѕСЂРјРёС‚СЊ, С‡С‚РѕР± СЌС‚Рѕ Р±С‹Р»Рѕ РєР°Рє AST, РЅРѕ РєР°Р¶РµС‚СЃСЏ Сѓ РјРµРЅСЏ РЅРµ РґРѕ РєРѕРЅС†Р° РїРѕР»СѓС‡РёР»РѕСЃСЊ
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


;; СЂР°Р·РЅРёС†Р° cons list
(print (cons 1 2))
(print (list 1 2 ))

;; РЅР°СЂРёСЃРѕРІР°С‚СЊ РІ РІРёРґРµ СЃРїРёСЃРєРѕРІС‹С… СЏС‡РµРµРє Рё РѕР±СЉСЏСЃРЅРёС‚СЊ
(print (defvar x (cons 1 2)))
(print (setf (cdr x ) x))

