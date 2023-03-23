(defun withoutLast1 (x)
    (reverse (cdr (reverse x))))

(defun withoutLast2 (x)
    (if (not (cdr x))
        NIL
        (cons (car x) (withoutLast2 (cdr x)))))
