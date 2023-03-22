package Aima;

import Model.State;

import java.util.List;

public class HillClimbingSuccessorFunction implements aima.search.framework.SuccessorFunction
{
    public List getSuccessors(Object var1)
    {
        State state = (State) var1;

        return state.GenerateAllSuccessors();
    }
}
