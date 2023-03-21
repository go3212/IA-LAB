package Model;

import IA.Comparticion.Usuario;
import java.util.ArrayList;
import java.util.HashSet;

public class Car
{
    private static int MAX_PASSENGERS = 3;
    private Usuario m_Owner;
    private ArrayList<Usuario> m_PassengersRoute;

    public Car(Usuario owner)
    {
        this.m_Owner = owner;
        this.m_PassengersRoute = new ArrayList<>(MAX_PASSENGERS*2);
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

    public HashSet<Usuario> GetUsers()
    {
        HashSet<Usuario> userSet = new HashSet<>();
        m_PassengersRoute.forEach((user) ->
        {
            userSet.add(user);
        });
        return userSet;
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

    public Boolean IsFull()
    {
        return m_PassengersRoute.size() >= MAX_PASSENGERS*2;
    }

    public Boolean AddPassenger(Usuario user)
    {
        if (IsFull()) return false;
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

    public Boolean RemovePassenger(Usuario user)
    {
        if (!HasPassenger(user)) return false;
        if (m_Owner.equals(user) && m_PassengersRoute.size() > 2) return false;
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

        if (first == -1 || second == -1) return  false;

        m_PassengersRoute.set(first, user2);
        m_PassengersRoute.set(second, user1);

        return true;
    }
}
