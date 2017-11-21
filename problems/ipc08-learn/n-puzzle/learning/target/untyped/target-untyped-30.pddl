(define (problem n-puzzle-target-7x7-05)
  (:domain n-puzzle-untyped)
  (:objects p_1_1 p_1_2 p_1_3 p_1_4 p_1_5 p_1_6 p_1_7 p_2_1 p_2_2 p_2_3 p_2_4 p_2_5 p_2_6 p_2_7 p_3_1 p_3_2 p_3_3 p_3_4 p_3_5 p_3_6 p_3_7 p_4_1 p_4_2 p_4_3 p_4_4 p_4_5 p_4_6 p_4_7 p_5_1 p_5_2 p_5_3 p_5_4 p_5_5 p_5_6 p_5_7 p_6_1 p_6_2 p_6_3 p_6_4 p_6_5 p_6_6 p_6_7 p_7_1 p_7_2 p_7_3 p_7_4 p_7_5 p_7_6 p_7_7 t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 t_10 t_11 t_12 t_13 t_14 t_15 t_16 t_17 t_18 t_19 t_20 t_21 t_22 t_23 t_24 t_25 t_26 t_27 t_28 t_29 t_30 t_31 t_32 t_33 t_34 t_35 t_36 t_37 t_38 t_39 t_40 t_41 t_42 t_43 t_44 t_45 t_46 t_47 t_48)
  (:init
    (position p_1_1)
    (position p_1_2)
    (position p_1_3)
    (position p_1_4)
    (position p_1_5)
    (position p_1_6)
    (position p_1_7)
    (position p_2_1)
    (position p_2_2)
    (position p_2_3)
    (position p_2_4)
    (position p_2_5)
    (position p_2_6)
    (position p_2_7)
    (position p_3_1)
    (position p_3_2)
    (position p_3_3)
    (position p_3_4)
    (position p_3_5)
    (position p_3_6)
    (position p_3_7)
    (position p_4_1)
    (position p_4_2)
    (position p_4_3)
    (position p_4_4)
    (position p_4_5)
    (position p_4_6)
    (position p_4_7)
    (position p_5_1)
    (position p_5_2)
    (position p_5_3)
    (position p_5_4)
    (position p_5_5)
    (position p_5_6)
    (position p_5_7)
    (position p_6_1)
    (position p_6_2)
    (position p_6_3)
    (position p_6_4)
    (position p_6_5)
    (position p_6_6)
    (position p_6_7)
    (position p_7_1)
    (position p_7_2)
    (position p_7_3)
    (position p_7_4)
    (position p_7_5)
    (position p_7_6)
    (position p_7_7)
    (tile t_1)
    (tile t_2)
    (tile t_3)
    (tile t_4)
    (tile t_5)
    (tile t_6)
    (tile t_7)
    (tile t_8)
    (tile t_9)
    (tile t_10)
    (tile t_11)
    (tile t_12)
    (tile t_13)
    (tile t_14)
    (tile t_15)
    (tile t_16)
    (tile t_17)
    (tile t_18)
    (tile t_19)
    (tile t_20)
    (tile t_21)
    (tile t_22)
    (tile t_23)
    (tile t_24)
    (tile t_25)
    (tile t_26)
    (tile t_27)
    (tile t_28)
    (tile t_29)
    (tile t_30)
    (tile t_31)
    (tile t_32)
    (tile t_33)
    (tile t_34)
    (tile t_35)
    (tile t_36)
    (tile t_37)
    (tile t_38)
    (tile t_39)
    (tile t_40)
    (tile t_41)
    (tile t_42)
    (tile t_43)
    (tile t_44)
    (tile t_45)
    (tile t_46)
    (tile t_47)
    (tile t_48)
    (at t_48 p_1_1)
    (at t_25 p_1_2)
    (at t_5 p_1_3)
    (at t_13 p_1_4)
    (at t_26 p_1_5)
    (at t_35 p_1_6)
    (at t_41 p_1_7)
    (at t_15 p_2_1)
    (at t_24 p_2_2)
    (at t_31 p_2_3)
    (at t_29 p_2_4)
    (at t_23 p_2_5)
    (at t_33 p_2_6)
    (at t_30 p_2_7)
    (at t_28 p_3_1)
    (at t_17 p_3_2)
    (at t_37 p_3_3)
    (at t_32 p_3_4)
    (at t_19 p_3_5)
    (at t_1 p_3_6)
    (at t_4 p_3_7)
    (at t_21 p_4_1)
    (at t_22 p_4_2)
    (at t_6 p_4_3)
    (at t_10 p_4_4)
    (at t_40 p_4_5)
    (at t_9 p_4_6)
    (at t_43 p_4_7)
    (at t_7 p_5_1)
    (at t_3 p_5_2)
    (at t_8 p_5_3)
    (at t_14 p_5_4)
    (at t_2 p_5_5)
    (at t_36 p_5_6)
    (at t_18 p_5_7)
    (at t_11 p_6_1)
    (at t_46 p_6_2)
    (at t_44 p_6_3)
    (at t_16 p_6_4)
    (empty p_6_5)
    (at t_39 p_6_6)
    (at t_27 p_6_7)
    (at t_47 p_7_1)
    (at t_38 p_7_2)
    (at t_34 p_7_3)
    (at t_42 p_7_4)
    (at t_45 p_7_5)
    (at t_20 p_7_6)
    (at t_12 p_7_7)
    (neighbor p_1_1 p_1_2)
    (neighbor p_1_2 p_1_1)
    (neighbor p_1_2 p_1_3)
    (neighbor p_1_3 p_1_2)
    (neighbor p_1_3 p_1_4)
    (neighbor p_1_4 p_1_3)
    (neighbor p_1_4 p_1_5)
    (neighbor p_1_5 p_1_4)
    (neighbor p_1_5 p_1_6)
    (neighbor p_1_6 p_1_5)
    (neighbor p_1_6 p_1_7)
    (neighbor p_1_7 p_1_6)
    (neighbor p_2_1 p_2_2)
    (neighbor p_2_2 p_2_1)
    (neighbor p_2_2 p_2_3)
    (neighbor p_2_3 p_2_2)
    (neighbor p_2_3 p_2_4)
    (neighbor p_2_4 p_2_3)
    (neighbor p_2_4 p_2_5)
    (neighbor p_2_5 p_2_4)
    (neighbor p_2_5 p_2_6)
    (neighbor p_2_6 p_2_5)
    (neighbor p_2_6 p_2_7)
    (neighbor p_2_7 p_2_6)
    (neighbor p_3_1 p_3_2)
    (neighbor p_3_2 p_3_1)
    (neighbor p_3_2 p_3_3)
    (neighbor p_3_3 p_3_2)
    (neighbor p_3_3 p_3_4)
    (neighbor p_3_4 p_3_3)
    (neighbor p_3_4 p_3_5)
    (neighbor p_3_5 p_3_4)
    (neighbor p_3_5 p_3_6)
    (neighbor p_3_6 p_3_5)
    (neighbor p_3_6 p_3_7)
    (neighbor p_3_7 p_3_6)
    (neighbor p_4_1 p_4_2)
    (neighbor p_4_2 p_4_1)
    (neighbor p_4_2 p_4_3)
    (neighbor p_4_3 p_4_2)
    (neighbor p_4_3 p_4_4)
    (neighbor p_4_4 p_4_3)
    (neighbor p_4_4 p_4_5)
    (neighbor p_4_5 p_4_4)
    (neighbor p_4_5 p_4_6)
    (neighbor p_4_6 p_4_5)
    (neighbor p_4_6 p_4_7)
    (neighbor p_4_7 p_4_6)
    (neighbor p_5_1 p_5_2)
    (neighbor p_5_2 p_5_1)
    (neighbor p_5_2 p_5_3)
    (neighbor p_5_3 p_5_2)
    (neighbor p_5_3 p_5_4)
    (neighbor p_5_4 p_5_3)
    (neighbor p_5_4 p_5_5)
    (neighbor p_5_5 p_5_4)
    (neighbor p_5_5 p_5_6)
    (neighbor p_5_6 p_5_5)
    (neighbor p_5_6 p_5_7)
    (neighbor p_5_7 p_5_6)
    (neighbor p_6_1 p_6_2)
    (neighbor p_6_2 p_6_1)
    (neighbor p_6_2 p_6_3)
    (neighbor p_6_3 p_6_2)
    (neighbor p_6_3 p_6_4)
    (neighbor p_6_4 p_6_3)
    (neighbor p_6_4 p_6_5)
    (neighbor p_6_5 p_6_4)
    (neighbor p_6_5 p_6_6)
    (neighbor p_6_6 p_6_5)
    (neighbor p_6_6 p_6_7)
    (neighbor p_6_7 p_6_6)
    (neighbor p_7_1 p_7_2)
    (neighbor p_7_2 p_7_1)
    (neighbor p_7_2 p_7_3)
    (neighbor p_7_3 p_7_2)
    (neighbor p_7_3 p_7_4)
    (neighbor p_7_4 p_7_3)
    (neighbor p_7_4 p_7_5)
    (neighbor p_7_5 p_7_4)
    (neighbor p_7_5 p_7_6)
    (neighbor p_7_6 p_7_5)
    (neighbor p_7_6 p_7_7)
    (neighbor p_7_7 p_7_6)
    (neighbor p_1_1 p_2_1)
    (neighbor p_2_1 p_1_1)
    (neighbor p_1_2 p_2_2)
    (neighbor p_2_2 p_1_2)
    (neighbor p_1_3 p_2_3)
    (neighbor p_2_3 p_1_3)
    (neighbor p_1_4 p_2_4)
    (neighbor p_2_4 p_1_4)
    (neighbor p_1_5 p_2_5)
    (neighbor p_2_5 p_1_5)
    (neighbor p_1_6 p_2_6)
    (neighbor p_2_6 p_1_6)
    (neighbor p_1_7 p_2_7)
    (neighbor p_2_7 p_1_7)
    (neighbor p_2_1 p_3_1)
    (neighbor p_3_1 p_2_1)
    (neighbor p_2_2 p_3_2)
    (neighbor p_3_2 p_2_2)
    (neighbor p_2_3 p_3_3)
    (neighbor p_3_3 p_2_3)
    (neighbor p_2_4 p_3_4)
    (neighbor p_3_4 p_2_4)
    (neighbor p_2_5 p_3_5)
    (neighbor p_3_5 p_2_5)
    (neighbor p_2_6 p_3_6)
    (neighbor p_3_6 p_2_6)
    (neighbor p_2_7 p_3_7)
    (neighbor p_3_7 p_2_7)
    (neighbor p_3_1 p_4_1)
    (neighbor p_4_1 p_3_1)
    (neighbor p_3_2 p_4_2)
    (neighbor p_4_2 p_3_2)
    (neighbor p_3_3 p_4_3)
    (neighbor p_4_3 p_3_3)
    (neighbor p_3_4 p_4_4)
    (neighbor p_4_4 p_3_4)
    (neighbor p_3_5 p_4_5)
    (neighbor p_4_5 p_3_5)
    (neighbor p_3_6 p_4_6)
    (neighbor p_4_6 p_3_6)
    (neighbor p_3_7 p_4_7)
    (neighbor p_4_7 p_3_7)
    (neighbor p_4_1 p_5_1)
    (neighbor p_5_1 p_4_1)
    (neighbor p_4_2 p_5_2)
    (neighbor p_5_2 p_4_2)
    (neighbor p_4_3 p_5_3)
    (neighbor p_5_3 p_4_3)
    (neighbor p_4_4 p_5_4)
    (neighbor p_5_4 p_4_4)
    (neighbor p_4_5 p_5_5)
    (neighbor p_5_5 p_4_5)
    (neighbor p_4_6 p_5_6)
    (neighbor p_5_6 p_4_6)
    (neighbor p_4_7 p_5_7)
    (neighbor p_5_7 p_4_7)
    (neighbor p_5_1 p_6_1)
    (neighbor p_6_1 p_5_1)
    (neighbor p_5_2 p_6_2)
    (neighbor p_6_2 p_5_2)
    (neighbor p_5_3 p_6_3)
    (neighbor p_6_3 p_5_3)
    (neighbor p_5_4 p_6_4)
    (neighbor p_6_4 p_5_4)
    (neighbor p_5_5 p_6_5)
    (neighbor p_6_5 p_5_5)
    (neighbor p_5_6 p_6_6)
    (neighbor p_6_6 p_5_6)
    (neighbor p_5_7 p_6_7)
    (neighbor p_6_7 p_5_7)
    (neighbor p_6_1 p_7_1)
    (neighbor p_7_1 p_6_1)
    (neighbor p_6_2 p_7_2)
    (neighbor p_7_2 p_6_2)
    (neighbor p_6_3 p_7_3)
    (neighbor p_7_3 p_6_3)
    (neighbor p_6_4 p_7_4)
    (neighbor p_7_4 p_6_4)
    (neighbor p_6_5 p_7_5)
    (neighbor p_7_5 p_6_5)
    (neighbor p_6_6 p_7_6)
    (neighbor p_7_6 p_6_6)
    (neighbor p_6_7 p_7_7)
    (neighbor p_7_7 p_6_7))
  (:goal (and
    (at t_1 p_1_1)
    (at t_2 p_1_2)
    (at t_3 p_1_3)
    (at t_4 p_1_4)
    (at t_5 p_1_5)
    (at t_6 p_1_6)
    (at t_7 p_1_7)
    (at t_8 p_2_1)
    (at t_9 p_2_2)
    (at t_10 p_2_3)
    (at t_11 p_2_4)
    (at t_12 p_2_5)
    (at t_13 p_2_6)
    (at t_14 p_2_7)
    (at t_15 p_3_1)
    (at t_16 p_3_2)
    (at t_17 p_3_3)
    (at t_18 p_3_4)
    (at t_19 p_3_5)
    (at t_20 p_3_6)
    (at t_21 p_3_7)
    (at t_22 p_4_1)
    (at t_23 p_4_2)
    (at t_24 p_4_3)
    (at t_25 p_4_4)
    (at t_26 p_4_5)
    (at t_27 p_4_6)
    (at t_28 p_4_7)
    (at t_29 p_5_1)
    (at t_30 p_5_2)
    (at t_31 p_5_3)
    (at t_32 p_5_4)
    (at t_33 p_5_5)
    (at t_34 p_5_6)
    (at t_35 p_5_7)
    (at t_36 p_6_1)
    (at t_37 p_6_2)
    (at t_38 p_6_3)
    (at t_39 p_6_4)
    (at t_40 p_6_5)
    (at t_41 p_6_6)
    (at t_42 p_6_7)
    (at t_43 p_7_1)
    (at t_44 p_7_2)
    (at t_45 p_7_3)
    (at t_46 p_7_4)
    (at t_47 p_7_5)
    (at t_48 p_7_6))))
