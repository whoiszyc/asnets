(define (problem gripper-16)
(:domain gripper-typed)
(:objects
 rooma roomb - room
 left right - gripper
 ball1 ball2 ball3 ball4 ball5 ball6 ball7 ball8 ball9 ball10 ball11 ball12 ball13 ball14 ball15 ball16 - ball
)
(:init
(free left)
(free right)
(at ball1 rooma)
(at ball2 rooma)
(at ball3 rooma)
(at ball4 rooma)
(at ball5 rooma)
(at ball6 rooma)
(at ball7 rooma)
(at ball8 rooma)
(at ball9 rooma)
(at ball10 rooma)
(at ball11 rooma)
(at ball12 rooma)
(at ball13 rooma)
(at ball14 rooma)
(at ball15 rooma)
(at ball16 rooma)
(at-robby rooma)
)
(:goal
(and
(at ball1 roomb)
(at ball2 roomb)
(at ball3 roomb)
(at ball4 roomb)
(at ball5 roomb)
(at ball6 roomb)
(at ball7 roomb)
(at ball8 roomb)
(at ball9 roomb)
(at ball10 roomb)
(at ball11 roomb)
(at ball12 roomb)
(at ball13 roomb)
(at ball14 roomb)
(at ball15 roomb)
(at ball16 roomb)
)
)
)