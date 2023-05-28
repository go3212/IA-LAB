;;; ---------------------------------------------------------
;;; ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontologia.ttl
;;; :Date 27/05/2023 18:55:41

(defclass Course
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot HasIngredient
        (type INSTANCE)
        (create-accessor read-write))
    (slot IsVegan
        (type SYMBOL)
        (create-accessor read-write))
    (slot Evaluation (type FLOAT) (create-accessor read-write))
    (slot CookingMethod
        (type STRING)
        (create-accessor read-write))
    (multislot IngredientQuantity
        (type FLOAT)
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

(definstances instances
)
