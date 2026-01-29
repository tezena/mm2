; DB Space

(db (Inheritance A B))
(db (Inheritance C B))
(db (Inheritance B Z))
(db (Inheritance D C))
(db (Inheritance E C))
(db (Inheritance F D))
(db (Inheritance G D))
(db (Inheritance H E))
(db (Inheritance I E))
(db (Inheritance J F))
(db (Inheritance K F))
(db (Inheritance L G))
(db (Inheritance M G))
(db (Inheritance N H))
(db (Inheritance O H))
(db (Inheritance P I))
(db (Inheritance Q I))
(db (Inheritance R J))
(db (Association X Y))
(db (Association Y Z))
(db (Association A C))
(db (Association B D))
(db (Association C E))
(db (Association D F))
(db (Association E G))
(db (Association F H))
(db (Association G I))
(db (Association H J))
(db (Association I K))
(db (Association J L))
(db (Association K M))
(db (Relation P Q))
(db (Relation M N))
(db (Relation A B))
(db (Relation C D))
(db (Relation E F))
(db (Relation G H))
(db (Relation I J))
(db (Relation K L))
(db (Relation M N))
(db (Relation O P))
(db (Relation Q R))
(db (Relation S T))

; Minimum occurance needed to satisfy the minimum support in a space
(Threshold 18)

(exec 0
    (, (Threshold $x))
    (O
        (- (Threshold $x))
        (pure 
            (Threshold $n)
            $n
            (i64_from_string $x)
        )
    )
)




;Counting and convert the string count to int-value

(exec 2
    (, (db ($link $x $y)))
    (O 
        (count 
            (LinkCount $link $count)
            $count
            ($x $y)
        )
    )
)
(exec 3
    (, (LinkCount $link $count))
    (O 
        (pure
            (LinkCount int $link $c)
            $c
            (i64_from_string $count)
        )
    )
)


;Compare  with max
; (exec 4
;     (, (LinkCount int $link $c) (Threshold $n))
;     (O
;         (pure
;             (maxOf $link $c $n -> $max)
;             $max
;             (max_i64 $c $n)
;         )
;         (- (maxOf $link $c $n -> $n))
;     )
; )


(exec 4
    (, (LinkCount int $link $c) (Threshold $n))
    (O
        (- (maxOf $link $c $n -> $n))
        (+ (maxOf $link $c $n -> $c))
        (pure
            (maxOf $link $c $n -> $max)
            $max
            (max_i64 $c $n)
        )
        
    )
)

;Add AbsPtr and CndPtr
(exec 5
    (, (maxOf $link $c $n -> $max))
    (O
        (+ (AbstractPattern $link))
        (pure 
            (CandidatePattern $link $r)
            $r
            (i64_to_string $c)
        )
    )
)

;Cleaning up 
(exec 6 
    (, (LinkCount int $link $c) (Threshold $x) (LinkCount $linkk $count) (maxOf $linnk $cc $n -> $max))
    (O 
        (- (LinkCount int $link $c))
        (- (Threshold $x))
        (- (LinkCount $linkk $count))
        (- (maxOf $linnk $cc $n -> $max))
    )
)


