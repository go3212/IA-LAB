(define (problem software-project-instance1)
    (:domain software-project)
    (:objects
        programmer1 programmer2 programmer3 programmer4 - programmer
        task1 task2 - task)
    (:init
        ; Programmers
        (= (skill programmer1) 3)
        (= (quality programmer1) 1)

        (= (skill programmer2) 2)
        (= (quality programmer2) 1)

        (= (skill programmer3) 3)
        (= (quality programmer3) 2)

        (= (skill programmer4) 2)
        (= (quality programmer4) 2)

        ; Tasks
        (= (difficulty task1) 2)
        (= (difficulty task2) 3)

        (= (total-hours) 0)
    )
    (:goal
        (forall (?t - task) (and (task-assigned ?t) (reviewed ?t)))
    )
    (:metric minimize (total-hours))
)
