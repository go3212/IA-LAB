(define (domain software-project)
    (:requirements :typing :equality :fluents)
    (:types
        programmer task role - object)

    (:constants
        coder reviewer - role)

    (:functions
        (working)
        (skill ?p - programmer)
        (quality ?p - programmer)
        (difficulty ?t - task)
        (task-count ?p - programmer)
        (total-hours)
)
    (:predicates
        (assigned ?p - programmer ?t - task ?r - role)
        (task-assigned ?t - task)
        (reviewed ?t - task)
        (programmer-assigned ?p - programmer)
    )

    (:action assign-task
        :parameters (?p - programmer ?t - task)
        :precondition (and 
            (not (task-assigned ?t))
            (< (task-count ?p) 2)
            (>= (+ (skill ?p) 1) (difficulty ?t)))
        :effect (and
            (task-assigned ?t)
            (programmer-assigned ?p)
            (assigned ?p ?t coder)
            (increase (total-hours) (quality ?p))
            (increase (task-count ?p) 1)
            (increase (working) 1)
            (when (= (+ (skill ?p) 1) (difficulty ?t))
                (increase (total-hours) 2))
                )
    )

    (:action review-task
        :parameters (?p1 - programmer ?p2 - programmer ?t - task)
        :precondition (and 
            (task-assigned ?t)
            (< (task-count ?p2) 2)
            (not (reviewed ?t))
            (assigned ?p1 ?t coder)
            (not (= ?p1 ?p2))
            (>= (skill ?p2) (difficulty ?t)))
        :effect (and
            (assigned ?p2 ?t reviewer)
            (increase (task-count ?p2) 1)
            (when (not (programmer-assigned ?p2)) (and (programmer-assigned ?p2) (increase (working) 1)))
            (reviewed ?t))
    )
)