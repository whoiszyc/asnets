(define (problem blocks-nblk7-seed627553762-seq47)
    (:domain blocks)
    (:objects b1 b2 b3 b4 b5 b6 b7 - block)
    (:init (handempty) (on b1 b7) (ontable b2) (on b3 b6) (ontable b4) (ontable b5) (on b6 b4) (on b7 b5) (clear b1) (clear b2) (clear b3))
    (:goal (and (handempty) (ontable b1) (on b2 b1) (on b3 b4) (ontable b4) (on b5 b2) (on b6 b7) (on b7 b5) (clear b3) (clear b6))))