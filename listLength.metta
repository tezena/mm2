;; List length calculation using peano numbers

(= succ Z (S Z))
(= succ (S $k) (S (S $k)))

(= length (Cons $x $xs) $xs)

(exec (length Z (Cons 1 (Cons 2 (Cons 3 Nil))))
          (,
            (exec (length $len $list) $p1 $t1)
            (= length $list $rest)
            (= succ $len $nextLen)
          )
          (,
            (length $nextLen $rest)
            (exec (length $nextLen $rest) $p1 $t1)
          )
)









(exec (make-list (S (S (S Z))) Nil)
      (,
        ; 1. Match the current state
        (exec (make-list $n $list) $p1 $t1)
        
        ; 2. Find the next number (Decrement N)
        ;    This acts as the loop condition. 
        ;    When $n becomes Z, this match fails and the loop halts.
        (= dec $n $next_n)
      )
      (,
        ; 3. Create the new state
        ;    We cons the NEW number ($next_n) onto the accumulator ($list)
        (make-list $next_n (Cons $next_n $list))
        
        ; 4. Chain the execution
        (exec (make-list $next_n (Cons $next_n $list)) $p1 $t1)
      )
)