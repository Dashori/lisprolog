(defun mulFirstNumbers (lst number)
    (cons (* number (car lst)) (cdr lst)))

(defun mulFirstAny (lst number)
    (cond ((not lst)  lst)
          ((numberp (car lst))
                    (cons (* (car lst) number) (cdr lst)))
          (T (cons (mulFirstAny (car lst) number)
                   (mulFirstAny (cdr lst) number)))))

    ;; (cond
    ;;     ((null lst) nil)
    ;;     ((listp (car lst)) 
    ;;     ;; ((not numberp)
    ;;     (cons (mulFirstAny (car lst) number) (mulFirstAny (cdr lst) number)))
    ;;     ((numberp
    ;;     (cons (* (car lst) number) (cdr lst))))
    ;; )
;; )


(print (mulFirstAny '(1 2 3) 5))
(print (mulFirstAny '('('a 1 2) 2 3) 5))

