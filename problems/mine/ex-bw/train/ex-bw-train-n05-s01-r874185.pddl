(define (problem ex-bw-train-n05-s01-r874185)
  (:domain exploding-blocksworld)
  (:objects b1 b2 b3 b4 b5 - block)
  (:init (emptyhand) (on b1 b2) (on-table b2) (on-table b3) (on-table b4) (on b5 b1) (clear b3) (clear b4) (clear b5) (no-detonated b1) (no-destroyed b1) (no-detonated b2) (no-destroyed b2) (no-detonated b3) (no-destroyed b3) (no-detonated b4) (no-destroyed b4) (no-detonated b5) (no-destroyed b5) (no-destroyed-table))
  (:goal (and (on b1 b2) (on-table b2) (on-table b3) (on b4 b3) (on b5 b1)  )
)
)
