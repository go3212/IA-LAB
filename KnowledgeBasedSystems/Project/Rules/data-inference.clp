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

;;;;;;;;;;;;;;;;;;
;;; ENFERMEDADES

(defrule DATA-INFERENCE::adjust-for-diabetes
    ?user <- (user (diseases $?diseases&:(member$ [Diabetes] $?diseases)) (required-carbohydrates ?required-carbohydrates) (required-calories ?required-calories) (required-vitamins $?vitamins))
    (test (not (member$ "C" $?vitamins)))
    =>
    (bind ?new-carbs (* 0.35 ?required-calories))
    (bind ?new-carbs (min 130 (max 200 ?new-carbs)))
    (modify ?user (required-carbohydrates ?new-carbs) (required-vitamins $?vitamins "C"))
)

(defrule DATA-INFERENCE::adjust-for-hypertension
    ?user <- (user (diseases $?diseases&:(member$ [Hypertension] $?diseases)) (required-sodium ?required-sodium) (required-potassium ?required-potassium) (required-vitamins $?vitamins))
    (test (<= ?required-sodium (* 0.5 ?required-sodium)))
    =>
    (bind ?new-sodium (* 0.5 ?required-sodium))
    (bind ?new-sodium (min 1500 (max 2300 ?new-sodium)))
    (bind ?new-potassium (* 1.2 ?required-potassium))
    (modify ?user (required-sodium ?new-sodium) (required-potassium ?new-potassium))
)

(defrule DATA-INFERENCE::adjust-for-ischemic-heart-disease
    ?user <- (user (diseases $?diseases&:(member$ [Ischemic-Heart-Disease] $?diseases)) (required-fat ?required-fat) (required-vitamins $?vitamins))
    (test (not (member$ "D" $?vitamins)))
    =>
    (bind ?new-fat (* 0.7 ?required-fat))
    (bind ?new-fat (min 35 (max 100 ?new-fat)))
    (modify ?user (required-fat ?new-fat) (required-vitamins $?vitamins "D"))
)

(defrule DATA-INFERENCE::adjust-for-osteoporosis
    ?user <- (user (diseases $?diseases&:(member$ [Osteoporosis] $?diseases)) (required-calcium ?required-calcium) (required-vitamins $?vitamins))
    (test (not (member$ "D" $?vitamins)))
    =>
    (bind ?new-calcium (* 1.5 ?required-calcium))
    (bind ?new-calcium (min 1000 (max 2000 ?new-calcium)))
    (modify ?user (required-calcium ?new-calcium) (required-vitamins $?vitamins "D"))
)

(defrule DATA-INFERENCE::adjust-for-dysphagia
    ?user <- (user (diseases $?diseases&:(member$ [Dysphagia] $?diseases)) (required-fiber ?required-fiber) (required-vitamins $?vitamins))
    (test (not (member$ "C" $?vitamins)))
    =>
    (bind ?new-fiber (* 1.2 ?required-fiber))
    (bind ?new-fiber (min 28 (max 40 ?new-fiber)))
    (modify ?user (required-fiber ?new-fiber) (required-vitamins $?vitamins "C"))
)

(defrule DATA-INFERENCE::adjust-for-hyperlipidemia
    ?user <- (user (diseases $?diseases&:(member$ [Hyperlipidemia] $?diseases)) (required-fat ?required-fat) (required-vitamins $?vitamins))
    (test (not (member$ "E" $?vitamins)))
    =>
    (bind ?new-fat (* 0.6 ?required-fat))
    (bind ?new-fat (min 35 (max 100 ?new-fat)))
    (modify ?user (required-fat ?new-fat) (required-vitamins $?vitamins "E"))
)

(defrule DATA-INFERENCE::adjust-for-hypertriglyceridemia
    ?user <- (user (diseases $?diseases&:(member$ [Hypertriglyceridemia] $?diseases)) (required-carbohydrates ?required-carbohydrates) (required-vitamins $?vitamins))
    (test (<= ?required-carbohydrates (* 0.45 ?required-carbohydrates)))
    =>
    (bind ?new-carbs (* 0.45 ?required-carbohydrates))
    (bind ?new-carbs (min 130 (max 200 ?new-carbs)))
    (modify ?user (required-carbohydrates ?new-carbs))
)

