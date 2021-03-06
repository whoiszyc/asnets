(define (problem descent-n10-s1)
  (:domain descent)
  (:objects l0 l1 l2 l3 l4 l5 l6 l7 l8 l9 - location)
  (:init (at l0) (alive) (have-rope)
    (descent l0 l1)
    (descent l0 l2)
    (descent l1 l3)
    (descent l1 l4)
    (descent l2 l4)
    (descent l3 l6)
    (descent l4 l5)
    (descent l5 l6)
    (descent l6 l7)
    (descent l6 l8)
    (descent l7 l8)
    (descent l8 l9)
  )
  (:goal (and (at l9) (alive)))
)
