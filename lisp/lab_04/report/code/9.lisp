(defun mulFirstNumbers (lst number)
    (cons (* number (car lst)) (cdr lst)))

(defun mulFirstAny (lst number)
    (cond ((null lst)   lst)

          ((numberp (car lst))
                    (cons (* (car lst) number) (cdr lst)))

          (T (cons (car lst) 
                   (mulFirstAny (cdr lst) number)))))
