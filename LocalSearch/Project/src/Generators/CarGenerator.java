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

        return true;
    }

    public Boolean CanDropoff(Usuario user)
    {

        return true;
    }

    private Boolean HasCapacity()
    {
        return GetRouteSpace() > 0;
    }
}
