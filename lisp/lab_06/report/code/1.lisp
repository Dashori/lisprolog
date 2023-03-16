(defun my-reverse (lst &optional (buf-lst NIL))
    (cond ((null lst) buf-lst)
          (T (my-reverse (cdr lst) (cons (car lst) buf-lst)))))