(kb (: ⟨a2⟩ (-> (: $a ⟨term⟩) (: (⟨=⟩ (⟨+⟩ $a ⟨0⟩) $a) ⟨|-⟩))))
(kb (: ⟨t⟩ ⟨term⟩))

; (exec aaa
;   (, (ev (: $name (-> $a $b)))
;      (ev $a))
;   (, (ev $b)
;      (applied ($name $a) to get $b)))

; The definition is just data, 
;   the point is to find this data that has a useful shape dynamically.
((union ($in_a $in_b) -> $out)
    (, ($in_a $a)           
       ($in_b $b)
    )
    (, ($out $a)
       ($out $b)
    )
)
; the argument data
(arg_a a)
(arg_a b)
(arg_b b)
(arg_a c)
(arg_b c)
(arg_b d)
(arg_b e)
(arg_b f)

; what will search up our definition
(exec 0 (, ((union (arg_a arg_b) -> ret) $p $t) )
        (, (exec 0 $p $t) )
)

((intersection ($in_a $in_b) -> $out) 
  (, ($in_a $inter) 
     ($in_b $inter))
  (, ($out $inter)))


(exec 1 (, ((intersection (arg_a arg_b) -> inter_)  $x $y) )
       (, (exec 1 $x $y)))

((difference ($in-a-loc $in-b-loc) -> $out-loc) 
  )

(exec 0 (, $x) 
         (, 1 
         (exec 0 (, 1) 
          (, 2 
          (exec 0 (, 2)
           (, 3))))))



(counter (S (S (S Z))))
(exec LOOP (, (counter (S $N))
              (exec LOOP $p $t)
           )
           (O  (+ (exec LOOP $p $t)   ) 
               (- (counter (S $N)) )
               (+ (counter $N)     )
           )
)