(define (problem blocks-nblk7-seed627553762-seq373)
    (:domain blocks)
    (:objects b1 b2 b3 b4 b5 b6 b7 - block)
    (:init (handempty) (on b1 b5) (on b2 b3) (on b3 b7) (on b4 b1) (ontable b5) (on b6 b4) (on b7 b6) (clear b2))
    (:goal (and (handempty) (ontable b1) (on b2 b6) (ontable b3) (on b4 b7) (on b5 b4) (on b6 b3) (on b7 b2) (clear b1) (clear b5))))
