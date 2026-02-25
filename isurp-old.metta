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
(db (Inheritance Lucy human) )



((countPattern $space ($link $x $y) -> $out) 
    (, ($space ($link $x $y))) 
     (O 
        (count ($out (patternCount ( $link) $count)) 
                $count  
                ( $x $y))))

(exec 0 
    (, ((countPattern db ($link $x $y) -> res ) $p $s))
       (O  (+ (exec 0 $p $s))))






;; ==========================================
;; STEP 1: Calculate the Total Size of the Space
;; ==========================================
;; By matching `(db $any_fact)`, we iterate over the entire database.
;; We count every fact to get the global space size.
; (exec 1 
;     (, (db $any_fact))
;     (O 
;         (count (TotalSpaceSize $total_str) $total_str $any_fact)
;     )
; )

;; ==========================================
;; STEP 2: Calculate the Pattern Frequency
;; ==========================================
;; This is similar to your previous code. We match a specific pattern 
;; and count how many times it appears.
; (exec 2
;     (, (db ($link $x $y)))
;     (O 
;         (count (PatternCount ($link $x $y) $count_str) $count_str ($x $y))
;     )
; )
; ((Prob $pattern )-> $out 
;          (, 
;         (PatternCount $pattern $count_str) 
;         (TotalSpaceSize $total_str)
;     )
;     (O
;         (pure 
;             ;; The output structure
;             ($out (PatternProbability $pattern $prob_str) )
;             ;; The variable we are binding
;             $prob_str
;             ;; The Math Logic: (Count / Total)
;             (f64_to_string 
;                 (div_f64 
;                     (f64_from_string $count_str) 
;                     (f64_from_string $total_str)
;                 )
;             )
;         )
;     )
;     )

