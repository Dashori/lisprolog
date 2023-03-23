(defun my-reverse (lst &optional (buf-lst NIL))
    (cond ((not lst) buf-lst)
          (T (my-reverse (cdr lst) (cons (car lst) buf-lst)))))
