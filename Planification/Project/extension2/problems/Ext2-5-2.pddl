(define (problem Ext2-5-2)
                (:domain software-project)
                (:objects
                    programmer0 programmer1 programmer2 programmer3 programmer4 - programmer
                    task0 task1 task2 task3 task4 - task
                )
                (:init
                    (= (quality programmer0) 1)(= (skill programmer0) 3)(= (quality programmer1) 1)(= (skill programmer1) 2)(= (quality programmer2) 2)(= (skill programmer2) 2)(= (quality programmer3) 2)(= (skill programmer3) 3)(= (quality programmer4) 1)(= (skill programmer4) 1) 
                    (= (difficulty task0) 2)(= (difficulty task1) 1)(= (difficulty task2) 1)(= (difficulty task3) 1)(= (difficulty task4) 1) 
                    (= (total-hours) 0)
                    
                )
                (:goal 
                    (forall (?t - task) (and (task-assigned ?t) (reviewed ?t)))
                )
                (:metric minimize (total-hours))
                
            )