(define (problem prob_bw_10_n10_es5_r1005)
  (:domain prob_bw)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - block)
  (:init (emptyhand) (on-table b1) (on b2 b9) (on-table b3) (on b4 b10) (on b5 b6) (on b6 b3) (on b7 b4) (on-table b8) (on b9 b7) (on b10 b1) (clear b2) (clear b5) (clear b8))
  (:goal (and (emptyhand) (on b1 b2) (on-table b2) (on b3 b7) (on-table b4) (on b5 b9) (on b6 b3) (on-table b7) (on b8 b5) (on-table b9) (on-table b10) (clear b1) (clear b4) (clear b6) (clear b8) (clear b10)))
)
