% Пол
man(ivan).
man(alexey).
man(mikhail).
man(daniil).
man(andrey).

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

% Мама X
mother(X) :- parent(Y, X), woman(Y), write(Y), nl.

% Является ли X братом Y
brother(X, Y) :-
    man(X),
    X \= Y,
    parent(P, X),
    parent(P, Y).

% Все братья X
brothers(X) :- brother(Y, X), write(Y), nl, fail.
brothers(_).

% X и Y — родные братья/сёстры
b_s(X, Y) :-
    X \= Y,
    parent(P1, X),
    parent(P1, Y),
    parent(P2, X),
    parent(P2, Y),
    P1 \= P2.

% Все братья или сестры X
b_s(X) :- b_s(X, Y), write(Y), nl, fail.
b_s(_).
