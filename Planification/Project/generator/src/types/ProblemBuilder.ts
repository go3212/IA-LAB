import { ExtensionType } from "..";
import Programmer from './Programmer';
import Task from './Task';
import { v4 as uuidv4 } from 'uuid';

class ProblemBuilder 
{
    private m_Id: string;
    private m_Domain: string;
    private m_Extension: ExtensionType;

    constructor(problemId: string, problemDomain: string, extension: ExtensionType)
    {
        this.m_Id = problemId;
        this.m_Domain = problemDomain;
        this.m_Extension = extension;
    }

    public GenerateProblem(programmers: number, tasks: number): string
    {
        let _programmers: Programmer[] = Array.from({length: programmers}, (_, i) => 
        {
            let id = `programmer${i}`;

            // La habilidad está entre 1-3
            let skill = randomIntFromInterval(1, 3);
            let quality = randomIntFromInterval(1, 2);

            let programmer = new Programmer(id, skill, quality);
            return programmer;
        });

        let _tasks: Task[] = Array.from({length: programmers}, (_, i) => 
        {
            let id = `task${i}`;

            // La habilidad está entre 1-3
            let difficulty = randomIntFromInterval(1, 3);
            let hours = randomIntFromInterval(1, 24);

            let task = new Task(id, difficulty, hours);
            return task;
        });

        return (
            `
            (define (problem ${this.m_Id})
                (:domain ${this.m_Domain})
                (:objects
                    ${_programmers.map(p => p.GetId()).join(" ")} - programmer
                    ${_tasks.map(p => p.GetId()).join(" ")} - task
                )
                (:init
                    ${_programmers.map(p => p.GetInit(this.m_Extension)).join('')} 
                    ${_tasks.map(p => p.GetInit(this.m_Extension)).join('')} 
                    ${this.m_Extension >= ExtensionType.EXT_2 ? `(= (total-hours) 0)` : ''}
                    ${this.m_Extension == ExtensionType.EXT_4 ? `(= (working) 0)` : ''}
                )
                (:goal 
                    ${this.GenerateGoalForExtension(this.m_Extension)}
                )
                ${this.m_Extension == ExtensionType.EXT_4 ? `(:metric minimize (+ (total-hours) (* (working) 1000.0))) ` : ''}
            )
            `
        );
    }

    private GenerateGoalForExtension(extension: ExtensionType)
    {
        let result = "";

        switch (extension)
        {
            case ExtensionType.EXT_4:
            case ExtensionType.EXT_3:
            case ExtensionType.EXT_2:
            case ExtensionType.EXT_1:
                return `(forall (?t - task) (and (task-assigned ?t) (reviewed ?t)))`;
            case ExtensionType.EXT_0:
                return `(forall (?t - task) (task-assigned ?t))`;
            default:
                throw new Error(`Extension ${extension} not supported!`)
        }

        return result;
    }
}

function randomIntFromInterval(min: number, max: number) 
{
    return Math.floor(Math.random() * (max - min + 1) + min);
}

  

export default ProblemBuilder;