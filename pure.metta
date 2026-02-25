


(val1 2)
(val2 2)


(exec 0
    (, (val1 $x) (val2 $y))
    (O (pure (sum is $res) $res 
          (i8_to_string                 
              (sum_i8                    
                  (i8_from_string $x)    
                  (i8_from_string $y)    
              )
          )
       )
    )
)






