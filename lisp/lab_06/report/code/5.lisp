(defun rec-add-a (lst &optional (sum 0))
    (cond ((not lst)
                sum)
        ((numberp (car lst))
                (rec-add-a (cdr lst) (+ sum (car lst))))
        (T 
            (rec-add-a (cdr lst) sum))))

(print (rec-add-a '(1 v 4 0)))

(defun rec-add-b (lst &optional (sum 0))
    (cond ((not lst)
                sum)
        ((numberp (car lst))
                (rec-add-b (cdr lst) (+ sum (car lst))))
        ((not (atom (car lst)))
                (rec-add-b (cdr lst) 
                        (+ sum (rec-add-b (car lst)))))
        (T 
            (rec-add-b (cdr lst) sum))))


(print (rec-add-b'(1 v (4 5 (a b 6) 0))))