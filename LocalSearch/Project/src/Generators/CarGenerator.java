package Generators;

import IA.Comparticion.Usuario;
import Model.Car;

import java.util.ArrayList;
import java.util.HashSet;

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

    public Double DistanceTo(Usuario user)
    {
        if (user == null) return Double.POSITIVE_INFINITY;
        Double actDist = RouteDistanceMeters();
        m_PassengersRoute.add(user);
        Double newDist = RouteDistanceMeters();
        m_PassengersRoute.remove(m_PassengersRoute.size() - 1);
        return newDist - actDist;
    }
}
