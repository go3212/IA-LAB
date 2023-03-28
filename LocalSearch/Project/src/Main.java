import Aima.HeuristicFunctionAverageCarDistance;
import Aima.HeuristicFunctionDistance;
import Aima.IsGoalState;
import Generators.GreedySolutionState;
import Generators.RandomSolutionState;
import Generators.RandomState;
import Generators.SequentialState;
import IA.Comparticion.Usuarios;
import Model.State;
import aima.search.framework.HeuristicFunction;
import aima.search.framework.Problem;
import aima.search.framework.Search;
import aima.search.framework.SearchAgent;
import aima.search.informed.HillClimbingSearch;
import aima.search.informed.SimulatedAnnealingSearch;

public class Main
{

    public static State HillClimbing(State initialState, HeuristicFunction heuristic) throws Exception
    {
        Problem problem = new Problem(initialState, new Aima.HillClimbing.SuccessorFunction(), new IsGoalState(), heuristic);
        Search search = new HillClimbingSearch();
        SearchAgent agent = new SearchAgent(problem, search);
        return (State)search.getGoalState();
    }

    public static State SimulatedAnnealing(State initialState, HeuristicFunction heuristic) throws Exception
    {
        Problem problem = new Problem(initialState, new Aima.SimulatedAnnealing.SuccessorFunction(), new IsGoalState(), heuristic);
        Search search = new SimulatedAnnealingSearch(300000, 25, 10, 0.0001);
        SearchAgent agent = new SearchAgent(problem, search);
        return (State)search.getGoalState();
    }

    public static void Extra() throws Exception {
        long startTimeNano = System.nanoTime();
        Usuarios users = new Usuarios(200, 100, 1234); // 1ms
        State state = new SequentialState(users); // 3ms?
        State finalState1 = Main.HillClimbing(state, new HeuristicFunctionDistance());
        //State finalState2 = Main.HillClimbing(state, new HeuristicFunctionAverageCarDistance());
        System.out.println("Initial state: " + state.DistanceHeuristic());
        System.out.println("Cars: " + finalState1.GetNonEmptyCars());
        System.out.println("Final state: " + finalState1.DistanceHeuristic());
        System.out.println("Is solution: " + (finalState1.IsSolution() ? "true" : "false"));

        //var successors = state.GenerateAllSuccessors();

        // Solucion 1
        // Usuario owner = users.get(0);
        // Usuario user1 = users.get(1);
        // Usuario user2 = users.get(2);

        //Car car = new Car(owner);
        //car.AddPassenger(owner);
        //car.AddPassenger(user1);
        //car.AddPassenger(user2);

        //car.SwapRoutes(RouteType.PICKUP, user1, RouteType.DROPOFF, user2);
        long endTimeNano = System.nanoTime();
        System.out.println((endTimeNano - startTimeNano) + "ns");
        System.out.println((endTimeNano - startTimeNano)/1000000 + "ms");
    }

    public static void main(String[] args) throws Exception
    {
        long startTimeNano = System.nanoTime();
        Usuarios users = new Usuarios(200, 100, 1234); // 1ms
        State state = new RandomSolutionState(users); // 3ms?

        System.out.println("Initial state: " + state.DistanceHeuristic());
        System.out.println("Is initial state solution: " + (state.IsSolution() ? "true" : "false"));
        var finalState = Main.HillClimbing(state, new HeuristicFunctionDistance());
        System.out.println("Cars: " + finalState.GetNonEmptyCars());
        System.out.println("Final state: " + finalState.DistanceHeuristic());
        System.out.println("Is solution: " + (finalState.IsSolution() ? "true" : "false"));

        long endTimeNano = System.nanoTime();
        System.out.println((endTimeNano - startTimeNano) + "ns");
        System.out.println((endTimeNano - startTimeNano)/1000000 + "ms");
    }
}