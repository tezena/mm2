
;; Addition is just adding S and brackets

; (number A (S (S (S(0)))))
; (number B (S (S (S(0)))))


; (exec ADD

;     (, 
;         (number A (S $x))
;         (number B $y)
;         (exec ADD $p $t)
;     )
;     (O
;         (+ (exec ADD $p $t))
;         (- (number B $y))
;         (+ (number B (S $y)))
;         (- (number A (S $x)))
;         (+ (number A $x))

;     )

; )



;; DB Space

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




; Note: Spaces are AbstractPattern and CandidatePattern

; Step 1: Extract Links

;Extract DB
(exec 0
    (, (db $db))
    (O 
        (+ $db)
    )
)

;; Extract Links list
(exec 1
    (, ($links $x $y))
    (, (links $links))
)

; Step 2: Count how many times the pattern appears

(exec 2
    (, (links $link))
    (O 
        (+ (LinkCount $link (0)))
    )
)


(exec COUNT

    (, 
        (db ($link $x $y))
        (exec COUNT $p $t)
        (LinkCount $link $n)
    )
    (O
        (+ (exec COUNT $p $t))
        (- (LinkCount $link $n))
        (+ (LinkCount $link S ($n)))
        (- (db ($link $x $y)))

    )

)





;; Step 2.2: Check if the counts exceeds the minimum count
;; Step 3: Remove old versions of AbstractPattern and CandidatePattern
;; Step 3.2: Add the new to AbstractPattern and CandidatePattern