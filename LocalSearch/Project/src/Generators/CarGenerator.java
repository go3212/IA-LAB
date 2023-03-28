package Generators;

import IA.Comparticion.Usuario;
import Model.Car;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Random;

public class CarGenerator extends Car
{
    public CarGenerator(Usuario owner)
    {
        super(owner);
    }

    public ArrayList<Usuario> GetPassengersRoute()
    {
        return m_PassengersRoute;
    }

    public Boolean CanPickup(Usuario user)
    {
        if (!HasCapacity()) return false;
        return !CanDropoff(user);
    }

    public Boolean CanDropoff(Usuario user)
    {
        int occ = 0;
        for (int i = 0; i < m_PassengersRoute.size(); ++i)
        {
            if (m_PassengersRoute.get(i) == user) ++occ;
        }
        return occ%2 != 0;
    }

    public Boolean HasCapacity()
    {
        if (m_PassengersRoute.size() == 0) return true;
        if (m_PassengersRoute.size() <= 1) return true;
        if (m_PassengersRoute.get(m_PassengersRoute.size() - 1) == GetOwner())
            return false;
        return GetRouteSpace() > 0;
    }

    public void PushToRoute(Usuario user)
    {
        m_PassengersRoute.add(user);
    }

    public void PopFromRoute()
    {
        if (m_PassengersRoute.size() == 0) return;
        m_PassengersRoute.remove(m_PassengersRoute.size() - 1);
    }

    public void Shuffle()
    {
        if (m_PassengersRoute.size() <= 2) return;
        Random rand = new Random();
        for (int i = 0; i < m_PassengersRoute.size(); ++i)
        {
            int j = rand.nextInt(1, m_PassengersRoute.size() - 1);
            int k = rand.nextInt(1, m_PassengersRoute.size() - 1);
            var temp = m_PassengersRoute.get(j);
            m_PassengersRoute.set(j, m_PassengersRoute.get(k));
            m_PassengersRoute.set(k, temp);
        }
    }

    public Double DistanceTo(Usuario user)
    {
        if (user == null) return Double.POSITIVE_INFINITY;
        Double actDist = RouteDistanceMeters();
        m_PassengersRoute.add(user);
        Double newDist = RouteDistanceMeters();
        m_PassengersRoute.remove(m_PassengersRoute.size() - 1);
        return newDist - actDist;
    }

    public Double DistanceTo(Usuario user, Usuario user2)
    {
        if (user == null) return Double.POSITIVE_INFINITY;
        Double actDist = RouteDistanceMeters();
        PushToRoute(user);
        PushToRoute(user2);
        Double newDist = RouteDistanceMeters();
        PopFromRoute();
        PopFromRoute();
        return newDist - actDist;
    }
}
