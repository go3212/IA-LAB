(define (problem software-project-instance2)
    (:domain software-project)
    (:objects
        programmer1 programmer2 programmer3 programmer4 programmer5 programmer6 - programmer
        task1 task2 task3 - task)
    (:init
        ; Programmers
        (= (skill programmer1) 3)
        (= (quality programmer1) 1)

        (= (skill programmer2) 2)
        (= (quality programmer2) 1)

        (= (skill programmer3) 3)
        (= (quality programmer3) 2)

        (= (skill programmer4) 1)
        (= (quality programmer4) 1)

        (= (skill programmer5) 2)
        (= (quality programmer5) 1)

        (= (skill programmer6) 3)
        (= (quality programmer6) 2)

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
