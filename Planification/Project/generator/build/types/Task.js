"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const __1 = require("..");
class Task {
    constructor(id, difficulty, hours) {
        this.m_Id = id;
        this.m_Difficulty = difficulty;
        this.m_Hours = hours;
    }
    GetInit(extension) {
        let result = "";
        switch (extension) {
            case __1.ExtensionType.EXT_4:
            case __1.ExtensionType.EXT_3:
            case __1.ExtensionType.EXT_2:
            case __1.ExtensionType.EXT_1:
            case __1.ExtensionType.EXT_0:
                result += `(= (difficulty ${this.m_Id}) ${this.m_Difficulty})`;
                result += `(= (hours ${this.m_Id}) ${this.m_Hours})`;
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
exports.default = Task;
