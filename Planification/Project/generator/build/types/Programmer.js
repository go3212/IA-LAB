"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const __1 = require("..");
class Programmer {
    constructor(id, skill, quality) {
        this.m_Id = id;
        this.m_TaskCount = 0;
        this.m_Skill = skill;
        this.m_Quality = quality;
    }
    GetInit(extension) {
        let result = "";
        switch (extension) {
            case __1.ExtensionType.EXT_4:
            case __1.ExtensionType.EXT_3:
                result += `(= (task-count ${this.m_Id}) ${this.m_TaskCount})`;
            case __1.ExtensionType.EXT_2:
            case __1.ExtensionType.EXT_1:
                result += `(= (quality ${this.m_Id}) ${this.m_Quality})`;
            case __1.ExtensionType.EXT_0:
                result += `(= (skill ${this.m_Id}) ${this.m_Skill})`;
                break;
            default:
                throw new Error(`Extension ${extension} not supported!`);
        }
        return result;
    }
    GetId() {
        return this.m_Id;
    }
}
exports.default = Programmer;
