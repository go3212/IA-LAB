package Generators;

import IA.Comparticion.Usuario;
import IA.Comparticion.Usuarios;
import Model.Car;
import Model.State;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Random;

public class RandomSolutionState extends State
{
    public RandomSolutionState(Usuarios users)
    {
        super(users);
        GenerateRandomSolutionState();
    }

    private void GenerateRandomSolutionState()
    {
        var cars = new ArrayList<CarGenerator>();
        do
        {
            Random rand = new Random();
            var aCars = new ArrayList<CarGenerator>();
            for (var car : m_Cars) aCars.add(new CarGenerator(car.GetOwner()));

            cars = new ArrayList<CarGenerator>();

            while (aCars.size() != 0)
            {
                int i = rand.nextInt(0,aCars.size());
                cars.add(aCars.get(i));
                aCars.remove(i);
            }

            for (var car : cars) car.PushToRoute(car.GetOwner());

            LinkedList<Usuario> pickups = new LinkedList<>();
            for (var user : m_Users)
                if (!user.isConductor()) pickups.add(user);
            LinkedList<Usuario> dropoffs = new LinkedList<>();
            for (var user : m_Users)
                if (!user.isConductor()) dropoffs.add(user);

            for (var car : cars)
            {
                Usuario user = null;
                while (car.HasCapacity() && (pickups.size() > 0 || dropoffs.size() > 0 ))
                {
                    var closestAction = ClosestAction(car, pickups, dropoffs);

                    if (closestAction == null) break;

                    car.PushToRoute(closestAction);
                    car.PushToRoute(closestAction);
                    pickups.remove(closestAction);
                    dropoffs.remove(closestAction);

                    if (car.RouteDistanceMeters() > State.ROUTE_MAX_DISTANCE_IN_METERS)
                    {
                        do
                        {
                            var last = car.GetPassengersRoute().get(car.GetPassengersRoute().size() - 1);
                            if (last == car.GetOwner()) break;
                            car.RemovePassenger(last);
                            pickups.add(last);
                            dropoffs.add(last);
                        } while (car.RouteDistanceMeters() + (rand.nextDouble(0, 10))*car.DistanceTo(car.GetOwner()) >= State.ROUTE_MAX_DISTANCE_IN_METERS);
                        break;
                    }
                }
            }
            for (var c : cars) c.PushToRoute(c.GetOwner());
            m_Cars = new ArrayList<Car>(cars);
        } while (!this.IsSolution());
        //} while (m_Users.size() != this.UsersInCars());
    }

    private Usuario ClosestAction(CarGenerator car, LinkedList<Usuario> availablePickups, LinkedList<Usuario> availableDropoffs)
    {
        var cp = ClosestPickup(car, availablePickups);
        var cd = ClosestDropoff(car, availableDropoffs);
        if (cp == null && cd == null) return null;
        if (cp == null) return cd;
        if (cd == null) return cp;
        if (car.DistanceTo(cp) > car.DistanceTo(cd)) return cd;
        return cp;
    }

    private Usuario ClosestPickup(CarGenerator car, LinkedList<Usuario> availablePickups)
    {
        if (!car.HasCapacity()) return null;
        if (availablePickups.size() == 0) return null;

        Usuario closestPickup = null;

        Random rand = new Random();

        int i = 0;
        while (closestPickup == null && i < availablePickups.size())
        {
            if (!car.HasPassenger(availablePickups.get(i)) && car.CanPickup(availablePickups.get(i)))
                closestPickup = availablePickups.get(i);
            ++i;
        }

        for (; i < availablePickups.size(); ++i)
        {
            if (car.DistanceTo(closestPickup) > car.DistanceTo(availablePickups.get(i)))
                closestPickup = availablePickups.get(i);
        }
        return closestPickup;
    }

    private Usuario ClosestDropoff(CarGenerator car, LinkedList<Usuario> availableDropoffs)
    {
        Usuario closestDropoff = null;

        Random rand = new Random();

        int i = 0;
        while (closestDropoff == null && i < availableDropoffs.size())
        {
            if (car.HasPassenger(availableDropoffs.get(i)) && car.CanDropoff(availableDropoffs.get(i)))
                closestDropoff = availableDropoffs.get(i);
            ++i;
        }

        for (; i < availableDropoffs.size(); ++i)
        {
            if (car.DistanceTo(closestDropoff) > car.DistanceTo(availableDropoffs.get(i)) && car.CanDropoff(availableDropoffs.get(i)))
                closestDropoff = availableDropoffs.get(i);
        }
        return closestDropoff;
    }
}
