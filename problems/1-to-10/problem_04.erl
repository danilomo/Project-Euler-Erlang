-module(problem_04).
-export([next/1,answer/0]).

next({0,0}) ->
    ok;
next({N,100}) ->
    {N-1,999};
next({N, M}) ->
    {N, M-1}.

palindrome(I) ->
    L = integer_to_list(I),
    L == lists:reverse(L).

generate({100,100}) ->
    [];
generate({N,M}) ->
    case palindrome(N*M) of
        true -> [ N*M | generate(next({N,M})) ];
        _ -> generate(next({N,M}))          
    end.            

answer() -> lists:max(generate({999,999})).
