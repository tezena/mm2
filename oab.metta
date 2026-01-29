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







; --- 1. Global Setup ---
(Threshold 4)

(exec 0
    (, (Threshold $x))
    (O
        (- (Threshold $x))
        (pure (ThresholdInt $n) $n (i64_from_string $x))
    )
)

; --- 2. Count Links ---
(exec 2
    (, (db ($link $x $y)))
    (O 
        (count (Count $link $str) $str ($x $y))
    )
)

; --- 3. Compute Status (The Filter) ---
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

; --- 4. Finalize (Branching & Cleanup) ---
; We promote to Pattern, and REMOVE the intermediates immediately.
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
       (- (SpecializationOf $abstract $candidate))
    )
)

(exec 7 
   
    (, (SpecializationOf $abstract ($link X $y))) 
    (O 

       (+ (exec 7
            (, (db ($link $x $y)))
            (O (count 
                  (SpecializationWithCount $abstract ($link $X $y)  $n) 
                  $n 
                   $x
               ))
       ))
       (- (SpecializationOf $abstract $candidate))
    )
)


