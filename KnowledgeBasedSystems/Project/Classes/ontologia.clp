;;; ---------------------------------------------------------
;;; ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontologia.ttl
;;; :Date 20/05/2023 18:02:46

(defclass Disease
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot name
        (type STRING)
        (create-accessor read-write))
)

(defclass Meal
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Kcal
        (type INTEGER)
        (create-accessor read-write))
    (slot carbs
        (type FLOAT)
        (create-accessor read-write))
    (slot fat
        (type FLOAT)
        (create-accessor read-write))
    (slot name
        (type STRING)
        (create-accessor read-write))
    (slot protein
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

(definstances instances
)
