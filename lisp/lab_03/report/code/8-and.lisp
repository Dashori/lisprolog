(defun between-and (x y z)
    (or (and (>= x y) (<= x z)) 
        (and (< x y) (> x z))))
