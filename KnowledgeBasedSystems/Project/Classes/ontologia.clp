;;; ---------------------------------------------------------
;;; ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontologia.ttl
;;; :Date 20/05/2023 18:47:13

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
    (slot topObjectProperty
        (type SYMBOL)
        (create-accessor read-write))
    (multislot Allergens
        (type STRING)
        (create-accessor read-write))
    (slot Name
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Meal
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Kcal
        (type INTEGER)
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
    (slot Potasium
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

(defclass Persona
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot IMC
        (type FLOAT)
        (create-accessor read-write))
    (slot age
        (type INTEGER)
        (create-accessor read-write))
    (slot height
        (type INTEGER)
        (create-accessor read-write))
    (slot physicalActivity
        (type INTEGER)
        (create-accessor read-write))
    (slot requiredKcal
        (type INTEGER)
        (create-accessor read-write))
    (slot sex
        (type STRING)
        (create-accessor read-write))
    (slot weight
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
    (slot B2
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
