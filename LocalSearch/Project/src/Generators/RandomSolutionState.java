package Generators;

import IA.Comparticion.Usuarios;
import Model.State;

import java.util.Random;

public class RandomSolutionState extends State
{
    public RandomSolutionState(Usuarios users)
    {
        super(users);
        GenerateRandomSolutionState();
    }

    private void GenerateRandomSolutionState()
    {
        State state = new RandomState(this.m_Users);
        while (!state.IsSolution())
        {
            state = new RandomState(this.m_Users);
        }
        m_Cars = state.GetCars();
    }
}
