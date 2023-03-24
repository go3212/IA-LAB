package Aima.HillClimbing;

import Model.State;

import java.util.List;

public class SuccessorFunction implements aima.search.framework.SuccessorFunction
{
    public List getSuccessors(Object var1)
    {
        State state = (State) var1;

        return state.GenerateAllSuccessors();
    }
}
