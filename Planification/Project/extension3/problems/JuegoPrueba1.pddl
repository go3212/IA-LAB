(define (problem software-project-instance-1)
    (:domain software-project)
    (:objects
        programmer1 programmer2 programmer3 programmer4 programmer5 programmer6 - programmer
        task1 task2 task3 task4 task5 task6 task7 - task)
    (:init
        ; Programmers
        (= (skill programmer1) 1)
        (= (quality programmer1) 2)
        (= (task-count programmer1) 0)
        
        (= (skill programmer2) 2)
        (= (quality programmer2) 2)
        (= (task-count programmer2) 0)

        (= (skill programmer3) 3)
        (= (quality programmer3) 1)
        (= (task-count programmer3) 0)

        (= (skill programmer4) 3)
        (= (quality programmer4) 2)
        (= (task-count programmer4) 0)

        (= (skill programmer5) 2)
        (= (quality programmer5) 1)
        (= (task-count programmer5) 0)

        (= (skill programmer6) 1)
        (= (quality programmer6) 2)
        (= (task-count programmer6) 0)

        ; Tasks
        (= (difficulty task1) 2)
        (= (difficulty task2) 3)
        (= (difficulty task3) 1)
        (= (difficulty task4) 2)
        (= (difficulty task5) 3)
        (= (difficulty task6) 1)
        (= (difficulty task7) 3)

        (= (total-hours) 0)
        (= (working) 0)
    )
    (:goal
        (forall (?t - task) 
            (and
                (task-assigned ?t)
                (reviewed ?t))
        )
    )
    (:metric maximize (working))
)
