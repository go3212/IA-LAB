package Model;

import IA.Comparticion.Usuario;
import IA.Comparticion.Usuarios;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Random;

/**
 * Esta clase representa una solucion al problema.
 * -- Añadir mas info sobre que es una solucion y que elementos la componen
 */
public class State
{
    public final static Double ROUTE_MAX_DISTANCE_IN_METERS = 30000.0;
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
        successors.addAll(GenerateSuccessorsWithShift());

        return successors;
    }

    public ArrayList<State> GenerateRandomSuccessors(int number)
    {
        Random rand = new Random();
        int fh = rand.nextInt(0, number + 1);
        int sh = number - fh;
        ArrayList<State> successors =  new ArrayList<>();
        successors.addAll(GenerateRandomSuccessorsWithMove(fh));
        successors.addAll(GenerateRandomSucessorsWithShift(sh));
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

    public ArrayList<State> GenerateSuccessorsWithShift()
    {
        ArrayList<State> successors = new ArrayList<>(); // O(c*n^2)

        for (int i = 0; i < m_Cars.size(); ++i)
        {
            Car car = m_Cars.get(i);
            ArrayList<Usuario> carUsers = car.GetUsers();
            for (int j = 0; j < carUsers.size(); ++j)
            {
                Usuario user = carUsers.get(j);
                // Si lo podemos shiftear, generamos un estado sucesor...
                for (int k = 1; k < 2*car.GetUsers().size(); ++k)
                {
                    State cpState = new State(this);
                    State cpState2 = new State(this);
                    if (cpState.m_Cars.get(i).ShiftRoute(RouteType.PICKUP, user, k))
                        successors.add(cpState);
                    if (cpState2.m_Cars.get(i).ShiftRoute(RouteType.DROPOFF, user, k))
                        successors.add(cpState2);
                }
            }
        }

        return successors;
    }

    public ArrayList<State> GenerateRandomSucessorsWithShift(int number)
    {
        ArrayList<State> successors = new ArrayList<>(); // O(c*n^2)
        Random rand = new Random();

        int maxIters = 20;

        while (successors.size() != number && --maxIters != 0)
        {
            int i = rand.nextInt(0, m_Cars.size());
            Car car = m_Cars.get(i);
            ArrayList<Usuario> carUsers = car.GetUsers();
            if (car.GetUsers().size() == 0) continue;
            int j = rand.nextInt(0, car.GetUsers().size());
            Usuario user = carUsers.get(j);
            // Si lo podemos shiftear, generamos un estado sucesor...
            State cpState = new State(this);
            if (car.GetUsers().size() <= 1) continue;
            if (cpState.m_Cars.get(i).ShiftRoute(RouteType.PICKUP, user, rand.nextInt(1, car.GetUsers().size())))
                successors.add(cpState);
        }
        return successors;
    }

    public ArrayList<State> GenerateRandomSuccessorsWithMove(int number)
    {
        ArrayList<State> successors = new ArrayList<>();

        int maxIters = 20;

        // Basicamente para cada usuario (n) lo podemos mover a (c - 1) coches. El factor de ramificación es O(n*c)
        Random rand = new Random();
        int i = rand.nextInt(0, m_Cars.size());
        while (successors.size() != number && --maxIters != 0)
        {
            Car car = m_Cars.get(i);
            ArrayList<Usuario> carUsers = car.GetUsers();
            if (carUsers.size() == 0) continue;
            int j = rand.nextInt(0, carUsers.size());

            Usuario user = carUsers.get(j);
            // Si lo podemos eliminar, generamos un estado sucesor...
            State cpState = new State(this);
            if (!cpState.m_Cars.get(i).RemovePassenger(user)) continue;
            // Si lo hemos eliminado correctamente, lo añadimos a los otro coche...
            State cpState2 = new State(cpState);
            if (cpState2.m_Cars.get(rand.nextInt(0, m_Cars.size())).AddPassenger(user))
                successors.add(cpState2);
        }
        return successors;
    }

    public Double DistanceHeuristic()
    {
        Double distance = 0.0;
        for (int i = 0; i < m_Cars.size(); ++i)
            distance += m_Cars.get(i).RouteDistanceMeters();
        return distance;
    }

    public Double AverageDistanceHeuristic()
    {
        int cars = GetNonEmptyCars();
        return DistanceHeuristic()*cars;
    }

    public Boolean IsSolution()
    {
        // Miramos que todos los usuarios esten asignados...
        if (UsersInCars() != m_Users.size()) return false;

        // Distancia total < 30Km. Conductor llega a tiempo al trabajo.
        for (int i = 0; i < m_Cars.size(); ++i)
        {
            if (!m_Cars.get(i).HasDriver()) continue;
            Double routeLength = m_Cars.get(i).RouteDistanceMeters();
            if (routeLength > ROUTE_MAX_DISTANCE_IN_METERS) return false;
        }

        return true;
    }

    public int UsersInCars()
    {
        HashSet<Usuario> users = new HashSet<>();
        int userCount = 0;
        for (var car : m_Cars)
            for (var user : car.GetUsers())
                users.add(user);
        return users.size();
    }

    public ArrayList<Car> GetCars()
    {
        ArrayList<Car> cars = new ArrayList<>();
        for (int i = 0; i < m_Cars.size(); ++i)
        {
            cars.add(new Car(m_Cars.get(i)));
        }
        return cars;
    }

    public int GetNonEmptyCars()
    {
        int ncars = 0;
        for (var car : m_Cars)
            if (car.HasDriver()) ++ncars;
        return ncars;
    }


}
