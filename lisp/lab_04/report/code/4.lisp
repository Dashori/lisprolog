(defun withoutLast1 (x)
    (reverse (cdr (reverse x))))

(defun withoutLast2 (x)
    (if (null (cdr x))
        NIL
        (cons (car x) (withoutLast2 (cdr x)))))