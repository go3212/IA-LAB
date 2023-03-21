package Generators;

import IA.Comparticion.Usuario;
import IA.Comparticion.Usuarios;
import Model.State;

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

        int i = 0;
        int j = 0;
        for (; i < m_Users.size(); ++i)
        {
            Usuario user = m_Users.get(i);

            if (user.isConductor()) continue;
            if (m_Cars.get(j).IsFull())
            {
                ++j;
                if (m_Cars.size() == j) break;
            }

            m_Cars.get(j).AddPassenger(user);
        }
    }
}
