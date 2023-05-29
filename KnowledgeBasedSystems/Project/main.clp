; ------------------------------------------------------------
; * MAIN
;   En este fichero se definen los módulos del programa
;   y los deftamplates del módulo MAIN
;------------------------------------------------------------

(defmodule MAIN (export ?ALL))

(deftemplate MAIN::user
    (slot name)
    (slot age (type INTEGER))
    (slot gender (allowed-values male female))
    (slot weight (type FLOAT))
    (slot height (type FLOAT))
    (slot is-vegan (type SYMBOL) (allowed-values yes no))
    (slot activity-level (type SYMBOL) (allowed-values sedentary light moderate active))
    (multislot diseases (type INSTANCE))
    (multislot liked-ingredients (type INSTANCE))
    (multislot disliked-ingredients (type INSTANCE))
    (slot bmi (type FLOAT) (default -1.0))
    (slot required-calories (type FLOAT) (default -1.0))
    (slot required-fat (type FLOAT) (default -1.0))
    (slot required-protein (type FLOAT) (default -1.0))
    (slot required-iron (type FLOAT) (default 8.0))
    (slot required-carbohydrates (type FLOAT) (default -1.0))
    (slot required-calcium (type FLOAT) (default 1000.0))
    (slot required-zinc (type FLOAT) (default 8.0))
    (slot required-potassium (type FLOAT) (default 4700.0))
    (slot required-magnesium (type FLOAT) (default 320.0))
    (slot required-sodium (type FLOAT) (default 2300.0))
    (slot required-sugar (type FLOAT) (default 25.0))
    (slot required-fiber (type FLOAT) (default 28.0))
    (multislot required-vitamins (type STRING))
)

(deftemplate MAIN::daily-menu
    (slot day (type STRING))
    (slot breakfast)
    (slot breakfast-quantity)
    (slot lunch-first)
    (slot lunch-first-quantity)
    (slot lunch-second)
    (slot lunch-second-quantity)
    (slot lunch-dessert)
    (slot lunch-dessert-quantity)
    (slot dinner-first)
    (slot dinner-first-quantity)
    (slot dinner-second)
    (slot dinner-second-quantity)
    (slot dinner-dessert)
    (slot dinner-dessert-quantity)
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
    (bind ?diseases (ask-question-multi-opt-instances "Do you have any of the following diseases? List as many as required." Disease (create$)))
    (bind ?liked-ingredients (ask-question-multi-opt-instances "Do you prefer any of the ingredients?" Ingredient (create$)))
    (bind ?disliked-ingredients (ask-question-multi-opt-instances "Do you rather not eat any of the ingredients?" Ingredient (create$)))

    (assert (user (age ?age) (gender ?sex) (weight ?weight) (height ?height) (is-vegan ?vegan-status) 
                  (activity-level ?activity-level) (diseases ?diseases) (liked-ingredients ?liked-ingredients) 
                  (disliked-ingredients ?disliked-ingredients) (bmi -1.0)))
    (focus DATA-INFERENCE)
)

(defrule switch-too-MENU-GENERATION
  (switch-to-MENU-GENERATION)
  =>
  (focus MENU-GENERATION)
)