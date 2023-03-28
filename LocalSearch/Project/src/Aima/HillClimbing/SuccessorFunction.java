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
        ArrayList<State> successorsS = new ArrayList<>();
        if (state.IsSolution())
        {
            for (var s : stateSuccessors)
            {
                if (s.IsSolution()) successorsS.add(s);
            }
        } else successorsS = stateSuccessors;

        ArrayList<Successor> successors = new ArrayList<>();
        successorsS.forEach((successor) -> successors.add(new Successor("", successor)));
        return successors;
    }
}
