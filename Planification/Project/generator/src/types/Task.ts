import { ExtensionType } from "..";

class Task 
{
    private m_Id: string;
    private m_Difficulty: number;
    private m_Hours: number;
    
    constructor(id: string, difficulty: number, hours: number)
    {
        this.m_Id = id;
        this.m_Difficulty = difficulty;
        this.m_Hours = hours;
    }

    public GetInit(extension: ExtensionType): string
    {
        let result = "";

        switch (extension)
        {
            case ExtensionType.EXT_4:
            case ExtensionType.EXT_3:
            case ExtensionType.EXT_2:
                result += `(= (hours ${this.m_Id}) ${this.m_Hours})`;
            case ExtensionType.EXT_1:
            case ExtensionType.EXT_0:
                result += `(= (difficulty ${this.m_Id}) ${this.m_Difficulty})`;
                break;
            default:
                throw new Error(`Extension ${extension} not supported!`)
        }

        return result;
    }

    public GetId(): string
    {
        return this.m_Id;
    }
}

export default Task;