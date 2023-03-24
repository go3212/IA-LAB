package Aima.HillClimbing;

import Model.State;

public class IsGoalState implements aima.search.framework.GoalTest
{
    public boolean isGoalState(Object var1)
    {
        State state = (State)var1;
        return state.IsSolution();
    }

}
