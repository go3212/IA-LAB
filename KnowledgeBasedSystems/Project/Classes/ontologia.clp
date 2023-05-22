;;; ---------------------------------------------------------
;;; ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontologia.ttl
;;; :Date 23/05/2023 00:37:54

(defclass Course
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot CookingMethod
        (type STRING)
        (create-accessor read-write))
    (slot Kcal
        (type INTEGER)
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
    (slot Seasonality
        (type STRING)
        (create-accessor read-write))
    (slot Allergens
        (type STRING)
        (create-accessor read-write))
    (slot Name
        (type SYMBOL)
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
    (slot HasVitamins
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
)

(defclass Vitamins
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot A
        (type FLOAT)
        (create-accessor read-write))
    (slot B
        (type FLOAT)
        (create-accessor read-write))
    (slot B1
        (type FLOAT)
        (create-accessor read-write))
    (slot B12
        (type FLOAT)
        (create-accessor read-write))
    (slot B2
        (type FLOAT)
        (create-accessor read-write))
    (slot B3
        (type FLOAT)
        (create-accessor read-write))
    (slot B5
        (type FLOAT)
        (create-accessor read-write))
    (slot B6
        (type FLOAT)
        (create-accessor read-write))
    (slot B7
        (type FLOAT)
        (create-accessor read-write))
    (slot B9
        (type FLOAT)
        (create-accessor read-write))
    (slot C
        (type FLOAT)
        (create-accessor read-write))
    (slot D
        (type FLOAT)
        (create-accessor read-write))
    (slot E
        (type FLOAT)
        (create-accessor read-write))
    (slot K
        (type FLOAT)
        (create-accessor read-write))
)

(definstances instances
)
