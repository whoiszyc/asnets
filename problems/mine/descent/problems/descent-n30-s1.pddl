(define (problem descent-n30-s1)
  (:domain descent)
  (:objects l00 l01 l02 l03 l04 l05 l06 l07 l08 l09 l10 l11 l12 l13 l14 l15 l16 l17 l18 l19 l20 l21 l22 l23 l24 l25 l26 l27 l28 l29 - location)
  (:init (at l00) (alive) (have-rope)
    (descent l00 l01)
    (descent l01 l02)
    (descent l01 l03)
    (descent l01 l04)
    (descent l02 l03)
    (descent l02 l04)
    (descent l03 l04)
    (descent l04 l05)
    (descent l05 l06)
    (descent l05 l07)
    (descent l06 l08)
    (descent l07 l08)
    (descent l07 l09)
    (descent l07 l10)
    (descent l08 l09)
    (descent l09 l11)
    (descent l10 l11)
    (descent l10 l12)
    (descent l11 l12)
    (descent l12 l13)
    (descent l13 l14)
    (descent l13 l15)
    (descent l13 l16)
    (descent l14 l15)
    (descent l15 l17)
    (descent l15 l18)
    (descent l16 l17)
    (descent l16 l18)
    (descent l16 l19)
    (descent l17 l18)
    (descent l18 l21)
    (descent l19 l20)
    (descent l19 l21)
    (descent l20 l22)
    (descent l21 l24)
    (descent l22 l23)
    (descent l22 l24)
    (descent l23 l24)
    (descent l23 l25)
    (descent l24 l25)
    (descent l25 l26)
    (descent l25 l27)
    (descent l25 l28)
    (descent l26 l27)
    (descent l26 l29)
    (descent l27 l28)
    (descent l28 l29)
  )
  (:goal (and (at l29) (alive)))
)