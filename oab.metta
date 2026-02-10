(db (Inheritance Allen sodaDrinker))
(db (Inheritance Abe sodaDrinker))
(db (Inheritance Lily sodaDrinker))
(db (Inheritance Cason sodaDrinker))

(db (Inheritance Lily ugly))
(db (Inheritance Allen ugly))
(db (Inheritance Abe ugly))
(db (Inheritance Cason ugly))

(db (Inheritance Lily  woman))
(db (Inheritance Emily woman))
(db (Inheritance Lucy woman))

(db (Inheritance Allen man))
(db (Inheritance Abe man))
(db (Inheritance Cason man))

(db (Inheritance Allen human))
(db (Inheritance Abe human))
(db (Inheritance Cason human))
(db (Inheritance Lily human))
(db (Inheritance Emily human))
(db (Inheritance Lucy human) )







;  Global Setup
(Threshold 4)

(exec 0
    (, (Threshold $x))
    (O
        (- (Threshold $x))
        (pure (ThresholdInt $n) $n (i64_from_string $x))
    )
)

;  Count Links 
(exec 2
    (, (db ($link $x $y)))
    (O 
        (count (Count $link $str) $str ($x $y))
    )
)


;  Compute Status (The Filter) 
; Logic: IF (Count - Threshold + 1) > 0 THEN "1" ELSE "0" or "-1"
; If Count == Threshold, (0 + 1) = 1. (Pass)
; If Count < Threshold, (-1 + 1) = 0. (Fail)
(exec 3
    (, (Count $link $cnt_str) (ThresholdInt $thresh))
    (O
        (pure 
            (Checked $link $cnt_str $status) 
            $status
            (i64_to_string 
                (signum_i64 
                    (sum_i64 
                        (sub_i64 (i64_from_string $cnt_str) $thresh) 
                        (i64_from_string 1)
                    )
                )
            )
        )
    )
)



(exec 4
    (, (Checked $link $cnt 1) (Count $link $cnt))
    (O
        (+ (AbstractPattern ($link $a $b)))
        (- (Checked $link $cnt 1)) 
        (- (Count $link $cnt))       
    )
)

; We just remove the intermediates.
(exec 5
    (, (Checked $link $cnt $status) (Count $link $cnt))
    (O (- (Checked $link $cnt $status))  
         (- (Count $link $cnt)) )
)



(exec 6 
    (, (AbstractPattern ($link $var-x $var-y)))
    (O (+ (exec 6 
            (, (db ($link $x $y))) 
            
            (O 
                (+ (SpecializationOf ($link $var-x $var-y) ($link $x Y)))
                (+ (SpecializationOf ($link $var-x $var-y) ($link X $y)))
            ) 
         )))
)


(exec 7 
   
    (, (SpecializationOf $abstract ($link $x Y))) 
    (O 
       (+ (exec 7
            (, (db ($link $x $y)))
            (O (count 
                  (SpecializationWithCount $abstract ($link $x Y)  $n) 
                  $n 
                   $y
               ))
       ))
       (- (SpecializationOf $abstract ($link $x Y)))
    )
)



(exec 7 (, (SpecializationOf $abstract ($link X $y))) 
    (O 
       (+ (exec 7
            (, (db ($link $x $y)))
            (O (count 
                  (SpecializationWithCount $abstract ($link X $y)  $n) 
                  $n 
                   $x
               ))
       ))
       (- (SpecializationOf $abstract ($link X $y)))
    )
)

(exec 8 (, (SpecializationWithCount $abstract ($link $x $y)  $n) (ThresholdInt $thresh) )
        (O 
            (pure (Checked ($link $x $y)   $status) 
                  $status
                    (i64_to_string 
                         (signum_i64 
                            (sum_i64 
                                  (sub_i64 (i64_from_string $n) $thresh) 
                                  (i64_from_string 1)
                    )
                )
            )
       )
))

(exec 9 (, (Checked ($link $x $y) 1) (SpecializationWithCount $abstract ($link $x $y)  $n))
        (O
            (+ (CandidatePattern ($link $x $y)))
            (- (Checked ($link $x $y) 1)) 
            (- (SpecializationWithCount $abstract ($link $x $y)  $n))       
    )
)

(exec 10 (, (SpecializationWithCount $abstract ($link $x $y)  $n) (Checked ($link $x $y) $status))
        (O 
            (- (SpecializationWithCount $abstract ($link $x $y)  $n))  
            (- (Checked ($link $x $y) $status)) 
    )
)



