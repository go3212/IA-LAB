(define (problem large-software-project-instance)
    (:domain software-project)
    (:objects
        programmer1 programmer2 programmer3 programmer4 programmer5 programmer6 programmer7 programmer8 programmer9 programmer10 - programmer
        task1 task2 task3 task4 task5 task6 task7 - task)
    (:init
        ; Programmers
        (= (skill programmer1) 1)
        (= (quality programmer1) 1)
        (= (task-count programmer1) 0)
        
        (= (skill programmer2) 2)
        (= (quality programmer2) 2)
        (= (task-count programmer2) 0)

        (= (skill programmer3) 3)
        (= (quality programmer3) 1)
        (= (task-count programmer3) 0)

        (= (skill programmer4) 1)
        (= (quality programmer4) 2)
        (= (task-count programmer4) 0)

        (= (skill programmer5) 2)
        (= (quality programmer5) 1)
        (= (task-count programmer5) 0)

        (= (skill programmer6) 3)
        (= (quality programmer6) 2)
        (= (task-count programmer6) 0)

        (= (skill programmer7) 1)
        (= (quality programmer7) 1)
        (= (task-count programmer7) 0)

        (= (skill programmer8) 2)
        (= (quality programmer8) 2)
        (= (task-count programmer8) 0)

        (= (skill programmer9) 3)
        (= (quality programmer9) 1)
        (= (task-count programmer9) 0)

        (= (skill programmer10) 1)
        (= (quality programmer10) 2)
        (= (task-count programmer10) 0)

        ; Tasks
        (= (difficulty task1) 1)
        (= (hours task1) 4)

        (= (difficulty task2) 2)
        (= (hours task2) 5)

        (= (difficulty task3) 3)
        (= (hours task3) 6)

        (= (difficulty task4) 1)
        (= (hours task4) 4)

        (= (difficulty task5) 2)
        (= (hours task5) 5)

        (= (difficulty task6) 3)
        (= (hours task6) 6)

        (= (difficulty task7) 1)
        (= (hours task7) 4)

        (= (total-hours) 0)
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
