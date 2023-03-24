package Aima.HillClimbing;

import Model.State;
import aima.search.framework.Successor;

import java.util.ArrayList;
import java.util.List;

public class SuccessorFunction implements aima.search.framework.SuccessorFunction
{
    public List<Successor> getSuccessors(Object var1)
    {
        State state = (State) var1;

        var stateSuccessors = state.GenerateAllSuccessors();

        ArrayList<Successor> successors = new ArrayList<>();
        stateSuccessors.forEach((successor) -> successors.add(new Successor("", successor)));
        return successors;
    }
}
