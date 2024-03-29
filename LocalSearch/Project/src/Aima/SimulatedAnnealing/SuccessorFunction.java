package Aima.SimulatedAnnealing;

import Model.State;
import aima.search.framework.Successor;

import java.util.ArrayList;
import java.util.List;

public class SuccessorFunction implements aima.search.framework.SuccessorFunction
{
    public List<Successor> getSuccessors(Object var1)
    {
        State state = (State) var1;

        var stateSuccessors = state.GenerateRandomSuccessors(1);

        ArrayList<Successor> successors = new ArrayList<>();
        stateSuccessors.forEach((successor) -> successors.add(new Successor("", successor)));
        return successors;
    }
}
