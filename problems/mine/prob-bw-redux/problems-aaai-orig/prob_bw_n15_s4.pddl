(define (problem prob_bw_15_n15_s4)
  (:domain prob_bw)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 - block)
  (:init (emptyhand) (on b1 b2) (on b2 b15) (on b3 b11) (on b4 b12) (on-table b5) (on-table b6) (on b7 b13) (on b8 b14) (on b9 b10) (on b10 b5) (on b11 b4) (on b12 b7) (on-table b13) (on b14 b6) (on b15 b8) (clear b1) (clear b3) (clear b9))
  (:goal (and (emptyhand) (on b1 b5) (on b2 b6) (on b3 b9) (on b4 b3) (on b5 b7) (on-table b6) (on-table b7) (on b8 b14) (on b9 b2) (on-table b10) (on b11 b12) (on-table b12) (on-table b13) (on b14 b10) (on b15 b1) (clear b4) (clear b8) (clear b11) (clear b13) (clear b15)))
)