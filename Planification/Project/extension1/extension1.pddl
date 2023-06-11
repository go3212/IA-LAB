(define (domain software-project)
    (:requirements :typing :equality :fluents)
    (:types
        programmer task role - object)
    (:constants
        coder reviewer - role)
    (:functions
        (skill ?p - programmer)
        ;(quality ?p - programmer)
        (difficulty ?t - task))
    (:predicates
        (assigned ?p - programmer ?t - task ?r - role)
        (task-assigned ?t - task)
        (reviewed ?t - task))
    (:action assign-task
        :parameters (?p - programmer ?t - task)
        :precondition (and 
            (not (task-assigned ?t))
            (>= (skill ?p) (- (difficulty ?t) 1)))
        :effect (and
            (task-assigned ?t)
            (assigned ?p ?t coder)))
    (:action review-task
        :parameters (?p1 - programmer ?p2 - programmer ?t - task)
        :precondition (and 
            (task-assigned ?t)
            (not (reviewed ?t))
            (assigned ?p1 ?t coder)
            (not (= ?p1 ?p2))
            (>= (skill ?p2) (difficulty ?t)))
        :effect (and
            (assigned ?p2 ?t reviewer)
            (reviewed ?t)))
)
