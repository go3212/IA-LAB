; ------------------------------------------------------------
; * MAIN
;   En este fichero se definen los módulos del programa
;   y los deftamplates del módulo MAIN
;------------------------------------------------------------

(defmodule MAIN)
(defmodule DATOS-USUARIO)
(defmodule INFERENCIA-DATOS)
(defmodule GENERACION-MENUS)
(defmodule IMPRESION-SOLUCION)

(defmodule MAIN)

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
    (multislot courses (type INSTANCE) (default (create$ (make-instance of Course) (make-instance of Course))))
    (slot dessert (type INSTANCE) (default (make-instance of Dessert)))
)

(deftemplate MAIN::breakfast
    (slot course (type INSTANCE) (default (make-instance of Breakfast)))
)

(deftemplate MAIN::dinner
    (multislot courses (type INSTANCE) (default (create$ (make-instance of Dinner) (make-instance of Dinner))))
    (slot dessert (type INSTANCE) (default (make-instance of Dessert)))
)

(deftemplate MAIN::daily-menu
    (slot breakfast (type INSTANCE) (default (make-instance of breakfast)))
    (slot meal (type INSTANCE) (default (make-instance of meal)))
    (slot dinner (type INSTANCE) (default (make-instance of dinner)))
)

(deftemplate MAIN::weekly-menu
    (multislot daily-menus (type INSTANCE) (default (create$ (make-instance of daily-menu) (make-instance of daily-menu) (make-instance of daily-menu) (make-instance of daily-menu) (make-instance of daily-menu) (make-instance of daily-menu) (make-instance of daily-menu))))
)

