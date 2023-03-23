(defun select-between (num1 num2 lst &optional (res-lst NIL))
     (cond  ((not lst) res-lst)
            ((< num1 (car lst) num2) 
                (select-between num1 num2 (cdr lst) 
                (append-elem res-lst (car lst))))
            (T (select-between num1 num2 (cdr lst) res-lst))))
