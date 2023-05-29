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
        (if (neq (send ?breakfast get-Assigned) true) then
            (bind ?current-score (send ?breakfast get-Evaluation))
            (if (> ?current-score ?max) then
                (bind ?max ?current-score)
                (bind ?max-breakfast ?breakfast)
            )
        )
    )
    (if (neq ?max-breakfast nil) then
        (modify ?f (breakfast ?max-breakfast))
        (send ?max-breakfast put-Assigned true)
        (printout t "Asignado desayuno " (send ?max-breakfast get-Name) " al menú del " ?day crlf)
    )
)

(defrule MENU-GENERATION::fill-lunch-first-slot
    ?f <- (daily-menu (day ?day) (lunch-first nil))
    =>
    (bind ?max 0.0)
    (bind ?max-lunch-first nil)
    (bind ?lunch-firsts (find-all-instances ((?lunch-first Lunch)) TRUE))
    (foreach ?lunch-first ?lunch-firsts
        (if (neq (send ?lunch-first get-Assigned) true) then
            (bind ?current-score (send ?lunch-first get-Evaluation))
            (if (> ?current-score ?max) then
                (bind ?max ?current-score)
                (bind ?max-lunch-first ?lunch-first)
            )
        )
    )
    (if (neq ?max-lunch-first nil) then
        (modify ?f (lunch-first ?max-lunch-first))
        (send ?max-lunch-first put-Assigned true)
        (printout t "Asignado primer plato " (send ?max-lunch-first get-Name) " al menú del " ?day crlf)
    )
)











