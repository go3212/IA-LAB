(define (problem Ext2-10-5)
                (:domain software-project)
                (:objects
                    programmer0 programmer1 programmer2 programmer3 programmer4 programmer5 programmer6 programmer7 programmer8 programmer9 - programmer
                    task0 task1 task2 task3 task4 task5 task6 task7 task8 task9 - task
                )
                (:init
                    (= (quality programmer0) 2)(= (skill programmer0) 2)(= (quality programmer1) 2)(= (skill programmer1) 2)(= (quality programmer2) 2)(= (skill programmer2) 1)(= (quality programmer3) 1)(= (skill programmer3) 2)(= (quality programmer4) 1)(= (skill programmer4) 3)(= (quality programmer5) 2)(= (skill programmer5) 3)(= (quality programmer6) 1)(= (skill programmer6) 1)(= (quality programmer7) 2)(= (skill programmer7) 2)(= (quality programmer8) 2)(= (skill programmer8) 3)(= (quality programmer9) 1)(= (skill programmer9) 2) 
                    (= (difficulty task0) 2)(= (difficulty task1) 3)(= (difficulty task2) 2)(= (difficulty task3) 1)(= (difficulty task4) 1)(= (difficulty task5) 2)(= (difficulty task6) 1)(= (difficulty task7) 3)(= (difficulty task8) 1)(= (difficulty task9) 3) 
                    (= (total-hours) 0)
                    
                )
                (:goal 
                    (forall (?t - task) (and (task-assigned ?t) (reviewed ?t)))
                )
                (:metric minimize (total-hours))
                
                
            )