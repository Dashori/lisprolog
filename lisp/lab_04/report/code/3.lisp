(defun lastVar1 (x)
    (car (reverse x)))

(defun lastVar2 (x)
    (if (null (cdr x))
        (car x)
        (lastVar2 (cdr x))))