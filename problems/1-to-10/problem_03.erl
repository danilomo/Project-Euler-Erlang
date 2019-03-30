-module(problem_03).
-export([is_prime/1,answer/0]).

is_prime(1) -> true;
is_prime(2) -> true;
is_prime(3) -> true;
is_prime(5) -> true;
is_prime(N) when N rem 2 == 0 orelse N rem 3 == 0 -> false;
is_prime(N) -> is_prime_aux(N, 5).

is_prime_aux(N, N) -> true;
is_prime_aux(N, M) when N rem M == 0 -> false;
is_prime_aux(N, M) -> is_prime_aux(N, M+1).

answer() ->
    Number = 600851475143,
    L = lists:seq(775147, 1, -1),
    {_, Val} = lists:search( fun (N) -> Number rem N == 0 andalso is_prime(N) end, L ),
    Val.
    
               
    

