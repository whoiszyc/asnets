(define (problem blocks-nblk7-seed627553762-seq684)
    (:domain blocks)
    (:objects b1 b2 b3 b4 b5 b6 b7 - block)
    (:init (handempty) (on b1 b7) (on b2 b5) (on b3 b6) (on b4 b1) (ontable b5) (ontable b6) (on b7 b2) (clear b3) (clear b4))
    (:goal (and (handempty) (on b1 b3) (on b2 b5) (on b3 b4) (on b4 b6) (ontable b5) (on b6 b2) (on b7 b1) (clear b7))))
