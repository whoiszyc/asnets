(define (problem descent-n2-s1)
  (:domain descent)
  (:objects l0 l1 - location)
  (:init (at l0) (alive) (have-rope)
    (descent l0 l1)
  )
  (:goal (and (at l1) (alive)))
)