(defun all-numbers (lst num)
    (mapcar #'(lambda (x)
                (* x num))
                lst))

(defun not-all-numbers (lst num)
    (mapcar #'(lambda (x)
                (cond 
                    ((null x) NIL)
                    ((numberp x) (* x num))
                    ((listp x) (not-all-numbers x num))
                    (T x)))
                lst))