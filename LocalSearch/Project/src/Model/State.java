package Model;

import IA.Comparticion.Usuarios;

import java.util.ArrayList;

/**
 * Esta clase representa una solucion al problema.
 * -- Añadir mas info sobre que es una solucion y que elementos la componen
 */
public class State
{
    protected Usuarios m_Users;
    protected ArrayList<Car> m_Cars;

    public State(Usuarios users)
    {
        this.m_Users = users;
        this.m_Cars = new ArrayList<>();
        users.forEach((user) ->
        {
            if (user.isConductor())
                this.m_Cars.add(new Car(user));
        });
    }
}
