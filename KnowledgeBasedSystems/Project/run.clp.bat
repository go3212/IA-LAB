;;;(batch "run.clp.bat")
(clear)
(defglobal ?*debug-print* = nil) ;nil vs t
;;; Ontology
(load "Classes/ontologia.clp")
;;; Functions
(load "Functions/menu-generation.clp")
(load "Functions/menu-print.clp")
(load "Functions/data-inference.clp")
(load "Functions/main.clp")
;;; Rules
(load "Rules/menu-generation.clp")
(load "Rules/menu-print.clp")
(load "Rules/data-inference.clp")
(load "main.clp")
(reset)
;;; Instances
(load-instances "Instances/minerals.pins")
(load-instances "Instances/nutritional-value.pins")
(load-instances "Instances/ingredients.pins")
(load-instances "Instances/diseases.pins")
(load-instances "Instances/breakfasts.pins")
(load-instances "Instances/lunches.pins")
(load-instances "Instances/desserts.pins")
(load-instances "Instances/dinners.pins")
(run)