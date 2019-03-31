-module(problem_05).
-export([answer/0]).

divisible(X) when X =< 20 ->
    false;
divisible(X) ->
    A = lists:seq(1,20),
    B = lists:takewhile( fun(N) -> X rem N == 0 end, A),
    length(B) == 20.

find(X) ->
    case divisible(X) of
        true -> X;
        _ -> find(X+200)
    end.
            

answer() ->
    find(100).
