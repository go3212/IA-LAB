(define (problem ProblemTest1010)
                (:domain software-project)
                (:objects
                    programmer0 programmer1 programmer2 programmer3 programmer4 programmer5 programmer6 programmer7 programmer8 programmer9 - programmer
                    task0 task1 task2 task3 task4 task5 task6 task7 task8 task9 - task
                )
                (:init
                    (= (task-count programmer0) 0)(= (quality programmer0) 1)(= (skill programmer0) 1)(= (task-count programmer1) 0)(= (quality programmer1) 2)(= (skill programmer1) 2)(= (task-count programmer2) 0)(= (quality programmer2) 2)(= (skill programmer2) 2)(= (task-count programmer3) 0)(= (quality programmer3) 1)(= (skill programmer3) 1)(= (task-count programmer4) 0)(= (quality programmer4) 2)(= (skill programmer4) 1)(= (task-count programmer5) 0)(= (quality programmer5) 1)(= (skill programmer5) 2)(= (task-count programmer6) 0)(= (quality programmer6) 1)(= (skill programmer6) 2)(= (task-count programmer7) 0)(= (quality programmer7) 2)(= (skill programmer7) 2)(= (task-count programmer8) 0)(= (quality programmer8) 2)(= (skill programmer8) 1)(= (task-count programmer9) 0)(= (quality programmer9) 1)(= (skill programmer9) 2) 
                    (= (difficulty task0) 2)(= (hours task0) 4)(= (difficulty task1) 2)(= (hours task1) 16)(= (difficulty task2) 3)(= (hours task2) 1)(= (difficulty task3) 3)(= (hours task3) 11)(= (difficulty task4) 3)(= (hours task4) 3)(= (difficulty task5) 1)(= (hours task5) 9)(= (difficulty task6) 1)(= (hours task6) 23)(= (difficulty task7) 1)(= (hours task7) 22)(= (difficulty task8) 1)(= (hours task8) 8)(= (difficulty task9) 1)(= (hours task9) 18) 
                    (= (total-hours) 0)
                    (= (working) 0)
                )
                (:goal 
                    (forall (?t - task) (and (task-assigned ?t) (reviewed ?t)))
                )
                (:metric minimize (+ (total-hours) (* (working) 1000.0))) 
            )
