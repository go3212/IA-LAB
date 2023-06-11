"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const ProblemBuilder_1 = __importDefault(require("./types/ProblemBuilder"));
const readline_1 = __importDefault(require("readline"));
var ExtensionType;
(function (ExtensionType) {
    ExtensionType[ExtensionType["EXT_0"] = 0] = "EXT_0";
    ExtensionType[ExtensionType["EXT_1"] = 1] = "EXT_1";
    ExtensionType[ExtensionType["EXT_2"] = 2] = "EXT_2";
    ExtensionType[ExtensionType["EXT_3"] = 3] = "EXT_3";
    ExtensionType[ExtensionType["EXT_4"] = 4] = "EXT_4";
})(ExtensionType = exports.ExtensionType || (exports.ExtensionType = {}));
const rl = readline_1.default.createInterface({
    input: process.stdin,
    output: process.stdout
});
let problemBuilder = undefined;
let problemName;
function askQuestion(query) {
    return new Promise(resolve => rl.question(query, ans => resolve(ans)));
}
(() => __awaiter(void 0, void 0, void 0, function* () {
    let problemName = yield askQuestion('Please choose a name for your problem: ');
    let problemType = parseInt(yield askQuestion('Please select a problem type (0:EXT_0, 1:EXT_1, 2:EXT_2, 3:EXT_3, 4:EXT_4): '));
    if (problemType < ExtensionType.EXT_0 || problemType > ExtensionType.EXT_4)
        console.log("Invalid problem type. Please enter a number between 0 and 4.");
    let problemProgrammers = parseInt(yield askQuestion('How many programmers do you want?: '));
    let problemTasks = parseInt(yield askQuestion('How many tasks do you want?: '));
    let domainName = "software-project";
    let problemBuilder = new ProblemBuilder_1.default(problemName, domainName, problemType);
    console.log(problemBuilder.GenerateProblem(problemProgrammers, problemTasks));
}))();
