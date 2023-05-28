; ------------------------------------------------------------
; * MENU-GENERATION
;   En este modulo se definen las reglas para descartar
;   los platos no adecuados para el usuario y generar
;   el menu
;------------------------------------------------------------

(defmodule MENU-GENERATION
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule MENU-GENERATION::initialize-daily-menus
  =>
    (assert (daily-menu (day "Monday")))
    (assert (daily-menu (day "Tuesday")))
    (assert (daily-menu (day "Wednesday")))
    (assert (daily-menu (day "Thursday")))
    (assert (daily-menu (day "Friday")))
    (assert (daily-menu (day "Saturday")))
    (assert (daily-menu (day "Sunday")))
)

(defrule MENU-GENERATION::fill-breakfast-slot
    ?f <- (daily-menu (day ?day) (breakfast nil))
    ?c <- (object (is-a Breakfast) (Name ?name) (Evaluation ?eval))
    =>
    (modify ?f (breakfast ?c))
    (printout t "Asignado desayuno " ?name " al menú del " ?day crlf)
)










