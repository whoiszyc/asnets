(define (problem blocks-nblk7-seed627553762-seq310)
    (:domain blocks)
    (:objects b1 b2 b3 b4 b5 b6 b7 - block)
    (:init (handempty) (on b1 b4) (ontable b2) (on b3 b6) (on b4 b7) (on b5 b3) (on b6 b2) (on b7 b5) (clear b1))
    (:goal (and (handempty) (on b1 b7) (on b2 b3) (on b3 b4) (on b4 b5) (on b5 b1) (ontable b6) (ontable b7) (clear b2) (clear b6))))
