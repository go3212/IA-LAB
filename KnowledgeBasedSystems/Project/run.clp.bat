;;;(batch "run.clp.bat")
(clear)
(defglobal ?*debug-print* = nil) ;nil vs t
(load "Classes/ontologia.clp")
(reset)
(load-instances "Instances/ingredients.pins")
(run)