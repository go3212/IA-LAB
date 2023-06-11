(define (problem software-project-instance)
    (:domain software-project)
    (:objects
        programmer1 programmer2 - programmer
        task1 task2 task3 - task)
    (:init
        ; Programmers
        (= (skill programmer1) 2)
        (= (quality programmer1) 1)

        (= (skill programmer2) 3)
        (= (quality programmer2) 1)

        ; Tasks
        (= (difficulty task1) 1)

        (= (difficulty task2) 2)

        (= (difficulty task3) 3)

        (= (total-hours) 0)
    )
    (:goal
        (forall (?t - task) (and (task-assigned ?t) (reviewed ?t)))
    )
    (:metric minimize (total-hours))
)
