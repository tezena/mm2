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

(db (Inheritance Allen human))
(db (Inheritance Abe human))
(db (Inheritance Cason human))
(db (Inheritance Lily human))
(db (Inheritance Emily human))
(db (Inheritance Lucy human) )









;  Count Links 
(exec 2
    (, (db ($link $x $y)))
    (O 
        (count (Count $link $str) $str ($x $y))
    )
)