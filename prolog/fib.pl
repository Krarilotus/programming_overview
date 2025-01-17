% fib.pl
% Usage:
%   swipl fib.pl
%   ?- main.

% fib(N, F) calculates the Nth Fibonacci number F
fib(0, 0).
fib(1, 1).
fib(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, F1),
    fib(N2, F2),
    F is F1 + F2.

% fib_list(N, List): creates a list of Fibonacci numbers [fib(0), fib(1), ..., fib(N)].
fib_list(N, List) :-
    fib_list_helper(0, N, [], Rev),
    reverse(Rev, List).

fib_list_helper(I, N, Acc, Acc) :- I > N, !.
fib_list_helper(I, N, Acc, Res) :-
    fib(I, F),
    I2 is I + 1,
    fib_list_helper(I2, N, [F|Acc], Res).

main :-
    write('Enter N: '),
    read(N),
    fib_list(N, L),
    format("Fibonacci numbers up to ~w: ~w~n", [N, L]),
    halt.
