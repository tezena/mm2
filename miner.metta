; --- 1. The Data (T) ---
; A simple graph where many things point to "B", and "A" points to many things.
(edge A B)
(edge A C)
(edge C B)
(edge D B)
(edge E B)
(edge A F)

; --- 2. Configuration ---
; Minimum Support Threshold (using Peano numbers for logic, or raw numbers for sinks)
; We will use the CountSink feature you provided in main.rs/sinks.rs which uses raw integers.
(threshold 3)

; --- 3. The Seed Pattern (C) ---
; We start with the most abstract pattern: Any edge between two variables.
; Format: (Candidate <Pattern_Structure> <Variables_to_Analyze>)
(Candidate  id (edge $x $y) ($x $y))

; -----------------------------------------------------------------------------
; PHASE 1: EVALUATION (Priority 0)
; "For every Candidate, spawn a counter to check its global support."
; -----------------------------------------------------------------------------
(exec 0
    (, (Candidate $id $pat $vars))
    (O (+ (exec 1
            (, $pat) 
            (O (count (Support $id  $n) $n $pat) 
                (+ (exec 2 (, (Support $id $n ) (Candidate $id $pattern $var) ) 
                     (O (+ (Support-of $pattern $n)) 
                         (- (Support $id $n)))))) 
       )))
)


