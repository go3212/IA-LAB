package Model;

import IA.Comparticion.Usuario;
import IA.Comparticion.Usuarios;

import java.util.ArrayList;
import java.util.HashSet;

/**
 * Esta clase representa una solucion al problema.
 * -- Añadir mas info sobre que es una solucion y que elementos la componen
 */
public class State
{
    private static int ROUTE_MAX_DISTANCE_IN_METERS = 30000;
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

    public State (State state)
    {
        this.m_Cars = new ArrayList<Car>(state.m_Cars.size());
        state.m_Cars.forEach((car -> this.m_Cars.add(new Car(car))));
        this.m_Users = state.m_Users;
    }

    public ArrayList<State> GenerateAllSuccessors()
    {
        ArrayList<State> successors = new ArrayList<>();

        successors.addAll(GenerateSuccessorsWithSwapInCar());
        successors.addAll(GenerateSuccessorsWithMove());

        return successors;
    }

    public ArrayList<State> GenerateSuccessorsWithSwapInCar()
    {
        ArrayList<State> successors = new ArrayList<>();
        // Generamos con swap: Factor ramificación O(nCars*(maxUsersInCar^2))
        for (int i = 0; i < m_Cars.size(); ++i)
        {
            Car car = m_Cars.get(i);
            ArrayList users = car.GetUsers();
            for (int j = 0; j < users.size(); ++j)
            {
                System.out.println(j);
                Usuario user1 = m_Users.get(j);
                for (int k = j + 1; k < users.size(); ++k)
                {
                    Usuario user2 = m_Users.get(k);

                    State cp0 = new State(this);
                    State cp1 = new State(this);
                    State cp2 = new State(this);
                    State cp3 = new State(this);

                    if(cp0.m_Cars.get(i).SwapRoutes(RouteType.PICKUP, user1, RouteType.PICKUP, user2)) successors.add(cp0);
                    if(cp1.m_Cars.get(i).SwapRoutes(RouteType.DROPOFF, user1, RouteType.PICKUP, user2)) successors.add(cp1);
                    if(cp2.m_Cars.get(i).SwapRoutes(RouteType.PICKUP, user1, RouteType.DROPOFF, user2)) successors.add(cp2);
                    if(cp3.m_Cars.get(i).SwapRoutes(RouteType.DROPOFF, user1, RouteType.DROPOFF, user2)) successors.add(cp3);
                }
            }
        }
        return successors;
    }

    public ArrayList<State> GenerateSuccessorsWithMove()
    {
        ArrayList<State> successors = new ArrayList<>();
        // Basicamente para cada usuario (n) lo podemos mover a (c - 1) coches. El factor de ramificación es O(n*c)
        for (int i = 0; i < m_Cars.size(); ++i)
        {
            Car car = m_Cars.get(i);
            ArrayList<Usuario> carUsers = car.GetUsers();
            for (int j = 0; j < carUsers.size(); ++j)
            {
                Usuario user = carUsers.get(j);
                // Si lo podemos eliminar, generamos un estado sucesor...
                State cpState = new State(this);
                if(!cpState.m_Cars.get(i).RemovePassenger(user)) continue;
                // Si lo hemos eliminado correctamente, lo añadimos a los otros coches...
                for (int k = 0; k < m_Cars.size(); ++k)
                {
                    if (k == i) continue;
                    State cpState2 =  new State(cpState);
                    if (cpState2.m_Cars.get(k).AddPassenger(user)) successors.add(cpState2);
                }
            }
        }
        return successors;
    }

    public Boolean IsSolution()
    {
        Boolean isSolution = true;
        return true;
    }
}
