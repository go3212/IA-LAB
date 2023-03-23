package Generators;

import IA.Comparticion.Usuario;
import IA.Comparticion.Usuarios;
import Model.State;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Random;

public class RandomState extends State
{
    public RandomState(Usuarios users)
    {
        super(users);
        this.GenerateRandom();
    }

    private void GenerateRandom()
    {

        // Bastante ineficiente a la hora de meter a los usuarios, pero como no se hace frecuentemente NO
        // merece la pena optimizar.

        LinkedList<Usuario> unassignedUsers = new LinkedList<Usuario>();
        m_Users.forEach((user) ->
        {
            unassignedUsers.add(user);
        });

        Random rand = new Random();

        while (unassignedUsers.size() != 0) // Este bucle se puede optimizar MUCHO pero no merece la pena.
        {
            int carId = Math.abs(rand.nextInt())%m_Cars.size();
            int userId = Math.abs(rand.nextInt())%unassignedUsers.size();
            Usuario user = unassignedUsers.get(userId);
            if (!m_Cars.get(carId).AddPassenger(user)) continue;
            unassignedUsers.remove(userId);
        }

    }
}
