(define (domain software-project)
    (:requirements :typing :equality :fluents)
    (:types
        programmer task - object)
    (:functions
        (skill ?p - programmer)
        (difficulty ?t - task))
    (:predicates
        (assigned ?p - programmer ?t - task)
        (task-assigned ?t - task))
    (:action assign-task
        :parameters (?p - programmer ?t - task)
        :precondition (and 
            (not (task-assigned ?t))
            (>= (skill ?p) (- (difficulty ?t) 1)))
        :effect
            (task-assigned ?t)
    )
)
