(define (domain software-project)
    (:requirements :typing :equality :fluents)
    (:types
        programmer task - object)
    (:functions
        (skill ?p - programmer)
        (difficulty ?t - task)
        (hours ?t - task))
    (:predicates
        (assigned ?p - programmer ?t - task)
        (task-assigned ?t - task))
    (:action assign-task-easy
        :parameters (?p - programmer ?t - task)
        :precondition (and 
            (not (task-assigned ?t))
            (>= (skill ?p) (difficulty ?t)))
        :effect (and
            (task-assigned ?t)
            (increase (hours ?t) 0)))
    (:action assign-task-hard
        :parameters (?p - programmer ?t - task)
        :precondition (and 
            (not (task-assigned ?t))
            (= (+ (skill ?p) 1) (difficulty ?t)))
        :effect (and
            (task-assigned ?t)
            (increase (hours ?t) 2)))
)
