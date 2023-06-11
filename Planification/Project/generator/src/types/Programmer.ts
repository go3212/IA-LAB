import { ExtensionType } from "..";

class Programmer
{
    private m_Id: string;
    private m_Skill: number;
    private m_Quality: number;
    private m_TaskCount: number;

    constructor(id: string, skill: number, quality: number)
    {
        this.m_Id = id;
        this.m_TaskCount = 0;
        this.m_Skill = skill;
        this.m_Quality = quality;
    }

    public GetInit(extension: ExtensionType): string
    {
        let result = "";

        switch (extension)
        {
            case ExtensionType.EXT_4:
            case ExtensionType.EXT_3:
                result += `(= (task-count ${this.m_Id}) ${this.m_TaskCount})`;
            case ExtensionType.EXT_2:
                result += `(= (quality ${this.m_Id}) ${this.m_Quality})`;
            case ExtensionType.EXT_1:
            case ExtensionType.EXT_0:
                result += `(= (skill ${this.m_Id}) ${this.m_Skill})`;
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

export default Programmer;