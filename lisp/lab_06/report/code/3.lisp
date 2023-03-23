(defun append-elem (lst elem &optional (before-lst Nil))
    (cond ((and (not lst) 
                (not before-lst)) (cons elem NIL))
          ((not lst) 
                (my-reverse (cons elem before-lst)))
          (T 
                (append-elem (cdr lst) elem 
                            (cons (car lst) before-lst)))))

(defun all-numbers (num lst &optional (res-lst NIL))
     (cond ((not lst) res-lst)
           (T (all-numbers num (cdr lst) 
                (append-elem res-lst (* (car lst) num))))))

(defun not-all-numbers (num lst &optional (res-lst NIL))
     (cond ((not lst) res-lst)
           ((numberp (car lst)) 
                (not-all-numbers num (cdr lst) 
                    (append-elem res-lst (* num (car lst)))))
           ((listp (car lst)) 
                (not-all-numbers num (cdr lst) 
                    (append-elem res-lst    
                            (not-all-numbers num (car lst)))))
           (T   (not-all-numbers num (cdr lst)
                    (append-elem res-lst (car lst))))))



(defun numbers1 (lst number)
      (cond ((not lst)  NIL)
            (T (cons (* number (car lst)) (numbers1 (cdr lst) number)))
      )
)

(print (numbers1 '(1 2 3 4) 2))



;; (defun numbers2 (lst number)
;;       (cond ((not lst) NIL)
;;             ((numberp (car lst))
;;                   (cons (* number (car lst)) (numbers2 (cdr lst) number)))
;;             (T (cons (numbers2 (car lst) number)  (numbers2 (cdr lst) number)))
;;       )
;; )

(defun numbers2 (lst num)
  (cond ((not lst) nil)
        ((not (atom lst)) (mapcar #'(lambda (x) (numbers2 x num)) lst))
        ((numberp lst) (* lst num))
        (t lst)
  )
)



(print (numbers2 '(1 2 3 4) 2))
(print (numbers2 '(1 2 3'(A 4) 4) 2))

;; (print (atom '(1234)))
;; (print (atom (caar '('(23)))))
;; (print (caar '('(23))))