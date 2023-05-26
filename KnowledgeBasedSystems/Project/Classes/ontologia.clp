;;; ---------------------------------------------------------
;;; ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontologia.ttl
;;; :Date 26/05/2023 01:34:27

(defclass Course
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot HasIngredient
        (type INSTANCE)
        (create-accessor read-write))
    (multislot IngredientQuantity
        (type FLOAT)
        (create-accessor read-write))
    (slot CookingMethod
        (type STRING)
        (create-accessor read-write))
    (slot Name
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Breakfast
    (is-a Course)
    (role concrete)
    (pattern-match reactive)
)

(defclass Dessert
    (is-a Course)
    (role concrete)
    (pattern-match reactive)
)

(defclass Dinner
    (is-a Course)
    (role concrete)
    (pattern-match reactive)
)

(defclass Lunch
    (is-a Course)
    (role concrete)
    (pattern-match reactive)
)

(defclass Disease
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Name
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Ingredient
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot HasNutritionalValue
        (type INSTANCE)
        (create-accessor read-write))
    (slot topObjectProperty
        (type SYMBOL)
        (create-accessor read-write))
    (multislot Allergens
        (type STRING)
        (create-accessor read-write))
    (slot Name
        (type SYMBOL)
        (create-accessor read-write))
    (slot Seasonality
        (type STRING)
        (create-accessor read-write))
)

(defclass Minerals
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Calcium
        (type FLOAT)
        (create-accessor read-write))
    (slot Iron
        (type FLOAT)
        (create-accessor read-write))
    (slot Magnesium
        (type FLOAT)
        (create-accessor read-write))
    (slot Potassium
        (type FLOAT)
        (create-accessor read-write))
    (slot Zinc
        (type FLOAT)
        (create-accessor read-write))
)

(defclass NutritionalValue
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot HasMinerals
        (type INSTANCE)
        (create-accessor read-write))
    (slot Calories
        (type FLOAT)
        (create-accessor read-write))
    (slot Carbohydrates
        (type FLOAT)
        (create-accessor read-write))
    (slot Fat
        (type FLOAT)
        (create-accessor read-write))
    (slot Fiber
        (type FLOAT)
        (create-accessor read-write))
    (slot Protein
        (type FLOAT)
        (create-accessor read-write))
    (slot Sodium
        (type FLOAT)
        (create-accessor read-write))
    (slot Sugar
        (type FLOAT)
        (create-accessor read-write))
    (multislot Vitamins
        (type STRING)
        (create-accessor read-write))
)

(deftemplate dailyMenu
    (slot breakfast (type Breakfast))
    (slot lunch1 (type Lunch))
    (slot lunch2 (type Lunch))
    (slot dessertLunch (type Dessert))
    (slot dinner1 (type Dinner))
    (slot dinner2 (type Dinner))
    (slot dessertDinner (type Dessert))
)

(deftemplate weekMenu
    (slot monday (type dailyMenu))
    (slot tueday (type dailyMenu))
    (slot wedneday (type dailyMenu))
    (slot thursday (type dailyMenu))
    (slot friday (type dailyMenu))
    (slot saturday (type dailyMenu))
    (slot sunday (type dailyMenu))
)


//NO CREO
(defrule assignMondayMenu
   (not (weekMenu (monday ?menu&:(not (eq ?menu, nil)))))
   (not (dailyMenu (breakfast ?b&:(not (eq ?b, nil))) (lunch1 ?l1&:(not (eq ?l1, nil))) (lunch2 ?l2&:(not (eq ?l2, nil)))
                   (dessertLunch ?dL&:(not (eq ?dL, nil))) (dinner1 ?d1&:(not (eq ?d1, nil))) (dinner2 ?d2&:(not (eq ?d2, nil)))
                   (dessertDinner ?dD&:(not (eq ?dD, nil))))))
   =>
   (bind ?newMenu (create$ (dailyMenu (breakfast ?b) (lunch1 ?l1) (lunch2 ?l2) (dessertLunch ?dL)
                            (dinner1 ?d1) (dinner2 ?d2) (dessertDinner ?dD))))
   (modify-instance (weekMenu) (monday ?newMenu))
)
