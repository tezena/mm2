; (exec a  (, (num $x) ) (O (- (num $x))))
; (exec a (, (num $x) ) (, (found $x)))


; (Num (S (S Z)))
; (inheritance Abe kebe)
; (inheritance John Bob)
; (in_ld_with Abe John)

; (exec 0 (, (inheritance $x $y) (num $z)) 
;           (O 
;              (- (inheritance $x $y) )
;              (- (num $z))))


; (greeting $name (Hello $name And world!!))

; (exec 0 (, (greeting Tedi $output)) 
;         (O (+ $output)))


;  (exec 1 (, (human $x)) (, (Name $x)))
;  (exec 0 (, (Name $x)) (, (Age Of $x 40)))


;  (exec 0 (, (human $x )) 
;            (, (Name $x) 
;               (exec 0  (, (Name $x)) (, (Age of $x 30) (exec )) )))


;  (human Abe)
;  (age 40)
;  (age 30)

;  (exec 0 (, (age $x) (age 40)) 
;                           (O  (+ (Age 40)) 
;                             (- (age $x))))



; (case b)
; (case c)
; (exec 0 (, (case a) (case $x)) (O (+ a) (- (case $x) )))
; (exec 0 (, (case b) (case $x)) (O (+ b) (- (case $x) )))
; (exec 0 (, (case c) (case $x)) (O (+ c) (- (case $x) )))

; (case b)
; (case c)
; (exec 0 (, (case a) (exec 0 $p $t)) (O (+ a) (- (exec 0 $p $t) )))
; (exec 0 (, (case b) (exec 0 $p $t)) (O (+ b) (- (exec 0 $p $t) )))
; (exec 0 (, (case c) (exec 0 $p $t)) (O (+ c) (- (exec 0 $p $t) )))


; (count (S (S (S (S Z)))) )

; (exec 0 (, (count (S $k)) (exec 0 $p $q)) 
;           (O (+ (exec 0 $p $q))
;              (- (count (S $k))) 
;              (+ (count $k))
;              (+ (here $k))))


(db (Inheritance Allen human))
(db (Inheritance Abe human))
(db (Inheritance Cason human))
(db (Inheritance Lily human))
(db (Inheritance Emily human))
(db (Inheritance Lucy human) )
(db (Inheritance Emily human))
(db (Inheritance Lucy Human) )


(exec 0 (, (db ($link $x $z))) (O 
      (count (Result $y) $y ($x $z) )))


; (exec 2
;     (, (db ($link $x $y)))
;     (O 
;         (count (Count $link $str) $str ($x $y))
;     )
; )