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
        Usuarios users = new Usuarios(100, 10, 124);
        State state = new SequentialState(users);

        // Solucion 1
        Usuario owner = users.get(0);
        Usuario user1 = users.get(1);
        Usuario user2 = users.get(2);

        Car car = new Car(owner);
        car.AddPassenger(owner);
        car.AddPassenger(user1);
        car.AddPassenger(user2);

        car.SwapRoutes(RouteType.PICKUP, user1, RouteType.DROPOFF, user2);

        car.RemovePassenger(user1);

        System.out.println("");
    }
}