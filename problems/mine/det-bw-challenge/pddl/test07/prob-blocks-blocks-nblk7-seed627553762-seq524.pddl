(define (problem blocks-nblk7-seed627553762-seq524)
    (:domain blocks)
    (:objects b1 b2 b3 b4 b5 b6 b7 - block)
    (:init (handempty) (on b1 b7) (on b2 b3) (on b3 b1) (ontable b4) (on b5 b2) (on b6 b4) (ontable b7) (clear b5) (clear b6))
    (:goal (and (handempty) (ontable b1) (ontable b2) (on b3 b7) (on b4 b6) (on b5 b3) (on b6 b1) (on b7 b4) (clear b2) (clear b5))))