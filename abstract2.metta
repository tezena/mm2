

((abstract-pattern $dbspace $minsup $aptrnspace $cndpspace)
    (, ($dbspace ($link $n1 $n2)) )
    (O
        (+ (Threshold $minsup))
        (+ 
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
        )
        (+ 
            (exec 1
                (, ($dbspace ($link $x $y)))
                (O 
                    (count 
                        (LinkCount $link $count)
                        $count
                        ($x $y)
                    )
                )
            )
        )
        (+
            (exec 2
                (, (LinkCount $link $count))
                (O 
                    (pure
                        (LinkCount int $link $c)
                        $c
                        (i64_from_string $count)
                    )
                )
            )
        )
        (+
            (exec 3
                (, (LinkCount int $link $c) (Threshold $n))
                (O
                    (pure
                        (maxOf $link $c $n -> $max)
                        $max
                        (max_i64 $c $n)
                    )
                    (- (maxOf $link $c $n -> $n))
                )
            )
        )
        (+
            (exec 4
                (, (maxOf $link $c $n -> $max))
                (O
                    (+ ($aptrnspace $link))
                    (pure 
                        ($cndpspace $link $r)
                        $r
                        (i64_to_string $c)
                    )
                )
            )
        )
        (+
            (exec 8 
                (, (LinkCount int $link $c) (Threshold $x) (LinkCount $linkk $count) (maxOf $linnk $cc $n -> $max))
                (O 
                    (- (LinkCount int $link $c))
                    (- (Threshold $x))
                    (- (LinkCount $linkk $count))
                    (- (maxOf $linnk $cc $n -> $max))
                )
            )
        )
    )
)



;How to use
;(exec 7 (, ((abstract-pattern db 12 aptrnspace cndpspace) $p $t))
;        (, (exec 0 $p $t))
;)