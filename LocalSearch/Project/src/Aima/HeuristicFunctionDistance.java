package Aima;

import Model.State;

public class HeuristicFunctionDistance implements aima.search.framework.HeuristicFunction
{
    public double getHeuristicValue(Object var1)
    {
        State state = (State)var1;
        var distance = state.DistanceHeuristic();
        if (state.IsSolution())
            return distance;
        else
        {
            return distance*100;
        }
    }
}
