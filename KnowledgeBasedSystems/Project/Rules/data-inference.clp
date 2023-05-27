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



(defrule DATA-INFERENCE::consider-dietary-preferences
    ?user <- (user (liked-ingredients $?liked) (disliked-ingredients $?disliked))
    =>
    ; This rule doesn't modify the user object directly. Instead, it could be used to guide the generation of a meal plan
    ; that takes into account the user's preferences.
)