(exec 10
    (, (CandidatePattern ($l1 $a1 $b1)) 
       (CandidatePattern ($l2 $a2 $b2))) 
    
    (O
       ; Head to Head 
       (+ (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 1 1))
       (- (conj ($l1 $a1 $b1) ($l1 $a1 $b1) 1 1))

       ; Head to Tail 
       (+ (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 1 2))
       (- (conj ($l1 $a1 $b1) ($l1 $a1 $b1) 1 2))

       ; Tail to Head 
       (+ (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 2 1))
       (- (conj ($l1 $a1 $b1) ($l1 $a1 $b1) 2 1))

       ; Tail to Tail 
       (+ (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 2 2))
       (- (conj ($l1 $a1 $b1) ($l1 $a1 $b1) 2 2))

    )
)


;; Head to Head
(exec 11
    (, (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 1 1))
    (O
       (+ (exec 11
            (, (db ($l1 $shared $b1)) (db ($l2 $shared $b2))) 
            (O (count 
                  (conjpat (, ($l1 $var $b1) ($l2 $var $b2))  $count)   
                  $count
                  ($shared $b1 $b2)
               )  )
       ))
       (- (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 1 1)) 

    )
)

;; (Head to Tail)
(exec 11
    (, (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 1 2))
    (O
       (+ (exec 11
            (, (db ($l1 $shared $b1)) (db ($l2 $a2 $shared))) 
            (O (count  (conjpat  (, ($l1 $var $b1) ($l2 $a2 $var))  $count)   
                  $count
                  ($shared $b1 $a2)
               )
               )
       ))
       (- (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 1 2)) 

    )
)

;; (Tail to Head)
(exec 11
    (, (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 2 1))
    (O
       (+ (exec 11 (, (db ($l1 $a1 $shared)) (db ($l2 $shared $b2))) 
            (O (count 
                  (conjpat (, ($l1 $a1 $var) ($l2 $var $b2)) $count)   
                  $count
                  ($shared $a1 $b2)
               )
               )
       ))
       (- (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 2 1)) 

    )
)



;; (Tail to tail )
(exec 11
    (, (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 2 2))
    (O
       (+ (exec 11
            (, (db ($l1 $a1 $shared)) (db ($l2 $a2 $shared))) 
            (O (count 
                  (conjpat (, ($l1 $a1 $var) ($l2 $a2 $var)) $count)   
                  $count
                  ($shared $a1 $a2)
               )
               )
       ))
       (- (conj ($l1 $a1 $b1) ($l2 $a2 $b2) 2 2)) 
    )
)























; ; --- 3-CONJUNCT ---
; (exec 20
;     (, (ConjoinedPattern (, $p1 $p2) $n) 
;        (CandidatePattern ($l_new $a_new $b_new)))
    
;     (O
;        (+ (TryExtend3 (, $p1 $p2) ($l_new $a_new $b_new) 1 1)) 
;        (+ (TryExtend3 (, $p1 $p2) ($l_new $a_new $b_new) 1 2))

;        (+ (TryExtend3 (, $p1 $p2) ($l_new $a_new $b_new) 2 1)) 
;        (+ (TryExtend3 (, $p1 $p2) ($l_new $a_new $b_new) 2 2)) 
;     )
; )

; (exec 21
;     ; Task: Extend the tuple ($p1 $p2) by joining $new to $p1's first argument
;     (, (TryExtend3 (, ($l1 $a1 $b1) $p2) ($l_new $a_new $b_new) 1 1))
    
;     (O
;        (+ (exec 210
;             (, (db ($l1 $shared $b1)) 
;                (db ($l_new $shared $b_new))) 

;             (O (count 
;                   ; Output the Triple: (, P1 P2 P3)
;                   (ConjoinedPattern 
;                       (, ($l1 $var $b1) $p2 ($l_new $var $b_new)) 
;                       $count)
                  
;                   $count
;                   ($shared $b1 $p2 $b_new)
;                ))
;        ))
;        ; Cleanup
;        (- (TryExtend3 (, ($l1 $a1 $b1) $p2) ($l_new $a_new $b_new) 1 1))
;     )
; )

; ; --- EXECUTE: Connect New Pattern to P2 (Head-Head) ---
; (exec 21
;     (, (TryExtend3 (, $p1 ($l2 $a2 $b2)) ($l_new $a_new $b_new) 2 1))
    
;     (O
;        (+ (exec 210
;             (, (db ($l2 $shared $b2)) (db ($l_new $shared $b_new))) 
;             (O (count 
;                   (ConjoinedPattern 
;                       (, $p1 ($l2 $var $b2) ($l_new $var $b_new)) 
;                       $count)
;                   $count
;                   ($p1 $shared $b2 $b_new)
;                ))
;        ))
;        (- (TryExtend3 (, $p1 ($l2 $a2 $b2)) ($l_new $a_new $b_new) 2 1))
;     )
; )

