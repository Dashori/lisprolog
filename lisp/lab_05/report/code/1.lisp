(defun all-num-minus-10 (lst) 
    (mapcar #'(lambda (x)
        (cond 
            ((not x) NIL)
            ((numberp x) (- x 10))
            ((listp x) (all-num-minus-10 x))
            (t x))) lst))
