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
(db (Inheritance S K))
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

(Threshold (S(S(0))))


(exec 0
    (, (db $p))
    (O 
        (+ $p)
    )
)

(exec 1
    (, ($links $x $y))
    (, (links $links))

)

(LinkCount Relation (S(S(S(0)))))
(LinkCount Association (S(S(S(S(S(S(S(S(0))))))))))
(LinkCount Inheritance (S(0)))
(LinkCount Parents (0))



(exec 3
    (, 
        (LinkCount $link1 $c1)
        (Threshold $minsup)
    )
    (, (Compare $link1 $c1 $minsup))
)



(exec 5
    (, (Compare $link1 (S $c1) (S $c2)) (exec 5 $p $t))
    (O
        (+ (exec 5 $p $t))
        (- (Compare $link1 (S $c1) (S $c2)))
        (+ (Compare $link1 $c1 $c2))
    )
)



(exec 6 
    (, (Compare $link1 $c1 (0)))
    (, (AbstractPattern $link1) (CandidatePattern $link1))
)



