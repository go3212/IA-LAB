; ------------------------------------------------------------
; * MAIN
;   En este fichero se definen los módulos del programa
;   y los deftamplates del módulo MAIN
;------------------------------------------------------------

(defmodule MAIN)
(defmodule DATA-INFERENCE)
(defmodule MENU-GENERATION)
(defmodule MENU-PRINT)

(deftemplate MAIN::user
    (slot name)
    (slot age (type INTEGER))
    (slot gender (allowed-values male female))
    (slot weight (type FLOAT))
    (slot height (type FLOAT))
    (slot is-vegan (type SYMBOL) (allowed-values yes no))
    (slot activity-level (type SYMBOL) (allowed-values sedentary light moderate active))
    (multislot diseases)
    (multislot liked-ingredients)
    (multislot disliked-ingredients)
    (slot bmi (type FLOAT))
    (slot required-calories (type FLOAT))
    (slot required-fat (type FLOAT))
    (slot required-protein (type FLOAT))
    (slot required-carbohydrates (type FLOAT))
    (multislot required-nutrients)
    (multislot required-vitamins)
)

(deftemplate MAIN::meal
  (multislot courses (type INSTANCE))
  (slot dessert (type INSTANCE))
)

(deftemplate MAIN::breakfast
  (slot course (type INSTANCE))
)

(deftemplate MAIN::dinner
  (multislot courses (type INSTANCE))
  (slot dessert (type INSTANCE))
)

(deftemplate MAIN::daily-menu
    (slot breakfast (type INSTANCE-NAME))
    (slot meal (type INSTANCE-NAME))
    (slot dinner (type INSTANCE-NAME))
)

(deftemplate MAIN::weekly-menu
    (multislot daily-menus (type INSTANCE-NAME))
)

(defrule MAIN::gather-user-data
    =>
    (bind ?age (promptForAge))
    (bind ?sex (promptForSex))
    (bind ?weight (promptForWeight))
    (bind ?height (promptForHeight))
    (bind ?vegan-status (promptForVeganStatus))
    (bind ?activity-level (promptForPhysicalActivityLevel))
    (bind ?diseases (promptForDiseases))
    (bind ?liked-ingredients (promptForPositivePreferences))
    (bind ?disliked-ingredients (promptForNegativePreferences))

    (assert (user (age ?age) (gender ?sex) (weight ?weight) (height ?height) (is-vegan ?vegan-status) 
                  (activity-level ?activity-level) (diseases ?diseases) (liked-ingredients ?liked-ingredients) 
                  (disliked-ingredients ?disliked-ingredients)))
)