% ���
man(ivan).
man(alexey).
man(mikhail).
man(daniil).
man(andrey).

woman(maria).
woman(olga).
woman(svetlana).
woman(ekaterina).

% ��������
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

% ��� �������
men :- man(X), write(X), nl, fail.
men.

% ��� �������
women :- woman(X), write(X), nl, fail.
women.

% ���� X
children(X) :- parent(X, Y), write(Y), nl, fail.
children(_).

% �������� �� X ������� Y
mother(X, Y) :- woman(X), parent(X, Y).

% ���� X
mother(X) :- parent(Y, X), woman(Y), write(Y), nl.

% �������� �� X ������ Y
brother(X, Y) :-
    man(X),
    X \= Y,
    parent(P, X),
    parent(P, Y).

% ��� ������ X
brothers(X) :- brother(Y, X), write(Y), nl, fail.
brothers(_).

% X � Y � ������ ������/�����
b_s(X, Y) :-
    X \= Y,
    parent(P1, X),
    parent(P1, Y),
    parent(P2, X),
    parent(P2, Y),
    P1 \= P2.

% ��� ������ ��� ������ X
b_s(X) :- b_s(X, Y), write(Y), nl, fail.
b_s(_).

son(X, Y) :- man(X), parent(Y, X).

son(X) :- parent(X, Y), man(Y), write(Y), nl, fail.
son(_).

sister(X, Y) :- woman(X), X \= Y, parent(P, X), parent(P, Y).

sisters(X) :- sister(Y, X), write(Y), nl, fail.
sisters(_).
