package Aima;

import Model.State;

public class HeuristicFunctionAverageCarDistance implements aima.search.framework.HeuristicFunction
{
    public double getHeuristicValue(Object var1)
    {
        State state = (State)var1;
        return (double)state.AverageDistanceHeuristic();
    }
}
