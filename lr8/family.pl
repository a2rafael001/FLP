% пол
man(ivan).
man(alexey).
man(mikhail).
man(daniil).
man(andrey).
man(sergey).

woman(maria).
woman(olga).
woman(svetlana).
woman(ekaterina).

% Родители
parent(ivan, alexey).
parent(maria, alexey).
parent(ivan, olga).
parent(maria, olga).

parent(alexey, daniil).
parent(svetlana, daniil).
parent(alexey, ekaterina).
parent(svetlana, ekaterina).

parent(olga, andrey).
parent(mikhail, andrey).

% Все мужчины
men :- man(X), write(X), nl, fail.
men.

% Все женщины
women :- woman(X), write(X), nl, fail.
women.

% Дети X
children(X) :- parent(X, Y), write(Y), nl, fail.
children(_).

% Является ли X матерью Y
mother(X, Y) :- woman(X), parent(X, Y).

% Мама  X
mother(X) :- parent(Y, X), woman(Y), write(Y), nl.

% Является ли X братом Y
brother(X, Y) :- man(X), X \= Y, parent(P, X), parent(P, Y).

% Все братья X
brothers(X) :- brother(Y, X), write(Y), nl, fail.
brothers(_).

% X и Y — родные братья/сёстры
b_s(X, Y) :- X \= Y, parent(P1, X), parent(P1, Y), parent(P2, X), parent(P2, Y), P1 \= P2.

% Все братья или сестры X
b_s(X) :- b_s(X, Y), write(Y), nl, fail.
b_s(_).

% X является сыном Y
son(X, Y) :- man(X), parent(Y, X).

% вывести всех сыновей X
son(X) :- parent(X, Y), man(Y), write(Y), nl, fail.
son(_).

%  X является сестрой Y
sister(X, Y) :- woman(X), X \= Y, parent(P, X), parent(P, Y).

% вывести всех сестер X
sisters(X) :- sister(Y, X), write(Y), nl, fail.
sisters(_).



% --- grand_ma(X, Y) ---
% X - бабушка Y, если X - женщина, X - родитель Z, и Z - родитель Y
grand_ma(X, Y) :-
    woman(X),
    parent(X, Z),
    parent(Z, Y).

% --- grand_mas(X) ---
% Вывести всех бабушек X
grand_mas(X) :-
    grand_ma(G, X),
    write(G), nl,
    fail.
grand_mas(_).

% --- grand_pa_and_son(X, Y) ---
% Проверяет, являются ли X и Y дедушкой и внуком (или наоборот).
% Пусть считаем "внуком" только мальчика (man).
grand_pa_and_son(X, Y) :-
    (   man(X),
        parent(X, Z),
        parent(Z, Y),
        man(Y)
    ;   man(Y),
        parent(Y, Z),
        parent(Z, X),
        man(X)
    ).

% --- uncle(X, Y) ---
% X - дядя Y, если X - мужчина, 
% у Y есть родитель Z, и X - брат Z.
uncle(X, Y) :-
    man(X),
    parent(Z, Y),
    brother(X, Z).

% --- uncles(X) ---
% Вывести всех дядей X
uncles(X) :-
    uncle(U, X),
    write(U), nl,
    fail.
uncles(_).