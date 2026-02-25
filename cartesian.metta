; (letter a)
; (letter b)
; (letter c)


; (num 1)
; (num 2)
; (num 3)


; (exec 0 (, (num $num) (letter $letter))
;         (O (+ (product $num $letter))))



(= (data) ($x 2 3 $y $x $z))


(= (get-vars $list) (
    (if (== $list ()) () (let* (
        (true (println! (noot Empty)))
        (($head $tail) (decons-atom $list))
        ( $var (if (== (get-metatype $head) Variable) $head ()))
        ( $rvar (get-vars $tail))
    ) (cons-atom $var $rvar)))
))

!(get-vars ($x 2 3 $y $x $z))

(($_48522 (() (() ($_48558 ($_48522 ($_48582 ())))))))