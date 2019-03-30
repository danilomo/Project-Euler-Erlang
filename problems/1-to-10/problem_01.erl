-module(problem_01).
-export([sum_multiples/0]).

sum_multiples() ->
    lists:sum([ X || X <- lists:seq(1,999), X rem 3 == 0 orelse X rem 5 == 0 ]).

