; ------------------------------------------------------------
; * MENU-PRINT
;   En este modulo se definen las reglas para mostrar por
;   pantalla el menu generado
;------------------------------------------------------------

(defmodule MENU-PRINT
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule MENU-PRINT::print-daily-menus
    ?f <- (daily-menu 
                (day ?day) 
                (breakfast ?breakfast) 
                (breakfast-quantity ?bQ)
                (lunch-first ?lF)
                (lunch-first-quantity ?lFQ)
                (lunch-second ?lS)
                (lunch-second-quantity ?lSQ)
                (lunch-dessert ?lD)
                (lunch-dessert-quantity ?lDQ)
                (dinner-first ?dF)
                (dinner-first-quantity ?dFQ)
                (dinner-second ?dS)
                (dinner-second-quantity ?dSQ)
                (dinner-dessert ?dD)
                (dinner-dessert-quantity ?dDQ))
    =>
    (printout t "Day: " ?day crlf
              "Breakfast: " ?breakfast crlf
              "Lunch First Course: " ?lF crlf
              "Lunch Second Course: " ?lS crlf
              "Lunch Dessert: " ?lD crlf
              "Dinner First Course: " ?dF crlf
              "Dinner Second Course: " ?dS crlf
              "Dinner Dessert: " ?dD crlf crlf)
)

(defrule MENU-PRINT::print-user-info
    ?f <- (user
                (name ?name) 
                (age ?age) 
                (gender ?gender)
                (weight ?weight)
                (height ?height)
                (is-vegan ?isVegan)
                (activity-level ?activityLevel)
                (diseases $?diseases)
                (liked-ingredients $?likedIngredients)
                (disliked-ingredients $?dislikedIngredients)
                (bmi ?bmi)
                (required-calories ?requiredCalories)
                (required-fat ?requiredFat)
                (required-protein ?requiredProtein)
                (required-iron ?requiredIron)
                (required-carbohydrates ?requiredCarbohydrates)
                (required-calcium ?requiredCalcium)
                (required-zinc ?requiredZinc)
                (required-potassium ?requiredPotassium)
                (required-magnesium ?requiredMagnesium)
                (required-sodium ?requiredSodium)
                (required-sugar ?requiredSugar)
                (required-fiber ?requiredFiber)
                (required-vitamins $?requiredVitamins))
    =>
    (printout t crlf "USER INFORMATION:" crlf
              "Age: " ?age crlf
              "Gender: " ?gender crlf
              "Weight: " ?weight crlf
              "Height: " ?height crlf
              "Vegan: " ?isVegan crlf
              "Activity level: " ?activityLevel crlf
              "Diseases: " (implode$ $?diseases) crlf
              "Liked ingredients: " (implode$ $?likedIngredients) crlf
              "Disliked ingredients: " (implode$ $?dislikedIngredients) crlf
              "BMI: " ?bmi crlf
              "Required calories: " ?requiredCalories " kcal" crlf
            "Required fat: " ?requiredFat " g" crlf
            "Required protein: " ?requiredProtein " g" crlf
            "Required iron: " ?requiredIron " mg" crlf
            "Required carbohydrates: " ?requiredCarbohydrates " g" crlf
            "Required calcium: " ?requiredCalcium " mg" crlf
            "Required zinc: " ?requiredZinc " mg" crlf
            "Required potassium: " ?requiredPotassium " mg" crlf
            "Required magnesium: " ?requiredMagnesium " mg" crlf
            "Required sodium: " ?requiredSodium " mg" crlf
            "Required sugar: " ?requiredSugar " g" crlf
            "Required fiber: " ?requiredFiber " g" crlf
              "Required vitamins: " (implode$ $?requiredVitamins) crlf crlf)
)

