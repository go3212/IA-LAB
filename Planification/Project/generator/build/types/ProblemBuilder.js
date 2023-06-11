"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const __1 = require("..");
const Programmer_1 = __importDefault(require("./Programmer"));
const Task_1 = __importDefault(require("./Task"));
class ProblemBuilder {
    constructor(problemId, problemDomain, extension) {
        this.m_Id = problemId;
        this.m_Domain = problemDomain;
        this.m_Extension = extension;
    }
    GenerateProblem(programmers, tasks) {
        let _programmers = Array.from({ length: programmers }, (_, i) => {
            let id = `programmer${i}`;
            // La habilidad está entre 1-3
            let skill = randomIntFromInterval(1, 3);
            let quality = randomIntFromInterval(1, 2);
            let programmer = new Programmer_1.default(id, skill, quality);
            return programmer;
        });
        let _tasks = Array.from({ length: programmers }, (_, i) => {
            let id = `task${i}`;
            // La habilidad está entre 1-3
            let difficulty = randomIntFromInterval(1, 3);
            let hours = randomIntFromInterval(1, 24);
            let task = new Task_1.default(id, difficulty, hours);
            return task;
        });
        return (`
            (define (problem ${this.m_Id})
                (:domain ${this.m_Domain})
                (:objects
                    ${_programmers.map(p => p.GetId()).join(" ")} - programmer
                    ${_tasks.map(p => p.GetId()).join(" ")} - task
                )
                (:init
                    ${_programmers.map(p => p.GetInit(this.m_Extension)).join('')} 
                    ${_tasks.map(p => p.GetInit(this.m_Extension)).join('')} 
                    ${this.m_Extension >= __1.ExtensionType.EXT_2 ? `(= (total-hours) 0)` : ''}
                    ${this.m_Extension == __1.ExtensionType.EXT_4 ? `(= (working) 0)` : ''}
                )
                (:goal 
                    ${this.GenerateGoalForExtension(this.m_Extension)}
                )
                ${this.m_Extension == __1.ExtensionType.EXT_4 ? `(:metric minimize (+ (total-hours) (* (working) 1000.0))) ` : ''}
            )
            `);
    }
    GenerateGoalForExtension(extension) {
        let result = "";
        switch (extension) {
            case __1.ExtensionType.EXT_4:
            case __1.ExtensionType.EXT_3:
            case __1.ExtensionType.EXT_2:
            case __1.ExtensionType.EXT_1:
                return `(forall (?t - task) (and (task-assigned ?t) (reviewed ?t)))`;
            case __1.ExtensionType.EXT_0:
                return `(forall (?t - task) (task-assigned ?t))`;
            default:
                throw new Error(`Extension ${extension} not supported!`);
        }
        return result;
    }
}
function randomIntFromInterval(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}
exports.default = ProblemBuilder;
