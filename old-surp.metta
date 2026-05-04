((univeral_count $pattern -> $loc)
    )

(:: (Inheritance abe kebe) (:: (Inheritance kebe abe )))


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



(exec 0 
    (,(db ($link $x $y)))
    (O 
        (pure 
            (GroupedResult $y $t) 
            $t 
            ;; Pass 3 separate symbols into the function
            (tuple apple banana orange)
        )
    )
)