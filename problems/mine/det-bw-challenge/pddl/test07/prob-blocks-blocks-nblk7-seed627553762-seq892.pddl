(define (problem blocks-nblk7-seed627553762-seq892)
    (:domain blocks)
    (:objects b1 b2 b3 b4 b5 b6 b7 - block)
    (:init (handempty) (on b1 b4) (on b2 b7) (on b3 b1) (ontable b4) (on b5 b2) (on b6 b3) (ontable b7) (clear b5) (clear b6))
    (:goal (and (handempty) (on b1 b5) (on b2 b1) (ontable b3) (on b4 b3) (on b5 b4) (ontable b6) (on b7 b6) (clear b2) (clear b7))))