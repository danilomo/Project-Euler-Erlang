-module(problem_06).
-export([answer/0]).

answer() ->
    L = lists:seq(1,100),
    LSqr = lists:map( fun(N) -> N*N end, L ),
    SumSqr = lists:sum(LSqr),
    Sum = lists:sum(L),
    SqrSum = Sum * Sum,
    SumSqr - SqrSum.
                                
