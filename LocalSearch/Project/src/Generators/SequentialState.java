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

        int userIndex = 0;
        int usersPerCar = m_Users.size()/m_Cars.size();
        for (int i = 0; i < m_Cars.size(); ++i)
        {
            for (int j = usersPerCar; j >= 0 && userIndex < m_Users.size(); --j)
            {
                if (!m_Users.get(userIndex).isConductor())
                    m_Cars.get(i).AddPassenger(m_Users.get(userIndex));
                ++userIndex;
            }
        }
        while (userIndex < m_Users.size())
        {
            m_Cars.get(userIndex%m_Cars.size()).AddPassenger(m_Users.get(userIndex));
            ++userIndex;
        }
    }
}
