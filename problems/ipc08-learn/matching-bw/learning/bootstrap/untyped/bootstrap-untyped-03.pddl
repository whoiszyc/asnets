

(define (problem matching-bw-untyped-n5)
(:domain matching-bw-untyped)
(:objects h1 h2 b1 b2 b3 b4 b5 )
(:init
 (hand h1)
 (hand h2)
 (empty h1)
 (empty h2)
 (hand-positive h1)
 (hand-negative h2)
 (solid b1)
 (block b1)
 (block-positive b1)
 (on-table b1)
 (solid b2)
 (block b2)
 (block-positive b2)
 (on b2 b3)
 (solid b3)
 (block b3)
 (block-negative b3)
 (on b3 b1)
 (solid b4)
 (block b4)
 (block-negative b4)
 (on-table b4)
 (solid b5)
 (block b5)
 (block-negative b5)
 (on b5 b2)
 (clear b4)
 (clear b5)
)
(:goal
(and
 (on b2 b4)
 (on b3 b1))
)
)


