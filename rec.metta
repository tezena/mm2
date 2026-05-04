; (count (S (S (S Z))))


; (exec final (, (count Z)) 
;             (O (+ (Hi from final))
;                (-  (count Z))))

               
; (exec 0 (, 
;            (count (S $k)) 
;            (exec 0 $p $q)
;         )   
;         (O (+ (exec 0 $p $q))
;            (+ (count $k))
;            (- (count  (S $k)))
;            (+ (Hello  $k))
;                     ))

 (Human Eyob Derese)
 (Man Eyob Derese)
 (Nice Eyob Derese)

(exec 0 (, (Human $x Derese)(Man $x Derese) (Nice $x Derese) )
                         (, (queryResult $x)))



(queryResult Eyob)

; !(mm2-exec &mork 1)
; !(match &mork (queryResult $x) (queryResult $x))



(: match-&mork (-> Expression Expression Expression))
(= (match-&mork $pattern $Pat) 
   (quote (progn (match &mork $pattern $pattern)
          $Pat)))

          
!(add-translator-rule! match-&mork)