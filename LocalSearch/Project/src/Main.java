import Generators.RandomState;
import Generators.SequentialState;
import IA.Comparticion.Usuario;
import IA.Comparticion.Usuarios;
import Model.Car;
import Model.RouteType;
import Model.State;

public class Main
{
    public static void main(String[] args)
    {
        long startTimeNano = System.nanoTime();
        Usuarios users = new Usuarios(100, 10, 124); // 1ms
        State state = new SequentialState(users); // 3ms?

        //var successors = state.GenerateAllSuccessors();

        // Solucion 1
        //Usuario owner = users.get(0);
        //Usuario user1 = users.get(1);
        //Usuario user2 = users.get(2);

        //Car car = new Car(owner);
        //car.AddPassenger(owner);
        //car.AddPassenger(user1);
        //car.AddPassenger(user2);

        //car.SwapRoutes(RouteType.PICKUP, user1, RouteType.DROPOFF, user2);
        long endTimeNano = System.nanoTime();
        System.out.println((endTimeNano - startTimeNano) + "ns");
        System.out.println((endTimeNano - startTimeNano)/1000000 + "ms");
    }
}