(defun between (x y z)
    (if (>= x y)
        (<= x z)
        (>= x z)))