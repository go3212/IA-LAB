package Model;

import IA.Comparticion.Usuario;
import java.util.ArrayList;
import java.util.HashSet;

public class Car
{
    private static int MAX_PASSENGERS = 3;
    private static int BLOCK_DISTANCE_IN_METERS = 100;
    private Usuario m_Owner;
    private ArrayList<Usuario> m_PassengersRoute;

    public Car(Usuario owner)
    {
        this.m_Owner = owner;
        this.m_PassengersRoute = new ArrayList<>(MAX_PASSENGERS*2);
    }

    public Car(Car car)
    {
        var cpyRoutelIst = new ArrayList<Usuario>();
        car.m_PassengersRoute.forEach((action) ->
        {
            cpyRoutelIst.add(action);
        });
        this.m_PassengersRoute = cpyRoutelIst;
        this.m_Owner = car.m_Owner;
    }

    public Car(Usuario owner, ArrayList<Usuario> m_Users)
    {
        this.m_Owner = owner;
        this.m_PassengersRoute = m_Users;
    }

    public Usuario GetOwner()
    {
        return m_Owner;
    }

    public ArrayList<Usuario> GetUsers()
    {
        HashSet<Usuario> userSet = new HashSet<>();
        m_PassengersRoute.forEach((user) ->
        {
            userSet.add(user);
        });
        ArrayList<Usuario> result = new ArrayList<>();
        userSet.forEach((user) ->
        {
            result.add(user);
        });
        return result;
    }

    public Boolean HasPassenger(Usuario user)
    {
        return m_PassengersRoute.contains(user);
    }

    public Boolean HasDriver()
    {
        if (m_PassengersRoute.size() == 0) return false;
        return HasPassenger(m_Owner);
    }

    public Double RouteDistanceMeters()
    {
        HashSet<Usuario> found = new HashSet<>();

        double distance = 0;
        for (int i = 0; i < m_PassengersRoute.size() - 1; ++i)
        {
            Usuario u1 = m_PassengersRoute.get(i);
            Usuario u2 = m_PassengersRoute.get(i + 1);

            double u1x = found.contains(u1) ? u1.getCoordOrigenX() : u1.getCoordDestinoX();
            double u1y = found.contains(u1) ? u1.getCoordOrigenY() : u1.getCoordDestinoY();
            double u2x = found.contains(u2) ? u2.getCoordOrigenX() : u2.getCoordDestinoX();
            double u2y = found.contains(u2) ? u2.getCoordOrigenY() : u2.getCoordDestinoY();

            found.add(u1);
            found.add(u2);

            distance += Math.abs(u1x - u2x) + Math.abs(u1y - u2y);
        }

        return distance*BLOCK_DISTANCE_IN_METERS;
    }

    public Boolean AddPassenger(Usuario user)
    {
        //if (IsFull()) return false;
        if (!HasDriver() && !user.equals(m_Owner)) return false;
        if (HasPassenger(user)) return false;

        if (user.equals(m_Owner))
        {
            m_PassengersRoute.add(user);
            m_PassengersRoute.add(user);
        }
        else
        {
            m_PassengersRoute.set(m_PassengersRoute.size() - 1, user);
            m_PassengersRoute.add(user);
            m_PassengersRoute.add(m_Owner);
        }
        return true;
    }

    public Boolean CanRemovePassenger(Usuario user)
    {
        if (!HasPassenger(user)) return false;
        if (m_Owner.equals(user) && m_PassengersRoute.size() > 2) return false;
        return true;
    }
    public Boolean RemovePassenger(Usuario user)
    {
        if (!this.CanRemovePassenger(user)) return false;
        m_PassengersRoute.remove(user);
        m_PassengersRoute.remove(user);
        return true;
    }

    public Boolean SwapRoutes(RouteType r1, Usuario user1,
                              RouteType r2, Usuario user2)
    {
        if (m_Owner.equals(user1) || m_Owner.equals(user2)) return false;
        if (!HasPassenger(user1)) return false;
        if (!HasPassenger(user2)) return false;

        int first = -1;
        int second = -1;

        if (r1 == RouteType.PICKUP)         first = m_PassengersRoute.indexOf(user1);
        else if (r1 == RouteType.DROPOFF)   first = m_PassengersRoute.lastIndexOf(user1);

        if (r2 == RouteType.PICKUP)         second = m_PassengersRoute.indexOf(user2);
        else if (r2 == RouteType.DROPOFF)   second = m_PassengersRoute.lastIndexOf(user2);

        if (first == -1 || second == -1) return false;

        // Probamos a ver si es valida
        m_PassengersRoute.set(first, user2);
        m_PassengersRoute.set(second, user1);

        if (CheckRouteIntegrity()) return true;

        // Rollback
        m_PassengersRoute.set(first, user1);
        m_PassengersRoute.set(second, user2);
        return false;
    }

    public void Replace(Usuario inUser, Usuario outUser)
    {

    }

    private Boolean CheckRouteIntegrity()
    {
        int space = MAX_PASSENGERS;

        HashSet<Usuario> found = new HashSet<Usuario>();

        for (int i = 0; i < m_PassengersRoute.size(); ++i)
        {
            if (space < 0) return false;
            if (!found.contains(m_PassengersRoute.get(i)))
            {
                --space;
                found.add(m_PassengersRoute.get(i));
            }
            else ++space;
        }

        return true;
    }
}