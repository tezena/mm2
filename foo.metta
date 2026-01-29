(exec 0
      (, (foo $x))
      (O (- (foo $x))
         (+ (bar $x))))


(exec (a b c) (, (foo $x)) (, (it is first $x)))
(exec (a b) (, (foo $x)) (, (it is seconde $x)))


(foo a)
