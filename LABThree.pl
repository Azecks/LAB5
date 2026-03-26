% Слияние двух отсортированных списков
merge(L1, [], L1) :- !.
merge([], L2, L2) :- !.
merge([H1|T1], [H2|T2], [H1|T]) :-
    H1 < H2,
    !,
    merge(T1, [H2|T2], T).
merge(L1, [H2|T2], [H2|T]) :-
    merge(L1, T2, T).

% Разделение списка на две половины
split([H1, H2|T], [H1|T1], [H2|T2]) :-
    split(T, T1, T2).
split([H], [H], []).
split([], [], []).

% Сортировка слиянием
merge_sort([H1, H2|T], Sorted) :-
    split([H1, H2|T], L1, L2),
    merge_sort(L1, Sorted1),
    merge_sort(L2, Sorted2),
    merge(Sorted1, Sorted2, Sorted).
merge_sort([H], [H]).

% Точка входа
main :-
    write('Enter a list (>=2 elements): '),
    read(List),
    merge_sort(List, Sorted),
    write('Sorted list: '),
    write(Sorted).

:- initialization(main).
