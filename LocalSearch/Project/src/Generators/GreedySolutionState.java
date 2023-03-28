package Generators;

import IA.Comparticion.Usuario;
import IA.Comparticion.Usuarios;
import Model.Car;
import Model.State;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;

public class GreedySolutionState extends State
{
    public GreedySolutionState(Usuarios users)
    {
        super(users);
        GreedySolution();
    }

    private void GreedySolution()
    {
        LinkedList<Usuario> pickups = new LinkedList<Usuario>();
        LinkedList<Usuario> dropoffs = new LinkedList<Usuario>();

        ArrayList<CarGenerator> carGenerators = new ArrayList<>();

        // Los conductores se suben a los coches...
        m_Cars.forEach((car) -> carGenerators.add(new CarGenerator(car.GetOwner())));

        // Ahora, por cada iteración, buscamos la "operacion" posible mas cercana...
        carGenerators.forEach((car) ->
        {
            car.GetPassengersRoute().add(car.GetOwner());
        });

        m_Users.forEach((user) ->
        {
            if (!user.isConductor())
            {
                pickups.add(user);
                dropoffs.add(user);
            }
        });

        while (pickups.size() != 0 || dropoffs.size() != 0)
        {
            CarGenerator carClosest = null;
            Usuario carClosestAction = null;
            for (int i = 0; i < carGenerators.size(); ++i)
            {
                CarGenerator cCar = carGenerators.get(i);
                if (carClosest == null)
                    carClosest =  carGenerators.get(i);

                Usuario closestPickup = ClosestPickup(cCar, pickups);
                Usuario closestDropoff = ClosestDropoff(cCar, dropoffs);

                if (carClosestAction == null)
                {
                    if (cCar.DistanceTo(closestDropoff) > cCar.DistanceTo(closestPickup))
                        carClosestAction = closestPickup;
                    else carClosestAction = closestDropoff;
                    carClosest = cCar;
                }
                else
                {
                    if (carClosest.DistanceTo(carClosestAction) > cCar.DistanceTo(closestPickup))
                    {
                        carClosest = cCar;
                        carClosestAction = closestPickup;
                    }

                    if (carClosest.DistanceTo(carClosestAction) > cCar.DistanceTo(closestDropoff))
                    {
                        carClosest = cCar;
                        carClosestAction = closestDropoff;
                    }
                }
            }

            if (carClosest != null && carClosestAction != null)
            {
                carClosest.GetPassengersRoute().add(carClosestAction);

                if (carClosest.RouteDistanceMeters() > State.ROUTE_MAX_DISTANCE_IN_METERS)
                {
                    carClosest.RemovePassenger(carClosestAction);
                    pickups.remove(carClosestAction);
                    dropoffs.remove(carClosestAction);
                    pickups.add(carClosestAction);
                    dropoffs.add(carClosestAction);
                    carClosest.GetPassengersRoute().add(carClosest.GetOwner());
                    continue;
                }

                if (carClosest.CanDropoff(carClosestAction)) {
                    pickups.remove(carClosestAction);
                } else dropoffs.remove(carClosestAction);
            }

        }

        carGenerators.forEach((car) ->
        {
            if (car.HasCapacity())
                car.GetPassengersRoute().add(car.GetOwner());
        });
        this.m_Cars = new ArrayList<Car>(carGenerators);
    }

    private Usuario ClosestPickup(CarGenerator car, LinkedList<Usuario> availablePickups)
    {
        if (!car.HasCapacity()) return null;
        if (availablePickups.size() == 0) return null;

        Usuario closestPickup = availablePickups.get(0);

        for (int i = 1; i < availablePickups.size(); ++i)
        {
            if (car.DistanceTo(closestPickup) > car.DistanceTo(availablePickups.get(i)))
                closestPickup = availablePickups.get(i);
        }
        return closestPickup;
    }

    private Usuario ClosestDropoff(CarGenerator car, LinkedList<Usuario> availableDropoffs)
    {
        Usuario closestDropoff = null;

        int i = 0;
        while (closestDropoff == null && i < availableDropoffs.size())
        {
            if (car.HasPassenger(availableDropoffs.get(i)))
                closestDropoff = availableDropoffs.get(i);
            ++i;
        }

        for (; i < availableDropoffs.size(); ++i)
        {
            if (car.DistanceTo(closestDropoff) > car.DistanceTo(availableDropoffs.get(i)))
                closestDropoff = availableDropoffs.get(i);
        }
        return closestDropoff;
    }
}
