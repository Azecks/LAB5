perm([], []).
perm([H|T], P) :-
    perm(T, PT),
    insert(H, PT, P).

insert(X, L, [X|L]).
insert(X, [H|T], [H|R]) :-
    insert(X, T, R).

opposite(1, 3).
opposite(2, 4).
opposite(3, 1).
opposite(4, 2).

right(1, 2).
right(2, 3).
right(3, 4).
right(4, 1).

left(1, 4).
left(2, 1).
left(3, 2).
left(4, 3).

solve :-
    Seats = [kuznetsov, tokarev, slesarev, rezchikov],
    Profs = [kuznets, tokary, slesar, rezchik],
    perm(Seats, S),
    perm(Profs, P),
    
    % Условие: профессия не совпадает с фамилией
    \+ (nth1(I, S, Fam), nth1(I, P, Prof), Fam = kuznetsov, Prof = kuznets),
    \+ (nth1(I, S, Fam), nth1(I, P, Prof), Fam = tokarev, Prof = tokary),
    \+ (nth1(I, S, Fam), nth1(I, P, Prof), Fam = slesarev, Prof = slesar),
    \+ (nth1(I, S, Fam), nth1(I, P, Prof), Fam = rezchikov, Prof = rezchik),
    
    % Условие 1: напротив Кузнецова сидит слесарь
    nth1(K, S, kuznetsov),
    opposite(K, O1),
    nth1(O1, P, slesar),
    
    % Условие 2: напротив Резчикова сидит резчик
    nth1(R, S, rezchikov),
    opposite(R, O2),
    nth1(O2, P, rezchik),
    
    % Условие 3: справа от Слесарева сидит токарь
    nth1(Sl, S, slesarev),
    right(Sl, O3),
    nth1(O3, P, tokary),
    
    % Вывод рассадки(Чтобы понять как железяка рассадила по итогу рабочик класс)
    write('============================================='), nl,
    write('Rassadka (po chasovoy strelke):'), nl,
    write('Mesto 1: '), nth1(1, S, S1), write(S1), nl,
    write('Mesto 2: '), nth1(2, S, S2), write(S2), nl,
    write('Mesto 3: '), nth1(3, S, S3), write(S3), nl,
    write('Mesto 4: '), nth1(4, S, S4), write(S4), nl, nl,
    
    write('Professii:'), nl,
    write('Mesto 1: '), nth1(1, P, P1), write(P1), nl,
    write('Mesto 2: '), nth1(2, P, P2), write(P2), nl,
    write('Mesto 3: '), nth1(3, P, P3), write(P3), nl,
    write('Mesto 4: '), nth1(4, P, P4), write(P4), nl, nl,
    
    % Находим, где сидит кузнец (профессия)
    nth1(KuzSeat, P, kuznets),
    left(KuzSeat, LeftSeat),
    nth1(LeftSeat, S, LeftPerson),
    write('---------------------------------------------'), nl,
    write('Kuznec sidit na meste '), write(KuzSeat), write(' ('),
    nth1(KuzSeat, S, KuzName), write(KuzName), write(')'), nl,
    write('Sleva ot nego sidit '), write(LeftPerson), nl,
    write('---------------------------------------------'), nl.

:- initialization(solve).