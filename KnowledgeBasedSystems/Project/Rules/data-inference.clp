(defmodule DATA-INFERENCE
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule DATA-INFERENCE::calculate-bmi
    ?user <- (user (weight ?weight) (height ?height) (bmi -1.0))
    =>
    (bind ?bmi (/ ?weight (* (/ ?height 100) (/ ?height 100))))
    (modify ?user (bmi ?bmi))
)

(defrule DATA-INFERENCE::calculate-caloric-needs
    ?user <- (user (gender ?gender) (weight ?weight) (height ?height) (age ?age) (activity-level ?activity-level) (required-calories -1.0))
    =>
    (bind ?bmr (if (eq ?gender "male") then 
                      (+ (* 10 ?weight) (* 6.25 ?height) (* 5 ?age) 5) 
                      else 
                      (+ (* 10 ?weight) (* 6.25 ?height) (* 5 ?age) -161)
    ))
    (bind ?caloric-needs (* ?bmr (if (eq ?activity-level "sedentary") then 1.2
                                     else (if (eq ?activity-level "light") then 1.375
                                     else (if (eq ?activity-level "moderate") then 1.55
                                     else (if (eq ?activity-level "active") then 1.725
                                     else 1.0))))))
    (modify ?user (required-calories ?caloric-needs))
)

(defrule DATA-INFERENCE::calculate-macronutrient-needs
    ?user <- (user (required-calories ?required-calories) (required-fat -1.0) (required-protein -1.0) (required-carbohydrates -1.0))
    =>
    (bind ?required-fat (/ (* 0.3 ?required-calories) 9)) ; There are 9 calories in a gram of fat
    (bind ?required-protein (/ (* 0.3 ?required-calories) 4)) ; There are 4 calories in a gram of protein
    (bind ?required-carbohydrates (/ (* 0.4 ?required-calories) 4)) ; There are 4 calories in a gram of carbohydrates
    (modify ?user (required-fat ?required-fat) (required-protein ?required-protein) (required-carbohydrates ?required-carbohydrates))
)

(defrule DATA-INFERENCE::set-baseline-nutrition-needs
    ?user <- (user (required-carbohydrates -1.0) (required-fat -1.0) (required-protein -1.0) (required-calcium -1.0) (required-zinc -1.0) (required-potassium -1.0) (required-magnesium -1.0) (required-sodium -1.0) (required-sugar -1.0) (required-fiber -1.0))
    =>
    (modify ?user 
        (required-carbohydrates 130.0)
        (required-fat 70.0)
        (required-protein 50.0)
        (required-calcium 1000.0)
        (required-zinc 8.0)
        (required-potassium 4700.0)
        (required-magnesium 320.0)
        (required-sodium 2300.0)
        (required-sugar 25.0)
        (required-fiber 28.0)
    )
)

;;;;;;;;;;;;;;;;;;
;;; ENFERMEDADES

(defrule DATA-INFERENCE::adjust-for-diabetes
    ?user <- (user (diseases $?diseases) (required-carbohydrates ?required-carbohydrates) (required-calories ?required-calories))
    (test (member$ "Diabetes" $?diseases))
    =>
    (bind ?new-carbs (* 0.35 ?required-calories)) 
    (modify ?user (required-carbohydrates ?new-carbs))
)

(defrule DATA-INFERENCE::adjust-for-hypertension
    ?user <- (user (diseases $?diseases) (required-sodium ?required-sodium))
    (test (member$ "Hypertension" $?diseases))
    =>
    (bind ?new-sodium (* 0.5 ?required-sodium)) 
    (modify ?user (required-sodium ?new-sodium))
)

(defrule DATA-INFERENCE::adjust-for-ischemic-heart-disease
    ?user <- (user (diseases $?diseases) (required-fat ?required-fat))
    (test (member$ "Ischemic Heart Disease" $?diseases))
    =>
    (bind ?new-fat (* 0.7 ?required-fat)) 
    (modify ?user (required-fat ?new-fat))
)

(defrule DATA-INFERENCE::adjust-for-osteoporosis
    ?user <- (user (diseases $?diseases) (required-calcium ?required-calcium))
    (test (member$ "Osteoporosis" $?diseases))
    =>
    (bind ?new-calcium (* 1.5 ?required-calcium)) 
    (modify ?user (required-calcium ?new-calcium))
)

(defrule DATA-INFERENCE::adjust-for-dysphagia
    ?user <- (user (diseases $?diseases) (required-fiber ?required-fiber))
    (test (member$ "Dysphagia" $?diseases))
    =>
    (bind ?new-fiber (* 1.2 ?required-fiber)) 
    (modify ?user (required-fiber ?new-fiber))
)

(defrule DATA-INFERENCE::adjust-for-hyperlipidemia
    ?user <- (user (diseases $?diseases) (required-fat ?required-fat))
    (test (member$ "Hyperlipidemia" $?diseases))
    =>
    (bind ?new-fat (* 0.6 ?required-fat)) 
    (modify ?user (required-fat ?new-fat))
)

(defrule DATA-INFERENCE::adjust-for-hypertriglyceridemia
    ?user <- (user (diseases $?diseases) (required-carbohydrates ?required-carbohydrates))
    (test (member$ "Hypertriglyceridemia" $?diseases))
    =>
    (bind ?new-carbs (* 0.45 ?required-carbohydrates)) 
    (modify ?user (required-carbohydrates ?new-carbs))
)

(defrule DATA-INFERENCE::adjust-for-inflammatory-joint-diseases
    ?user <- (user (diseases $?diseases) (required-protein ?required-protein))
    (test (member$ "Inflammatory Joint Diseases" $?diseases))
    =>
    (bind ?new-protein (* 1.2 ?required-protein)) 
    (modify ?user (required-protein ?new-protein))
)

(defrule DATA-INFERENCE::adjust-for-hyperuricemia
    ?user <- (user (diseases $?diseases) (required-protein ?required-protein))
    (test (member$ "Hyperuricemia" $?diseases))
    =>
    (bind ?new-protein (* 0.8 ?required-protein)) 
    (modify ?user (required-protein ?new-protein))
)

(defrule DATA-INFERENCE::adjust-for-anemia
    ?user <- (user (diseases $?diseases) (required-iron ?required-iron))
    (test (member$ "Anemia" $?diseases))
    =>
    (bind ?new-iron (* 1.5 ?required-iron)) 
    (modify ?user (required-iron ?new-iron))
)

(defrule DATA-INFERENCE::adjust-for-arthritis
    ?user <- (user (diseases $?diseases) (required-calcium ?required-calcium))
    (test (member$ "Arthritis" $?diseases))
    =>
    (bind ?new-calcium (* 1.2 ?required-calcium)) 
    (modify ?user (required-calcium ?new-calcium))
)


(defrule DATA-INFERENCE::consider-dietary-preferences
    ?user <- (user (liked-ingredients $?liked) (disliked-ingredients $?disliked))
    =>
    ; This rule doesn't modify the user object directly. Instead, it could be used to guide the generation of a meal plan
    ; that takes into account the user's preferences.
)