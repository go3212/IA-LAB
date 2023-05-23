;;;(batch "run.clp.bat")
(clear)
(defglobal ?*debug-print* = nil) ;nil vs t
(load "Classes/ontologia.clp")
(reset)
(load-instances "Instances/minerals.pins")
(load-instances "Instances/nutritional-value.pins")
(load-instances "Instances/ingredients.pins")
(run)