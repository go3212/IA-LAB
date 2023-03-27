package Generators;

import IA.Comparticion.Usuario;
import IA.Comparticion.Usuarios;
import Model.Car;
import Model.State;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class GreedySolutionState extends State
{
    public GreedySolutionState(Usuarios users)
    {
        super(users);
    }

    private void GreedySolution()
    {
        HashSet<Usuario> pickups = new HashSet<Usuario>();
        HashSet<Usuario> dropoffs = new HashSet<Usuario>();

        ArrayList<CarGenerator> carGenerators = new ArrayList<>();

        // Los conductores se suben a los coches...
        m_Cars.forEach((car) -> carGenerators.add(new CarGenerator(car.GetOwner())));

        // Ahora, por cada iteración, buscamos la "operacion" posible mas cercana...
        carGenerators.forEach((car) ->
        {
            car.GetPassengersRoute().add(car.GetOwner());
            pickups.remove(car.GetOwner());
        });


    }

    private boolean CarCanDoAction(CarGenerator car)
    {
        return true;
    }
}
