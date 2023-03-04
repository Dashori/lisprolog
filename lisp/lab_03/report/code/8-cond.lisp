(defun between-cond (x y z)
    (cond ((>= x y) (<= x z))
          ((< x y) (> x z))))