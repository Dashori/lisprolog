(defun change-last (x el)
    (cond ((null x) x)
    ((null (cdr x)) (cons el Nil))
    (T (cons (car x) (change-last (cdr x) el)))))

(defun changeLast (x el)
    (if (null x)
        (x)
        (if (null (cdr x))
            (cons el Nil)
            (cons (car x) (changeLast (cdr x) el)))))

(defun swap-first-last (x)
    (changeLast (cons (car (myLast x)) (cdr x)) (car x)))