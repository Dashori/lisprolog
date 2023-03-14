(defun countryByCapital (table capital)
    (if (equal capital (cdr (car table)))
        (car (car table))    
        (countryByCapital (cdr table) capital)))

(defun capitalByCountry (table country)
    (if (equal country (car (car table)))
        (cdr (car table))    
        (capitalByCountry (cdr table) country)))
