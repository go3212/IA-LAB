import ProblemBuilder from "./types/ProblemBuilder";
import readline from 'readline';

export enum ExtensionType
{
    EXT_0 = 0,
    EXT_1,
    EXT_2,
    EXT_3,
    EXT_4
}

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function askQuestion(query: string) 
{
    return new Promise(resolve => rl.question(query, ans => resolve(ans)))
}

(async () => 
{
    let problemName = await askQuestion('Please choose a name for your problem: ') as string;
    
    let problemType = parseInt(await askQuestion('Please select a problem type (0:EXT_0, 1:EXT_1, 2:EXT_2, 3:EXT_3, 4:EXT_4): ') as string);
    if (problemType < ExtensionType.EXT_0 || problemType > ExtensionType.EXT_4)
        console.log("Invalid problem type. Please enter a number between 0 and 4.");

    let problemProgrammers = parseInt(await askQuestion('How many programmers do you want?: ') as string);
    let problemTasks = parseInt(await askQuestion('How many tasks do you want?: ') as string);

    let domainName = "software-project";
    let problemBuilder = new ProblemBuilder(problemName, domainName, problemType);
    console.log(problemBuilder.GenerateProblem(problemProgrammers, problemTasks));
})();


