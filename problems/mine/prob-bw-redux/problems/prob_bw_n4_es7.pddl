(define (problem prob_bw_4_n4_es7_r407)
  (:domain prob_bw)
  (:objects b1 b2 b3 b4 - block)
  (:init (emptyhand) (on-table b1) (on b2 b3) (on-table b3) (on b4 b1) (clear b2) (clear b4))
  (:goal (and (emptyhand) (on-table b1) (on-table b2) (on b3 b1) (on b4 b2) (clear b3) (clear b4)))
)
