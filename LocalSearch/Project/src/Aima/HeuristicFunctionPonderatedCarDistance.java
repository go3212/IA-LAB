package Aima;

import Model.State;

public class HeuristicFunctionPonderatedCarDistance implements aima.search.framework.HeuristicFunction
{
    public double getHeuristicValue(Object var1)
    {
        State state = (State)var1;
        return (double)state.AverageDistanceHeuristic() + (double)15500*state.GetNonEmptyCars();
    }
}
