(db (Inheritance Allen sodaDrinker))
(db (Inheritance Abe sodaDrinker))
(db (Inheritance Lily sodaDrinker))
(db (Inheritance Cason sodaDrinker))

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

(db (Inheritanc Allen human))
(db (Inheritanc Abe human))
(db (Inheritanc Cason human))
(db (Inheritanc Lily human))
(db (Inheritanc Emily human))
(db (Inheritanc Lucy human) )



(exec 0 (, (db $x)) 
(O (AU (out 0 $x)))
)

(out 0 ($a $b $c))




; (set 0 (a a))
; (set 0 (b b))

; (set 1 (foo a $x $x $y $y (bar baz) (expr) (one) ))
; (set 1 (foo a $x $x $y $y (bar baz) E (one two) ))
; (set 1 (foo b $x $x $y $z (bar baz) E (one two three) ))


; (exec 0 (, (set 0 $e)) (O (AU (out 0 $e))))
; (exec 0 (, (set 1 $e)) (O (AU (out 1 $e))))