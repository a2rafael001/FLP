% Предикат max(+X, +Y, +U, -Z), где U - максимальное из чисел X, Y и Z
max(X, Y, U, Z) :-
    max_list([X, Y, U], Z).

% Факториал с рекурсией вверх (обычная рекурсия)
fact_up(N, X) :-
    N >= 0,
    fact_up_helper(N, X).

fact_up_helper(0, 1).
fact_up_helper(N, X) :-
    N > 0,
    N1 is N - 1,
    fact_up_helper(N1, X1),
    X is N * X1.

% Факториал с рекурсией вниз (хвостовая рекурсия)
fact_down(N, X) :-
    N >= 0,
    fact_down_helper(N, 1, X).

fact_down_helper(0, Acc, Acc).
fact_down_helper(N, Acc, X) :-
    N > 0,
    N1 is N - 1,
    NewAcc is N * Acc,
    fact_down_helper(N1, NewAcc, X).

% Сумма цифр числа с рекурсией вверх
sum_digits_up(Number, Sum) :-
    Number >= 0,
    sum_digits_up_helper(Number, Sum).

sum_digits_up_helper(0, 0).
sum_digits_up_helper(Number, Sum) :-
    Number > 0,
    Digit is Number mod 10,
    NextNumber is Number // 10,
    sum_digits_up_helper(NextNumber, PartialSum),
    Sum is PartialSum + Digit.

% Сумма цифр числа с рекурсией вниз
sum_digits_down(Number, Sum) :-
    Number >= 0,
    sum_digits_down_helper(Number, 0, Sum).

sum_digits_down_helper(0, Acc, Acc).
sum_digits_down_helper(Number, Acc, Sum) :-
    Number > 0,
    Digit is Number mod 10,
    NextNumber is Number // 10,
    NewAcc is Acc + Digit,
    sum_digits_down_helper(NextNumber, NewAcc, Sum).

% Проверка, что число свободно от квадратов
square_free(N) :-
    N > 0,
    square_free_helper(N, 2).

square_free_helper(1, _).
square_free_helper(N, D) :-
    D =< N,
    (   0 is N mod (D*D) -> false
    ;   0 is N mod D -> NextN is N // D, square_free_helper(NextN, D)
    ;   NewD is D + 1, square_free_helper(N, NewD)
    ).

% Предикат чтения списка с клавиатуры
read_list(List) :-
    write('Enter list elements (end with .):'), nl,
    read_list_helper(List).

read_list_helper([]) :-
    peek_code(46), % проверка на точку
    skip_line. % пропустить точку и перевод строки
read_list_helper([H|T]) :-
    read(H),
    read_list_helper(T).

% Предикат вывода списка на экран
write_list([]) :-
    nl.
write_list([H|T]) :-
    write(H), write(' '),
    write_list(T).

% Сумма элементов списка с рекурсией вниз
sum_list_down(List, Sum) :-
    sum_list_down_helper(List, 0, Sum).

sum_list_down_helper([], Acc, Acc).
sum_list_down_helper([H|T], Acc, Sum) :-
    NewAcc is Acc + H,
    sum_list_down_helper(T, NewAcc, Sum).

% Сумма элементов списка с рекурсией вверх
sum_list_up([], 0).
sum_list_up([H|T], Sum) :-
    sum_list_up(T, PartialSum),
    Sum is PartialSum + H.

% Предикат, который удаляет все элементы, сумма цифр которых равна заданной
remove_elems_with_sum(List, TargetSum, Result) :-
    remove_elems_with_sum_helper(List, TargetSum, [], Result).

remove_elems_with_sum_helper([], _, Acc, Acc).
remove_elems_with_sum_helper([H|T], TargetSum, Acc, Result) :-
    (   number(H),
        sum_digits_down(H, Sum),
        Sum =:= TargetSum
    ->  remove_elems_with_sum_helper(T, TargetSum, Acc, Result)
    ;   remove_elems_with_sum_helper(T, TargetSum, [H|Acc], Result)
    ).

% Пример программы для чтения списка, подсчета суммы и вывода результата
example_program :-
    write('Enter list of numbers:'), nl,
    read_list(List),
    sum_list_down(List, Sum),
    write('Sum of list elements: '), write(Sum), nl.