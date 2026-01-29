(INPUT
   (if (or (1) 
           (not (and (or (1) (0))
                     (1)
                )
           )
       )
       (and (1) 
            (or (0) (1))
       )
   )
)


; (ctor bool 1)
; (ctor bool 0)

; (ctor bool-expr ($x))
; (ctor bool-expr ($x))
; (ctor bool-expr (and $x $y))
; (ctor bool-expr (or  $x $y))
; (ctor bool-expr (xor $x $y))
; (ctor bool-expr (if  $x $y))



(eval (and 0 0) -> 0)
(eval (and 0 1) -> 0)
(eval (and 1 0) -> 0)
(eval (and 1 1) -> 1)

(eval (or 0 0) -> 0)
(eval (or 0 1) -> 1)
(eval (or 1 0) -> 1)
(eval (or 1 1) -> 1)

(eval (if 0 0) -> 1)
(eval (if 0 1) -> 1)
(eval (if 1 0) -> 0)
(eval (if 1 1) -> 1)

(eval (not 0) -> 1)
(eval (not 1) -> 0)

(eval (0) -> 0)
(eval (1) -> 1)