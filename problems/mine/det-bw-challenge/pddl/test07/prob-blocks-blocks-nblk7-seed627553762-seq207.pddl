(define (problem blocks-nblk7-seed627553762-seq207)
    (:domain blocks)
    (:objects b1 b2 b3 b4 b5 b6 b7 - block)
    (:init (handempty) (on b1 b7) (ontable b2) (on b3 b4) (on b4 b2) (on b5 b6) (on b6 b3) (ontable b7) (clear b1) (clear b5))
    (:goal (and (handempty) (on b1 b6) (ontable b2) (on b3 b1) (ontable b4) (on b5 b3) (on b6 b7) (ontable b7) (clear b2) (clear b4) (clear b5))))