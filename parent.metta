;  Tom x Pam            Moh
;   |   \               / \
;  Liz  Bob     Xey x Yip Zac x Whu
;       / \         |         |
;    Ann   Pat     Uru   x   Vic
;           |            |
;          Jim          Ohm
(parent Tom Bob) (parent Xey Uru)
(parent Pam Bob) (parent Yip Uru)
(parent Tom Liz) (parent Zac Vic)
(parent Bob Ann) (parent Whu Vic)
(parent Bob Pat) (parent Uru Ohm)
(parent Pat Jim) (parent Vic Ohm)
(parent Moh Zac)  (parent Moh Yip)
(female Pam) (female Liz) (female Pat) (female Ann) (female Vic) (female Yip) (female Whu)
(male Tom) (male Bob) (male Jim) (male Uru) (male Xey) (male Zac)
(other Ohm)

(exec (0 0) (, (parent $p $c)) (, (child $c $p)))

(exec (0 1) (, (poi $c) (child $c $p)) (, (generation Z $c $p)))

(exec (1 Z) (, (exec (1 $g) $sink $temp) 
               (generation $g $c $p) (child $p $gp))
            (, (exec (1 (S $g) $sink $temp)) 
                (generation (S $g) $c $gp)))



(exec (1 Z) (, (exec (1 $l) $ps $ts)
               (generation $l $c $p) (child $p $gp) )
            (, (exec (1 (S $l)) $ps $ts)
               (generation (S $l) $c $gp) ))


(exec (2 0) (, (generation $g $c $a))
             (, (ancestor $a $c)))

(poi Jim)
(poi Ohm)
