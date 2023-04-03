import Aima.HeuristicFunctionDistance;
import Aima.HeuristicFunctionPonderatedCarDistance;
import Aima.IsGoalState;
import Generators.*;
import IA.Comparticion.Usuarios;
import Model.Car;
import Model.Result;
import Model.State;
import aima.search.framework.HeuristicFunction;
import aima.search.framework.Problem;
import aima.search.framework.Search;
import aima.search.framework.SearchAgent;
import aima.search.informed.HillClimbingSearch;
import aima.search.informed.SimulatedAnnealingSearch;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class Main
{

    public static State HillClimbing(State initialState, HeuristicFunction heuristic) throws Exception
    {
        Problem problem = new Problem(initialState, new Aima.HillClimbing.SuccessorFunction(), new IsGoalState(), heuristic);
        Search search = new HillClimbingSearch();
        SearchAgent agent = new SearchAgent(problem, search);
        return (State)search.getGoalState();
    }

    public static State SimulatedAnnealing(State initialState, HeuristicFunction heuristic, int steps, int stiter, int k, double lamb) throws Exception
    {
        Problem problem = new Problem(initialState, new Aima.SimulatedAnnealing.SuccessorFunction(), new IsGoalState(), heuristic);
        Search search = new SimulatedAnnealingSearch(steps, stiter, k, lamb);
        SearchAgent agent = new SearchAgent(problem, search);
        return (State)search.getGoalState();
    }

    public static void Extra() throws Exception {
        long startTimeNano = System.nanoTime();
        Usuarios users = new Usuarios(200, 100, 1234); // 1ms
        State state = new RandomSolutionState(users); // 3ms?
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

    public static void SimAnnealingStepsExperiment() throws Exception {
        for (int i = 2500; i <= 100000; i += 2500)
        {
            long startTimeNano = System.nanoTime();
            Random seed = new Random();

            Usuarios users = new Usuarios(200, 100, seed.nextInt(0, 312984128)); // 1ms
            State state = new RandomSolutionState(users); // 3ms?
            //System.out.println("Initial state: " + state.DistanceHeuristic());
            //System.out.println("Is initial state solution: " + (state.IsSolution() ? "true" : "false"));
            var finalState = Main.SimulatedAnnealing(state, new HeuristicFunctionDistance(), i, 10, 5, 0.01);
            //System.out.println("Cars: " + finalState.GetNonEmptyCars());
            //System.out.println("Final state: " + finalState.DistanceHeuristic());
            //System.out.println("Is solution: " + (finalState.IsSolution() ? "true" : "false"));
            long endTimeNano = System.nanoTime();

            Double distKm = (finalState.DistanceHeuristic()/1000);
            System.out.println(distKm.intValue() + ";" + finalState.GetNonEmptyCars() + ";" + (endTimeNano - startTimeNano)/1000000 + ";" + i);

            //System.out.println((endTimeNano - startTimeNano) + "ns");
            //System.out.println((endTimeNano - startTimeNano)/1000000 + "ms");
        }
    }

    public static void main(String[] args) throws Exception
    {

        int users;
        int drivers;
        int algorithmChoice;
        int heuristic;
        int seed;

        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter number of users: ");
        users = scanner.nextInt();

        System.out.print("Enter number of drivers: ");
        drivers = scanner.nextInt();

        System.out.print("Enter a seed: ");
        seed = scanner.nextInt();

        System.out.println("Please select an algorithm:");
        System.out.println("1. Hill Climbing");
        System.out.println("2. Simulated Annealing");
        algorithmChoice = scanner.nextInt();

        System.out.println("Please select an heuristic:");
        System.out.println("1. Distance");
        System.out.println("2. Distance ponderated with number of drivers");
        heuristic = scanner.nextInt();

        HeuristicFunction h;
        if (heuristic == 1) h = new HeuristicFunctionDistance();
        else h = new HeuristicFunctionPonderatedCarDistance();

        Usuarios u = new Usuarios(200, 100, seed); // 1ms
        State initialState = new RandomSolutionState(u);
        State solutionState;

        if (algorithmChoice == 1)
        {
            // Run Simulated Annealing algorithm
            System.out.println("Running Hill Climbing algorithm...");
            solutionState = Main.HillClimbing(initialState, h);
        }
        else if (algorithmChoice == 2)
        {
            // Run Hill Climbing algorithm
            System.out.println("Running Simulated Annealing algorithm...");
            solutionState = Main.SimulatedAnnealing(initialState, h, 20000, 10, 100, 0.01);

        } else {
            throw new Exception("ERROR, algorithm not found");
        }

        var cars = solutionState.GetCars();
        for (var car : cars)
        {
            car.PrintRoute();
        }

    }
}