(define (problem blocks-nblk9-ntow1-seed129483654-seq7)
    (:domain blocks)
    (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 - block)
    (:init (handempty) (ontable b1) (on b2 b8) (on b3 b5) (on b4 b3) (on b5 b7) (on b6 b2) (on b7 b1) (on b8 b4) (on b9 b6) (clear b9))
    (:goal (and (handempty) (ontable b1) (on b2 b3) (on b3 b4) (on b4 b6) (on b5 b7) (on b6 b5) (on b7 b9) (on b8 b2) (on b9 b1) (clear b8))))