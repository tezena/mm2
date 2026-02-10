(db (a x))
(db (a b))
(db (a c))

(dbc (a x d))
(dbc (a b g))
(dbc (a c f))

(exec 0 (, ($d $x)) 
(O (AU (out 0 $x)))

)



; (set 0 (a a))
; (set 0 (b b))

; (set 1 (foo a $x $x $y $y (bar baz) (expr) (one) ))
; (set 1 (foo a $x $x $y $y (bar baz) E (one two) ))
; (set 1 (foo b $x $x $y $z (bar baz) E (one two three) ))


; (exec 0 (, (set 0 $e)) (O (AU (out 0 $e))))
; (exec 0 (, (set 1 $e)) (O (AU (out 1 $e))))