(defrule DATA-INFERENCE::adjust-for-inflammatory-joint-diseases
    ?user <- (user (diseases $?diseases&:(member$ [Inflammatory-Joint-Diseases] $?diseases)) (required-protein ?required-protein) (required-vitamins $?vitamins))
    (test (not (member$ "E" $?vitamins)))
    =>
    (bind ?new-protein (* 1.2 ?required-protein))
    (bind ?new-protein (min 50 (max 200 ?new-protein)))
    (modify ?user (required-protein ?new-protein) (required-vitamins $?vitamins "E"))
)

(defrule DATA-INFERENCE::adjust-for-hyperuricemia
    ?user <- (user (diseases $?diseases&:(member$ [Hyperuricemia] $?diseases)) (required-protein ?required-protein) (required-vitamins $?vitamins))
    (test (not (member$ "C" $?vitamins)))
    =>
    (bind ?new-protein (* 0.8 ?required-protein))
    (bind ?new-protein (min 50 (max 200 ?new-protein)))
    (modify ?user (required-protein ?new-protein) (required-vitamins $?vitamins "C"))
)

(defrule DATA-INFERENCE::adjust-for-anemia
    ?user <- (user (diseases $?diseases&:(member$ [Anemia] $?diseases)) (required-iron ?required-iron) (required-vitamins $?vitamins))
    (test (not (member$ "B12" $?vitamins)))
    =>
    (bind ?new-iron (* 1.5 ?required-iron))
    (bind ?new-iron (min 8 (max 45 ?new-iron)))
    (modify ?user (required-iron ?new-iron) (required-vitamins $?vitamins "B12"))
)

(defrule DATA-INFERENCE::adjust-for-arthritis
    ?user <- (user (diseases $?diseases&:(member$ [Arthritis] $?diseases)) (required-calcium ?required-calcium) (required-vitamins $?vitamins))
    (test (not (member$ "B12" $?vitamins)))
    =>
    (bind ?new-calcium (* 1.2 ?required-calcium))
    (bind ?new-calcium (min 1000 (max 2000 ?new-calcium)))
    (modify ?user (required-calcium ?new-calcium) (required-vitamins $?vitamins "D"))
)

(defrule DATA-INFERENCE::consider-dietary-preferences
    ?user <- (user (liked-ingredients $?liked) (disliked-ingredients $?disliked))
    =>
    ; This rule doesn't modify the user object directly. Instead, it could be used to guide the generation of a meal plan
    ; that takes into account the user's preferences.
)

(defrule DATA-INFERENCE::done-with-data-inference
    (declare (salience -10000))
    (not (user (weight ?weight) (height ?height) (bmi -1.0)))
    (not (user (gender ?gender) (weight ?weight) (height ?height) (age ?age) (activity-level ?activity-level) (required-calories -1.0)))
    (not (user (required-calories ?required-calories) (required-fat -1.0) (required-protein -1.0) (required-carbohydrates -1.0)))
    ?user-fact <- (user (weight ?weight) (height ?height)
                        (bmi ?bmi&~1.0)
                        (gender ?gender) (age ?age) (activity-level ?activity-level)
                        (required-calories ?required-calories&~1.0)
                        (required-fat ?required-fat&~1.0)
                        (required-protein ?required-protein&~1.0)
                        (required-carbohydrates ?required-carbohydrates&~1.0)
                        (required-iron ?required-iron)
                        (is-vegan ?is-vegan)
                        (liked-ingredients $?liked-ingredients)
                        (required-vitamins $?required-vitamins)
                        (disliked-ingredients $?disliked-ingredients))
    =>
    (bind ?courses (find-all-instances ((?course Course)) TRUE))
    (foreach ?course ?courses
        (bind ?score 0)
        ; Scoring based on vegan preferences
        (if (eq ?is-vegan (send ?course get-IsVegan))
            then (bind ?score (+ ?score 20)))

        ; Scoring based on liked ingredients
        (foreach ?ingredient ?liked-ingredients
            (if (member$ ?ingredient (send ?course get-HasIngredient))
                then (bind ?score (+ ?score 5))))

        ; Scoring based on disliked ingredients
        (foreach ?ingredient ?disliked-ingredients
            (if (not (member$ ?ingredient (send ?course get-HasIngredient)))
                then (bind ?score (+ ?score 5))))

        ; Vitaminas 
        ;(foreach ?vitamin ?required-vitamins
        ;    (if (member$ ?vitamin (getCourseVitamins ?course))
        ;        then (bind ?score (+ ?score 5))))

        (send ?course put-Evaluation ?score)
        (send ?course put-Assigned false)
    )

    (printout t "MENU-GENERATION")
    (assert (switch-to-MENU-GENERATION))
)
