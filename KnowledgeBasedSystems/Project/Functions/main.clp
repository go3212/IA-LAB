
(deffunction promptForAge() 
    (printout t "Enter your age: " crlf)
    (bind ?age (read))
    (if (integerp ?age)
        then
            return ?age
        else
            (printout t "Invalid input. Please enter a number for your age." crlf)
            (return (promptForAge))
    )
)

(deffunction promptForSex() 
    (printout t "Enter your sex (male or female): " crlf)
    (bind ?sex (read))
    (if (member$ ?sex (create$ male female))
        then
            return ?sex
        else
            (printout t "Invalid input. Please enter 'male' or 'female'." crlf)
            (return (promptForSex))
    )
)

(deffunction promptForWeight() 
    (printout t "Enter your weight (in kg): " crlf)
    (bind ?weight (read))
    (if (floatp ?weight)
        then
            return ?weight
        else
            (printout t "Invalid input. Please enter a number for your weight." crlf)
            (return (promptForWeight))
    )
)

(deffunction promptForHeight() 
    (printout t "Enter your height (in cm): " crlf)
    (bind ?height (read))
    (if (floatp ?height)
        then
            return ?height
        else
            (printout t "Invalid input. Please enter a number for your height." crlf)
            (return (promptForHeight))
    )
)

(deffunction promptForVeganStatus() 
    (printout t "Are you a vegan? (yes or no): " crlf)
    (bind ?vegan-status (read))
    (if (member$ ?vegan-status (create$ yes no))
        then
            return ?vegan-status
        else
            (printout t "Invalid input. Please enter 'yes' or 'no'." crlf)
            (return (promptForVeganStatus))
    )
)

(deffunction promptForPhysicalActivityLevel()
    (printout t "Enter your physical activity level (sedentary, light, moderate, active): " crlf)
    (bind ?activity-level (read))
    (if (member$ ?activity-level (create$ sedentary light moderate active))
        then
            return ?activity-level
        else
            (printout t "Invalid input. Please enter 'sedentary', 'light', 'moderate' or 'active'." crlf)
            (return (promptForPhysicalActivityLevel))
    )
)

(deffunction listIngredients()
    (printout t "Available ingredients: " crlf)
    (do-for-all-instances ((?ingredient Ingredient))
        (printout t (send ?ingredient get-Name) crlf)
    )
)

(deffunction listDiseases()
    (printout t "Known diseases: " crlf)
    (do-for-all-instances ((?disease Disease))
        (printout t (send ?disease get-Name) crlf)
    )
)

(deffunction promptForDiseases()
    (listDiseases)
    (printout t "Please enter any of the diseases you have (separated by comma): " crlf)
    (return (explode$ (readline)))
)

(deffunction promptForPositivePreferences()
    (listIngredients)
    (printout t "Please enter the ingredients you like (separated by comma): " crlf)
    (return (explode$ (readline)))
)

(deffunction promptForNegativePreferences()
    (listIngredients)
    (printout t "Please enter the ingredients you dislike (separated by comma): " crlf)
    (return (explode$ (readline)))
)
