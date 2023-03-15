(defun sqaure-numbers (lst)
    (mapcar #'(lambda (x)
                (* x x))
                lst))