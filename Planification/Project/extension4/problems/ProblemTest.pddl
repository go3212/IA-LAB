(define (problem ProblemTest)
                (:domain software-project)
                (:objects
                    programmer0 programmer1 programmer2 programmer3 - programmer
                    task0 task1 task2 task3 - task
                )
                (:init
                    (= (task-count programmer0) 0)(= (quality programmer0) 1)(= (skill programmer0) 1)(= (task-count programmer1) 0)(= (quality programmer1) 2)(= (skill programmer1) 1)(= (task-count programmer2) 0)(= (quality programmer2) 1)(= (skill programmer2) 2)(= (task-count programmer3) 0)(= (quality programmer3) 2)(= (skill programmer3) 3) 
                    (= (difficulty task0) 1)(= (hours task0) 9)(= (difficulty task1) 2)(= (hours task1) 17)(= (difficulty task2) 2)(= (hours task2) 2)(= (difficulty task3) 1)(= (hours task3) 23) 
                    (= (total-hours) 0)
                    (= (working) 0)
                )
                (:goal 
                    (forall (?t - task) (and (task-assigned ?t) (reviewed ?t)))
                )
                (:metric minimize (+ (total-hours) (* (working) 1000.0))) 
            )