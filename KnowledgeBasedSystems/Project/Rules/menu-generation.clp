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
    =>
    (bind ?max 0.0)
    (bind ?max-breakfast nil)
    (bind ?breakfasts (find-all-instances ((?breakfast Breakfast)) TRUE))
    (foreach ?breakfast ?breakfasts
        (bind ?current-score (send ?breakfast get-Evaluation))
        (if (> ?current-score ?max) then
            (bind ?max ?current-score)
            (bind ?max-breakfast ?breakfast)
        )
    )
    (if (neq ?max-breakfast nil) then
        (modify ?f (breakfast ?max-breakfast))
        (printout t "Asignado desayuno " (send ?max-breakfast get-Name) " al menú del " ?day crlf)
        ;(retract ?max-breakfast)
    )
)











