(define (problem blocks-nblk7-seed627553762-seq333)
    (:domain blocks)
    (:objects b1 b2 b3 b4 b5 b6 b7 - block)
    (:init (handempty) (ontable b1) (on b2 b7) (on b3 b4) (on b4 b6) (on b5 b3) (on b6 b2) (ontable b7) (clear b1) (clear b5))
    (:goal (and (handempty) (on b1 b7) (ontable b2) (on b3 b4) (on b4 b2) (ontable b5) (ontable b6) (ontable b7) (clear b1) (clear b3) (clear b5) (clear b6))))
