(defun set-size (set1 &optional (size 0))
    (cond ((null set1) size)
    (T (set-size (cdr set1) (+ size 1)) )))

(defun len-list-of-list (lst)
    (cond ((null lst) 0)
          (T (reduce #'+ (mapcar #'set-size lst)))))