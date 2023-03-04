;; (print '(1 ((2 3 () 4) 5)  7 ((8)) ) )
;; достать (4 (8))


(defvar x '(1 (( 2 3 (()) 4 ) 5 ) 7 ((8))))

(print (cons  (car (cdr (cdr (cdaadr x))))
              (cadddr x)
            ))


