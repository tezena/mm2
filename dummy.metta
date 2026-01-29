
(db (link1 nodeA nodeB))
(db (link1 nodeC nodeD)) 

(db (link2 nodeE nodeF)) 


; 2. Preparation: Copy data to a 'verification' space
;    We use a high priority (1) to ensure this happens first.
(exec 1
    (, (db $tuple))
    (, (verify $tuple))
)

; 3. The Check: Find Support >= 2
;    We look for a 'verify' entry, remove it, and look for a SECOND one.
(exec 0
    (, (verify ($link $x $y))) 

    (O 
       (- (verify ($link $x $y)))     

       (+ (exec 0                     

            (, (verify ($link $a $b))) 

            (, (has_support $link))   

          )
       )
    )
)