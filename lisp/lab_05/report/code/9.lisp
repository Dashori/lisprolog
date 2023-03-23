(defun set-size (set1 &optional (size 0))
    (cond ((not set1) size)
    (T (set-size (cdr set1) (+ size 1)) )))

(defun len-list-of-list (lst)
    (cond ((not lst) 0)
          (T (reduce #'+ (mapcar #'set-size lst)))))



(print (format NIl "AaaaAAA!"))

(print (len-list-of-list (format NIl "AaaaAAA!")))