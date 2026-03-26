% Вычисление суммы элементов списка
list_sum([], 0).
list_sum([H|T], Sum) :-
    list_sum(T, SumTail),
    Sum is H + SumTail.

% Определение знака суммы
sign_of_sum(List, Sign) :-
    list_sum(List, Sum),
    (   Sum < 0 -> Sign = -1
    ;   Sum > 0 -> Sign = 1
    ;   Sign = 0
    ).

% Точка входа
main :-
    write('Enter a list of integers: '),
    read(List),
    sign_of_sum(List, Sign),
    write('Sign = '),
    write(Sign).

:- initialization(main).
