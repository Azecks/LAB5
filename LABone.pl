% Базовый случай: перебрали все числа от 1 до N
sum_of_divisors(N, Current, Acc, Sum) :-
    Current > N,
    !,
    Sum = Acc.

% Случай: Current является делителем N
sum_of_divisors(N, Current, Acc, Sum) :-
    N mod Current =:= 0,
    !,
    NewAcc is Acc + Current,
    Next is Current + 1,
    sum_of_divisors(N, Next, NewAcc, Sum).

% Случай: Current не является делителем
sum_of_divisors(N, Current, Acc, Sum) :-
    Next is Current + 1,
    sum_of_divisors(N, Next, Acc, Sum).

% Главный предикат
sum_of_divisors(N, Sum) :-
    N > 0,
    sum_of_divisors(N, 1, 0, Sum).

% Точка входа
main :-
    write('Enter a natural number: '),
    flush_output,
    read(N),
    sum_of_divisors(N, Sum),
    write('Sum of divisors = '),
    write(Sum),
    nl.

:- initialization(main).