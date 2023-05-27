
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
    (printout t "Please enter any of the diseases you have (separated by space): " crlf)
    (return (explode$ (readline)))
)

(deffunction promptForPositivePreferences()
    (listIngredients)
    (printout t "Please enter the ingredients you like (separated by space): " crlf)
    (return (explode$ (readline)))
)

(deffunction promptForNegativePreferences()
    (listIngredients)
    (printout t "Please enter the ingredients you dislike (separated by space): " crlf)
    (return (explode$ (readline)))
)

(deffunction is-num (?num)
  (or (eq (type ?num) INTEGER) (eq (type ?num) FLOAT))
)

(deffunction num-between (?num ?min ?max)
  (and (is-num ?num) (>= ?num ?min) (<= ?num ?max))
)

(deffunction names-list (?instances)
  (bind ?out (create$))
  (foreach ?i ?instances
    (bind ?out (create$ ?out (send ?i get-Name)))
  )
)

(deffunction ask-question-multi-opt-instances (?question ?class ?exclude)
  (bind ?instances (find-all-instances ((?c ?class)) (not (member$ ?c ?exclude))))
  (bind ?names (names-list ?instances))
  (bind ?count (length$ ?instances))

  (if (= ?count 0) then (return (create$)))

  (while TRUE do ;return function will exit this loop
    (printout t crlf)
    (loop-for-count (?i ?count) do
      (printout t crlf ?i ") " (nth$ ?i ?names))
    )
    (printout t crlf)
    (printout t ?question)
    (printout t crlf)
    (bind ?line (readline))
    (bind $?answer (explode$ ?line))
    (bind ?out (create$))
    (foreach ?i ?answer
      (if (not (num-between ?i 1 ?count)) then
        (break)
      )
      (bind ?v (nth$ ?i ?instances))
      (if (not (member$ ?v ?out)) then
        (bind ?out (create$ ?out ?v))
      )
    )
    (if (eq (length$ ?out) (length$ ?answer)) then
      (return ?out)
	  else (printout t "| ## Invalid input ##" crlf)
    )
  )
)