(load "~/.quicklisp/setup.lisp")

(in-package :cl-user)
(ql:quickload :fiveam)

(defpackage :mankala-test
(:use :cl :fiveam))

(in-package :mankala-test)

(def-suite mankala-test)
(in-suite mankala-test)

(load "./mankala.lisp")

;; dopShiftEnd (len stones index)
(test dopShiftEnd-1
    (is (equalp 
        (dopShiftEnd 4 '(1 2 3 4) 1)
                '(1 0 4 5))
        )
) 

(test dopShiftEnd-2
    (is (equalp 
        (dopShiftEnd 6 '(0 1 1 1 1 1 0) 4)
                '(0 1 1 1 0 2 0))
        )
) 

(test dopShiftEnd-3
    (is (equalp 
        (dopShiftEnd 6 '(0 1 1 1 1 1 0) 5)
                '(0 1 1 1 1 0 1))
        )
) 

(test dopShiftEnd-4
    (is (equalp 
        (dopShiftEnd 6 '(0 1 1 1 1 1 0) 1)
                '(0 0 2 1 1 1 0))
        )
) 

;;  dopShiftStart (len stones index val)

(test dopShiftStart-1
    (is (equalp 
        (dopShiftStart 6 '(1 1 1 1 1 1) 1 4)
                '(2 2 2 2 2 1))
        )
) 

(test dopShiftStart-2
    (is (equalp 
        (dopShiftStart 6 '(1 1 1 1 1 1) 1 1)
                '(2 2 1 1 1 1))
        )
) 

(test dopShiftStart-3
    (is (equalp 
        (dopShiftStart 6 '(1 1 1 1 1 1) 1 0)
                '(2 1 1 1 1 1))
        )
) 

(test dopShiftStart-4
    (is (equalp 
        (dopShiftStart 6 '(1 1 1 1 1 1) 1 3)
                '(2 2 2 2 1 1))
        )
) 

;; shift (len stones index) 
(test shift-1
    (is (equalp 
        (shift 4 '(1 2 3 4) 1)
                '(1 0 4 5))
        )
) 

(test shift-2
    (is (equalp 
        (shift 6 '(1 2 3 4 20 0) 4)
                '(5 5 6 7 3 4))
        )
) 

(test shift-3
    (is (equalp 
        (shift 6 '(1 2 3 4 21 0) 4)
                '(5 6 6 7 3 4))
        )
) 

(test shift-4
    (is (equalp 
        (shift 6 '(1 2 3 4 22 0) 4)
                '(5 6 7 7 3 4))
        )
) 

(test shift-5
    (is (equalp 
        (shift 6 '(1 2 3 4 1 0) 4)
                '(1 2 3 4 0 1))
        )
) 

(test shift-6
    (is (equalp 
        (shift 6 '(1 2 3 4 1 0) 0)
                '(0 3 3 4 1 0))
        )
) 

(test shift-7
    (is (equalp 
        (shift 6 '(0 1 2 3 4 5) 0)
                '(0 1 2 3 4 5))
        )
) 

;; whichHole (len stones i) 

(test whichHole-1
    (is (equalp 
        (whichHole 6 '(1 1 1 1 1 1) 1)
                1)
        )
) 

(test whichHole-2
    (is (equalp 
        (whichHole 6 '(1 1 1 1 1 1) 2)
                2)
        )
) 

(test whichHole-3
    (is (equalp 
        (whichHole 6 '(1 2 3 4 20 0) 5)
                0)
        )
) 

(test whichHole-4
    (is (equalp 
        (whichHole 6 '(1 2 3 4 21 0) 5)
                1)
        )
) 

(test whichHole-5
    (is (equalp 
        (whichHole 6 '(1 2 3 4 22 0) 5)
                2)
        )
) 

(test whichHole-6
    (is (equalp 
        (whichHole 6 '(1 2 3 4 23 0) 5)
                3)
        )
) 

(test whichHole-7
    (is (equalp 
        (whichHole 6 '(1 2 3 4 24 0) 5)
                4)
        )
) 

(test whichHole-8
    (is (equalp 
        (whichHole 6 '(1 2 3 4 25 0) 5)
                5)
        )
) 

(test whichHole-9
    (is (equalp 
        (whichHole 6 '(1 2 3 4 26 0) 5)
                0)
        )
) 

;;win (stones)
(test win-1
    (is (equalp 
        (isWin '(1 2 3 4))
            NIL)
        )
) 

(test win-2
    (is (equalp 
        (isWin '(0 3 0 1))
            NIL)
        )
) 

(test win-3
    (is (equalp 
        (isWin '(0 0 0 0 1 1))
            NIL)
        )
) 

(test win-4
    (is (equalp 
        (isWin '(0 0 0 1))
            T)
        )
) 

(test win-5
    (is (equalp 
        (isWin '(0 0 0 0))
            T)
        )
) 

;; resize (stones index)

(test resize-1
    (is (equalp 
        (resize '(1 2 3 4) 1)
            '(2 3 4))
        )
) 

(test resize-2
    (is (equalp 
        (resize '(1 2 3 4) 0)
            '(1 2 3 4))
        )
) 

(test resize-3
    (is (equalp 
        (resize '(1 2 3 4) 3)
            '(4))
        )
) 

;; zeroElement (stones index) 
(test zeroElement-1
    (is (equalp 
        (zeroElement '(1 1 1 1 1) 3)
            '(1 1 1 0 1))
    )
) 

(test zeroElement-2
    (is (equalp 
        (zeroElement '(1 1 1 1 1) 0)
            '(0 1 1 1 1))
    )
) 

(test zeroElement-3
    (is (equalp 
        (zeroElement '(1 1 1 1 1) 4)
            '(1 1 1 1 0))
    )
) 

;; mainSolve (len stones index resizeParam) 
(test mainSolve-1
    (is (equalp 
        (mainSolve 5 '(2 2 2 2 0) 0 0)
            '(3 4 2 3 4 1 4 2 3 4))
    )
)

(test mainSolve-2
    (is (equalp 
        (mainSolve 5 '(1 7 4 6 0) 0 0)
            '(1 2 2 3 3 4 3 2 1 3 4 4 1 2 4 3 4   3 4 2 3 4 1 4 2 3 4))
    )
)

;; dop (len stones i)

(test dop-1
    (is (equalp 
        (dop 5 '(2 2 2 2 0) 0)
            NIL)
    )
)

(test dop-2
    (is (equalp 
        (dop 5 '(2 2 2 2 0) 1)
            NIL)
    )
)

(test dop-3
    (is (equalp 
        (dop 5 '(2 2 2 2 0) 2)
            T)
    )
)


;; findNotZeroHole (stones index)
(test findNotZeroHole-1
    (is (equalp 
        (findNotZeroHole '(1 2 3 4 5) 0)
            0)
        )
) 

(test findNotZeroHole-2
    (is (equalp 
        (findNotZeroHole '(0 2 3 4 5) 0)
            1)
        )
) 

(test findNotZeroHole-3
    (is (equalp 
        (findNotZeroHole '(0 0 3 4 5) 0)
            2)
        )
) 

(test findNotZeroHole-4
    (is (equalp 
        (findNotZeroHole '(0 0 0 4 5) 0)
            3)
        )
) 

(test findNotZeroHole-5
    (is (equalp 
        (findNotZeroHole '(0 0 0 0 5) 0)
            4)
        )
) 

(test findNotZeroHole-5
    (is (equalp 
        (findNotZeroHole '(0 0 0 0 0) 0)
            NIL)
        )
) 

;; plusInterval (stones num start end index)
(test plusInterval-1
    (is (equalp 
        (plusInterval '(1 1 1 1 1) 3 2 4 0)
            '(1 1 4 4 4))
        )
) 

(test plusInterval-2
    (is (equalp 
        (plusInterval '(1 1 1 1 1) 3 1 2 0)
            '(1 4 4 1 1))
        )
) 

(test plusInterval-3
    (is (equalp 
        (plusInterval '(1 1 1 1 1) 3 0 1 0)
            '(4 4 1 1 1))
        )
) 

(test plusInterval-4
    (is (equalp 
        (plusInterval '(1 1 1 1 1) 3 2 2 0)
            '(1 1 4 1 1))
    )
) 

(test plusInterval-5
    (is (equalp 
        (plusInterval '(1 1 1 1 1) 3 0 0 0)
            '(4 1 1 1 1))
    )
) 

(test plusInterval-6
    (is (equalp 
        (plusInterval '(1 1 1 1 1) 3 0 4 0)
            '(4 4 4 4 4))
    )
) 

(run! 'mankala-test)