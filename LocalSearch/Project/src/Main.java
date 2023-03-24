import Aima.HillClimbing.HeuristicFunctionDistance;
import Aima.HillClimbing.IsGoalState;
import Aima.HillClimbing.SuccessorFunction;
import Generators.RandomSolutionState;
import Generators.RandomState;
import Generators.SequentialState;
import IA.Comparticion.Usuario;
import IA.Comparticion.Usuarios;
import Model.Car;
import Model.RouteType;
import Model.State;
import aima.search.framework.Problem;
import aima.search.framework.Search;
import aima.search.framework.SearchAgent;
import aima.search.informed.HillClimbingSearch;

public class Main
{

    public static State HillClimbing(State initalState) throws Exception {
            Problem problem = new Problem(initalState, new SuccessorFunction(), new IsGoalState(), new HeuristicFunctionDistance());
            Search search = new HillClimbingSearch();
            SearchAgent agent = new SearchAgent(problem, search);
            return (State)search.getGoalState();
    }

    public static void main(String[] args) throws Exception {
        long startTimeNano = System.nanoTime();
        Usuarios users = new Usuarios(130, 22, 124); // 1ms
        State state = new SequentialState(users); // 3ms?
        State finalState = Main.HillClimbing(state);

        System.out.println("Initial state: " + state.DistanceHeuristic());
        System.out.println("Final state: " + finalState.DistanceHeuristic());


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