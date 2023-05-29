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
        (printout t "Asignado primer plato de la comida " (send ?max-lunch-first get-Name) " al menú del " ?day crlf)
    )
)

(defrule MENU-GENERATION::fill-lunch-second-slot
    ?f <- (daily-menu (day ?day) (lunch-second nil))
    =>
    (bind ?max 0.0)
    (bind ?max-lunch-second nil)
    (bind ?lunch-seconds (find-all-instances ((?lunch-second Lunch)) TRUE))
    (foreach ?lunch-second ?lunch-seconds
        (if (neq (send ?lunch-second get-Assigned) true) then
            (bind ?current-score (send ?lunch-second get-Evaluation))
            (if (> ?current-score ?max) then
                (bind ?max ?current-score)
                (bind ?max-lunch-second ?lunch-second)
            )
        )
    )
    (if (neq ?max-lunch-second nil) then
        (modify ?f (lunch-second ?max-lunch-second))
        (send ?max-lunch-second put-Assigned true)
        (printout t "Asignado segundo plato de la comida " (send ?max-lunch-second get-Name) " al menú del " ?day crlf)
    )
)

(defrule MENU-GENERATION::fill-lunch-dessert-slot
    ?f <- (daily-menu (day ?day) (lunch-dessert nil))
    =>
    (bind ?max 0.0)
    (bind ?max-lunch-dessert nil)
    (bind ?lunch-desserts (find-all-instances ((?lunch-desserts Dessert)) TRUE))
    (foreach ?lunch-dessert ?lunch-desserts
        (if (neq (send ?lunch-dessert get-Assigned) true) then
            (bind ?current-score (send ?lunch-dessert get-Evaluation))
            (if (> ?current-score ?max) then
                (bind ?max ?current-score)
                (bind ?max-lunch-dessert ?lunch-dessert)
            )
        )
    )
    (if (neq ?max-lunch-dessert nil) then
        (modify ?f (lunch-dessert ?max-lunch-dessert))
        (send ?max-lunch-dessert put-Assigned true)
        (printout t "Asignado postre de la comida " (send ?max-lunch-dessert get-Name) " al menú del " ?day crlf)
    )
)

(defrule MENU-GENERATION::fill-dinner-first-slot
    ?f <- (daily-menu (day ?day) (dinner-first nil))
    =>
    (bind ?max 0.0)
    (bind ?max-dinner-first nil)
    (bind ?dinner-firsts (find-all-instances ((?dinner-first Dinner)) TRUE))
    (foreach ?dinner-first ?dinner-firsts
        (if (neq (send ?dinner-first get-Assigned) true) then
            (bind ?current-score (send ?dinner-first get-Evaluation))
            (if (> ?current-score ?max) then
                (bind ?max ?current-score)
                (bind ?max-dinner-first ?dinner-first)
            )
        )
    )
    (if (neq ?max-dinner-first nil) then
        (modify ?f (dinner-first ?max-dinner-first))
        (send ?max-dinner-first put-Assigned true)
        (printout t "Asignado primer plato de la cena " (send ?max-dinner-first get-Name) " al menú del " ?day crlf)
    )
)

(defrule MENU-GENERATION::fill-dinner-second-slot
    ?f <- (daily-menu (day ?day) (dinner-second nil))
    =>
    (bind ?max 0.0)
    (bind ?max-dinner-second nil)
    (bind ?dinner-seconds (find-all-instances ((?dinner-second Dinner)) TRUE))
    (foreach ?dinner-second ?dinner-seconds
        (if (neq (send ?dinner-second get-Assigned) true) then
            (bind ?current-score (send ?dinner-second get-Evaluation))
            (if (> ?current-score ?max) then
                (bind ?max ?current-score)
                (bind ?max-dinner-second ?dinner-second)
            )
        )
    )
    (if (neq ?max-dinner-second nil) then
        (modify ?f (dinner-second ?max-dinner-second))
        (send ?max-dinner-second put-Assigned true)
        (printout t "Asignado segundo plato de la cena " (send ?max-dinner-second get-Name) " al menú del " ?day crlf)
    )
)

(defrule MENU-GENERATION::fill-dinner-dessert-slot
    ?f <- (daily-menu (day ?day) (dinner-dessert nil))
    =>
    (bind ?max 0.0)
    (bind ?max-dinner-dessert nil)
    (bind ?dinner-desserts (find-all-instances ((?dinner-desserts Dessert)) TRUE))
    (foreach ?dinner-dessert ?dinner-desserts
        (if (neq (send ?dinner-dessert get-Assigned) true) then
            (bind ?current-score (send ?dinner-dessert get-Evaluation))
            (if (> ?current-score ?max) then
                (bind ?max ?current-score)
                (bind ?max-dinner-dessert ?dinner-dessert)
            )
        )
    )
    (if (neq ?max-dinner-dessert nil) then
        (modify ?f (dinner-dessert ?max-dinner-dessert))
        (send ?max-dinner-dessert put-Assigned true)
        (printout t "Asignado postre de la cena " (send ?max-dinner-dessert get-Name) " al menú del " ?day crlf)
    )
)




