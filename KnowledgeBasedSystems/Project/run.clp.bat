;;;(batch "run.clp.bat")
(clear)
(defglobal ?*debug-print* = nil) ;nil vs t
(load "Classes/ontologia.clp")
(load "Functions/functions.clp")
(load "Rules/rules.clp")
(load "main.clp")
(reset)
(load-instances "Instances/minerals.pins")
(load-instances "Instances/nutritional-value.pins")
(load-instances "Instances/ingredients.pins")
(promptForAge)
(promptForSex)
(promptForPhysicalActivityLevel)
(promptForWeight)
(promptForHeight)
(promptForVeganStatus)
(promptForDiseases)
(promptForPositivePreferences)
(promptForNegativePreferences)
(run)