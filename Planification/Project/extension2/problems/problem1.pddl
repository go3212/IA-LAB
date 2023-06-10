(define (problem large-software-project-instance)
    (:domain software-project)
    (:objects
        programmer1 programmer2 programmer3 programmer4 programmer5 - programmer
        task1 task2 task3 task4 task5 task6 task7 task8 task9 task10 - task)
    (:init
        ; Programmers
        (= (skill programmer1) 2)
        (= (quality programmer1) 1)

        (= (skill programmer2) 3)
        (= (quality programmer2) 1)

        (= (skill programmer3) 4)
        (= (quality programmer3) 2)

        (= (skill programmer4) 3)
        (= (quality programmer4) 2)

        (= (skill programmer5) 2)
        (= (quality programmer5) 1)

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

        (= (difficulty task8) 2)
        (= (hours task8) 5)

        (= (difficulty task9) 3)
        (= (hours task9) 6)

        (= (difficulty task10) 1)
        (= (hours task10) 4)

        (= (total-hours) 0)
    )
    (:goal
        (forall (?t - task) (and (task-assigned ?t) (reviewed ?t)))
    )
    (:metric minimize (total-hours))
)
