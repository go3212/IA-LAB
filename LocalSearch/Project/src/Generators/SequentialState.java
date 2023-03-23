package Generators;

import IA.Comparticion.Usuario;
import IA.Comparticion.Usuarios;
import Model.State;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class SequentialState extends State
{
    public SequentialState(Usuarios users)
    {
        super(users);
        this.GenerateSequential();
    }

    private void GenerateSequential()
    {
        // Para cada coche, subimos al conductor.
        m_Cars.forEach((car) ->
        {
            car.AddPassenger(car.GetOwner());
        });

        // Bastante ineficiente a la hora de meter a los usuarios, pero como no se hace frecuentemente NO
        // merece la pena optimizar.

        Queue<Usuario> unassignedUsers = new LinkedList<Usuario>();
        m_Users.forEach((user) ->
        {
            if (!user.isConductor()) unassignedUsers.add(user);
        });

        for (int i = 0; i < m_Cars.size(); ++i) // Este bucle se puede optimizar MUCHO pero no merece la pena.
            m_Cars.get(i%m_Cars.size()).AddPassenger(unassignedUsers.remove());
    }
}
