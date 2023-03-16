(defun append-elem (lst elem &optional (before-lst Nil))
    (cond ((and (null lst) 
                (null before-lst)) (cons elem NIL))
          ((null lst) 
                (my-reverse (cons elem before-lst)))
          (T 
                (append-elem (cdr lst) elem 
                            (cons (car lst) before-lst)))))

(defun all-numbers (num lst &optional (res-lst NIL))
     (cond ((null lst) res-lst)
           (T (all-numbers num (cdr lst) 
                (append-elem res-lst (* (car lst) num))))))

(defun not-all-numbers (num lst &optional (res-lst NIL))
     (cond ((null lst) res-lst)
           ((numberp (car lst)) 
                (not-all-numbers num (cdr lst) 
                    (append-elem res-lst (* num (car lst)))))
           ((listp (car lst)) 
                (not-all-numbers num (cdr lst) 
                    (append-elem res-lst    
                            (not-all-numbers num (car lst)))))
           (T   (not-all-numbers num (cdr lst)
                    (append-elem res-lst (car lst))))))
