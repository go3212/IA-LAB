(define (problem software-project-instance)
    (:domain software-project)
    (:objects
        programmer1 programmer2 - programmer
        task1 task2 task3 - task)
    (:init
        (= (skill programmer1) 2)
        (= (skill programmer2) 3)
        (= (difficulty task1) 1)
        (= (difficulty task2) 2)
        (= (difficulty task3) 3)
        (= (hours task1) 4)
        (= (hours task2) 5)
        (= (hours task3) 6))
    (:goal
        (forall (?t - task) 
            (task-assigned ?t))
    )
)
