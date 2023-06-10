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
        (= (quality programmer1) 1)

        ; Tasks
        (= (difficulty task1) 1)
        (= (hours task1) 4)
        (= (review-hours task1) 0)

        (= (difficulty task2) 2)
        (= (hours task2) 5)
        (= (review-hours task2) 0)

        (= (difficulty task3) 3)
        (= (hours task3) 6)
        (= (review-hours task3) 0)
    )
    (:goal
        (and
            (forall (?t - task) 
                (and
                    (task-assigned ?t)
                    (reviewed ?t)
            ))
        )
    )
)
