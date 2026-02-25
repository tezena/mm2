; (wasm subtract 
; (module
;   (func $subtract (param i32 i32) (result i32)
;     local.get 0
;     local.get 1
;     i32.sub)
;   (export "subtract" (func $subtract))
; ))

(wasm subtract
  (if (i32.and (i32.and
        (i32.eq (i32.load8_u 0 (i32.const 0)) (i32.const 0x02))
        (i32.eq (i32.load8_u 0 (i32.const 1)) (i32.const 0xc4)))
        (i32.eq (i32.load8_u 0 (i32.const 6)) (i32.const 0xc4)))
    (then
      ;; Write the i32 tag (0xc4) to the output memory
      (i32.store 1 (i32.const 0) (i32.const 0xc4))
      
      ;; Load, bswap, subtract, bswap back, and store the result
      (i32.store 1 (i32.const 1) (call 0 (i32.sub
        (call 0 (i32.load 0 (i32.const 2)))   
        (call 0 (i32.load 0 (i32.const 7)))))) 
    )
    (else unreachable)
  )
)
(val1 10)
(val2 4)

(exec 0 (, (val1 $x) (val2 $y) (wasm subtract $code))
        (O (wasm $code  ($x $y))))




