(deffunction promptForAge()
    (printout t "Please enter your age: " crlf)
    (bind ?age (read))
    (assert (Age ?age))
)

(deffunction promptForSex()
    (printout t "Please enter your sex (Male or Female): " crlf)
    (bind ?sex (read))
    (assert (Sex ?sex))
)

(deffunction promptForPhysicalActivityLevel()
    (printout t "Please enter your physical activity level (sedentary, low, medium, high): " crlf)
    (bind ?activityLevel (read))
    (assert (PhysicalActivityLevel ?activityLevel))
)

(deffunction promptForWeight()
    (printout t "Please enter your weight (in kg): " crlf)
    (bind ?weight (read))
    (assert (Weight ?weight))
)

(deffunction promptForHeight()
    (printout t "Please enter your height (in cm): " crlf)
    (bind ?height (read))
    (assert (Height ?height))
)

(deffunction promptForVeganStatus()
    (printout t "Are you a vegan? (yes or no): " crlf)
    (bind ?veganStatus (read))
    (assert (VeganStatus ?veganStatus))
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
    (bind ?diseaseList (readline))
    (bind ?diseaseList (explode$ ?diseaseList))
    (loop-for-count (?i 1 (length$ ?diseaseList))
        (bind ?diseaseName (nth$ ?i ?diseaseList))
        (bind ?disease (find-instance ((?x Disease)) (eq ?x:Name ?diseaseName) TRUE))
        (if ?disease then
            (assert (HasDisease (disease ?diseaseName)))
        )
    )
)
(deffunction promptForPositivePreferences()
    (listIngredients)
    (printout t "Please enter the ingredients you like (separated by comma): " crlf)
    (bind ?likeList (readline))
    (bind ?likeList (explode$ ?likeList))
    (loop-for-count (?i 1 (length$ ?likeList))
        (do-for-all-instances ((?ingredient Ingredient) (eq (send ?ingredient get-Name) (nth$ ?i ?likeList)))
            (assert (PositivePreference (ingredient (send ?ingredient get-Name))))
        )
    )
)

(deffunction promptForNegativePreferences()
    (listIngredients)
    (printout t "Please enter the ingredients you dislike (separated by comma): " crlf)
    (bind ?dislikeList (readline))
    (bind ?dislikeList (explode$ ?dislikeList))
    (loop-for-count (?i 1 (length$ ?dislikeList))
        (do-for-all-instances ((?ingredient Ingredient) (eq (send ?ingredient get-Name) (nth$ ?i ?dislikeList)))
            (assert (NegativePreference (ingredient (send ?ingredient get-Name))))
        )
    )
)

