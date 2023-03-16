(defun rec-add-a (lst &optional (sum 0))
    (cond ((null lst)
                sum)
        ((numberp (car lst))
                (rec-add-a (cdr lst) (+ sum (car lst))))
        (T 
            (rec-add-a (cdr lst) sum))))

(print (rec-add-a '(1 v 4 0)))

(defun rec-add-b (lst &optional (sum 0))
    (cond ((null lst)
                sum)
        ((numberp (car lst))
                (rec-add-b (cdr lst) (+ sum (car lst))))
        ((listp (car lst))
                (rec-add-b (cdr lst) 
                        (+ sum (rec-add-b (car lst)))))
        (T 
            (rec-add-b (cdr lst) sum))))
