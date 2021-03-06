

(define (problem mbw-b15-t3-s484)
(:domain matching-bw-typed)
(:requirements :typing)
(:objects h1 h2 - hand b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15  - block)
(:init
 (empty h1)
 (empty h2)
 (hand-positive h1)
 (hand-negative h2)
 (solid b1)
 (block-positive b1)
 (on b1 b11)
 (solid b2)
 (block-positive b2)
 (on-table b2)
 (solid b3)
 (block-positive b3)
 (on b3 b15)
 (solid b4)
 (block-positive b4)
 (on b4 b13)
 (solid b5)
 (block-positive b5)
 (on b5 b14)
 (solid b6)
 (block-positive b6)
 (on b6 b7)
 (solid b7)
 (block-positive b7)
 (on-table b7)
 (solid b8)
 (block-negative b8)
 (on b8 b12)
 (solid b9)
 (block-negative b9)
 (on b9 b2)
 (solid b10)
 (block-negative b10)
 (on b10 b1)
 (solid b11)
 (block-negative b11)
 (on b11 b9)
 (solid b12)
 (block-negative b12)
 (on-table b12)
 (solid b13)
 (block-negative b13)
 (on b13 b5)
 (solid b14)
 (block-negative b14)
 (on b14 b10)
 (solid b15)
 (block-negative b15)
 (on b15 b8)
 (clear b3)
 (clear b4)
 (clear b6)
)
(:goal
(and
 (on b1 b6)
 (on b2 b13)
 (on b3 b5)
 (on b4 b2)
 (on b5 b14)
 (on b6 b4)
 (on b8 b7)
 (on b9 b8)
 (on b11 b9)
 (on b12 b1)
 (on b13 b11)
 (on b15 b3))
)
)


