(define (problem software-project-instance-2)
    (:domain software-project)
    (:objects
        programmer1 programmer2 programmer3 programmer4 programmer5 programmer6 programmer7 programmer8 - programmer
        task1 task2 task3 task4 task5 task6 - task)
    (:init
        ; Programmers
        (= (skill programmer1) 1)
        (= (quality programmer1) 1)
        (= (task-count programmer1) 0)
        
        (= (skill programmer2) 3)
        (= (quality programmer2) 1)
        (= (task-count programmer2) 0)

        (= (skill programmer3) 3)
        (= (quality programmer3) 2)
        (= (task-count programmer3) 0)

        (= (skill programmer4) 1)
        (= (quality programmer4) 2)
        (= (task-count programmer4) 0)

        (= (skill programmer5) 2)
        (= (quality programmer5) 2)
        (= (task-count programmer5) 0)

        (= (skill programmer6) 1)
        (= (quality programmer6) 1)
        (= (task-count programmer6) 0)

        (= (skill programmer7) 2)
        (= (quality programmer7) 1)
        (= (task-count programmer7) 0)

        (= (skill programmer8) 3)
        (= (quality programmer8) 2)
        (= (task-count programmer8) 0)

        ; Tasks
        (= (difficulty task1) 3)
        (= (difficulty task2) 3)
        (= (difficulty task3) 2)
        (= (difficulty task4) 1)
        (= (difficulty task5) 2)
        (= (difficulty task6) 3)

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
    (:metric minimize (total-hours))
)
