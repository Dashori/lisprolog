(defun myLast (x)
    (if (not x)
        x
        (if (not (cdr x))
            x
            (myLast (cdr x)))))

(defun changeLast (x el)
    (if (not x)
        x
        (if (not (cdr x))
            (cons el Nil)
            (cons (car x) (changeLast (cdr x) el)))))

(defun swap-first-last (x)
    (changeLast (cons (car (myLast x)) (cdr x)) (car x)))
