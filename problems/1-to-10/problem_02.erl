-module(problem_02).
-export([fib_gen/1, fib_while/2, answer/0]).
-define(Max, 4000000).

fib_gen({X2, X1}) ->
    {X1, X2 + X1}.

fib_while(F, [Head|Tail]) ->
    case F(Head) of
        true -> fib_while(F, [fib_gen(Head) | [Head|Tail]]);
        _ -> [Head|Tail]
    end.

answer() ->
    X = fib_while(fun({_,I}) -> I < ?Max end, [{0,1}]),
    Y = lists:map(fun({_,I}) -> I end, X),
    lists:sum(lists:filter(fun(I) -> I rem 2 == 0 end, Y)).
