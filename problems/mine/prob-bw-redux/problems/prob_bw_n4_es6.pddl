(define (problem prob_bw_4_n4_es6_r406)
  (:domain prob_bw)
  (:objects b1 b2 b3 b4 - block)
  (:init (emptyhand) (on-table b1) (on b2 b1) (on b3 b4) (on b4 b2) (clear b3))
  (:goal (and (emptyhand) (on b1 b3) (on b2 b1) (on-table b3) (on b4 b2) (clear b4)))
)
