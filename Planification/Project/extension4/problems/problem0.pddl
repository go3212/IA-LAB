(define (problem software-project-instance)
    (:domain software-project)
    (:objects
        programmer4 programmer1 programmer2 programmer3 - programmer
        task1 task2 task3 - task)
    (:init
        ; Programmers
        (= (skill programmer4) 1)
        (= (quality programmer4) 1)
        (= (task-count programmer4) 0)
        
        (= (skill programmer1) 3)
        (= (quality programmer1) 2)
        (= (task-count programmer1) 0)


        (= (skill programmer2) 3)
        (= (quality programmer2) 1)
        (= (task-count programmer2) 0)

        (= (skill programmer3) 3)
        (= (quality programmer3) 1)
        (= (task-count programmer3) 0)


        ; Tasks
        (= (difficulty task1) 2)
        (= (hours task1) 4)

        (= (difficulty task2) 3)
        (= (hours task2) 5)

        (= (difficulty task3) 3)
        (= (hours task3) 6)

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
    
    (:metric minimize (+ (total-time) (* (working) 1000.0)))
)
