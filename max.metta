(val1 (S(S(S Z))))
(val2 (S(S(S (S Z)))))

(exec 0 (, (val1 (S $c)) (val2 (S $c2)) (exec 0 $p $t))
         (O (+ (exec 0 $p $t) )
             (- (val1 (S $c)))
             (- (val2 (S $c2)))
             (+ (val1 $c))
             (+ (val2  $c2)))
         )

(exec 1 (, (val1 (S $c)) (val2 Z)) (, (Max val1 )) )
(exec 1 (, (val1  Z) (val2 (S $c))) (, (Max val2 )) )

