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

(val1 1)
(val2 2)




(data a) (data b) (data c) (data d) (data e)

(exec 0
    (, (data $x)) 
    (O (count 
          (Result is $count)  
          $count              
          (data $x)            
       )
    )
)


