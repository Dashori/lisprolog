(defun how-alike-and (x y)
    (or 
        (and (or (= x y) (equal x y)) 'the_same)
        (and (and (evenp x) (evenp y)) 'both_even)
        (and (and (oddp x) (oddp y)) 'both_odd)
        (and T 'difference)))