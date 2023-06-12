(define (problem Ext2-20-12)
                (:domain software-project)
                (:objects
                    programmer0 programmer1 programmer2 programmer3 programmer4 programmer5 programmer6 programmer7 programmer8 programmer9 programmer10 programmer11 programmer12 programmer13 programmer14 programmer15 programmer16 programmer17 programmer18 programmer19 - programmer
                    task0 task1 task2 task3 task4 task5 task6 task7 task8 task9 task10 task11 task12 task13 task14 task15 task16 task17 task18 task19 - task
                )
                (:init
                    (= (quality programmer0) 1)(= (skill programmer0) 2)(= (quality programmer1) 2)(= (skill programmer1) 1)(= (quality programmer2) 2)(= (skill programmer2) 2)(= (quality programmer3) 2)(= (skill programmer3) 2)(= (quality programmer4) 2)(= (skill programmer4) 3)(= (quality programmer5) 1)(= (skill programmer5) 2)(= (quality programmer6) 1)(= (skill programmer6) 1)(= (quality programmer7) 1)(= (skill programmer7) 1)(= (quality programmer8) 2)(= (skill programmer8) 3)(= (quality programmer9) 1)(= (skill programmer9) 3)(= (quality programmer10) 1)(= (skill programmer10) 2)(= (quality programmer11) 2)(= (skill programmer11) 3)(= (quality programmer12) 2)(= (skill programmer12) 2)(= (quality programmer13) 1)(= (skill programmer13) 3)(= (quality programmer14) 2)(= (skill programmer14) 1)(= (quality programmer15) 1)(= (skill programmer15) 2)(= (quality programmer16) 2)(= (skill programmer16) 3)(= (quality programmer17) 1)(= (skill programmer17) 3)(= (quality programmer18) 1)(= (skill programmer18) 1)(= (quality programmer19) 2)(= (skill programmer19) 2) 
                    (= (difficulty task0) 3)(= (difficulty task1) 2)(= (difficulty task2) 2)(= (difficulty task3) 3)(= (difficulty task4) 3)(= (difficulty task5) 1)(= (difficulty task6) 1)(= (difficulty task7) 3)(= (difficulty task8) 1)(= (difficulty task9) 1)(= (difficulty task10) 3)(= (difficulty task11) 1)(= (difficulty task12) 3)(= (difficulty task13) 1)(= (difficulty task14) 3)(= (difficulty task15) 2)(= (difficulty task16) 3)(= (difficulty task17) 2)(= (difficulty task18) 1)(= (difficulty task19) 3) 
                    (= (total-hours) 0)
                    
                )
                (:goal 
                    (forall (?t - task) (and (task-assigned ?t) (reviewed ?t)))
                )
                (:metric minimize (total-hours))
                
            )