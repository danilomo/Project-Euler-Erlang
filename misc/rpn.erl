-module(rpn).
-export([process/2, rpn/1]).

rpn(Expr) ->
     lists:foldl( fun(X,Y) -> process(X, Y) end, [], Expr ).

process(N, Stack) when is_integer(N) ->
    [N | Stack];
process('+', [X, Y| Tail]) ->
    [ Y + X | Tail ];
process('-', [X, Y| Tail]) ->
    [ Y - X | Tail ];
process('*', [X, Y| Tail]) ->
    [ Y * X | Tail ];
process('/', [X, Y| Tail]) ->
    [ Y + X | Tail ];
process('%', [X, Y| Tail]) ->
    [ Y rem X | Tail ].








