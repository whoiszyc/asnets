(define (problem blocks-nblk7-seed627553762-seq404)
    (:domain blocks)
    (:objects b1 b2 b3 b4 b5 b6 b7 - block)
    (:init (handempty) (ontable b1) (ontable b2) (on b3 b5) (on b4 b7) (on b5 b4) (on b6 b1) (ontable b7) (clear b2) (clear b3) (clear b6))
    (:goal (and (handempty) (on b1 b3) (on b2 b6) (on b3 b4) (on b4 b7) (ontable b5) (on b6 b5) (ontable b7) (clear b1) (clear b2))))
