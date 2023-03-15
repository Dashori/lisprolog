(defun reverse1 (lst)
    (when lst
        (append (reverse1 (cdr lst))
                (list (car lst)))))

(defun palyndrom-list (lst) 
    (reduce #'(lambda (x y) (and x y))
        (mapcar #'equal lst (reverse1 lst))))