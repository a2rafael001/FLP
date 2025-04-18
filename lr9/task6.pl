% Предикат чтения: получает входные данные (список и границы отрезка)
read_input_38(List, A, B) :-
    List = [1,3,5,7,9,2,4,6,8], % Пример входных данных
    A = 3,
    B = 7.

% Предикат логики: подсчитывает элементы в диапазоне [A, B]
count_in_range_logic(List, A, B, Count) :-
    count_elements(List, A, B, 0, Count).

% Вспомогательный предикат с аккумулятором
count_elements([], _, _, Acc, Acc).
count_elements([H|T], A, B, Acc, Count) :-
    ( H >= A, H =< B ->
        NewAcc is Acc + 1
    ; NewAcc = Acc ),
    count_elements(T, A, B, NewAcc, Count).

% Предикат вывода: отображает результат
write_output_38(Count) :-
    format('Количество элементов в отрезке: ~d', [Count]).

% Главный предикат
solve_38 :-
    read_input_38(List, A, B),
    count_in_range_logic(List, A, B, Count),
    write_output_38(Count).






    % Предикат чтения: получает два списка
read_input_50(L1, L2) :-
    L1 = [1,2,3,2,4],  % Пример данных
    L2 = [3,4,5,5].

% Предикат логики: строит список элементов, встречающихся ровно в одном списке
build_unique_list_logic(L1, L2, Result) :-
    union_unique(L1, L2, All),
    include(check_condition(L1, L2), All, Result).

% Проверка условия для элемента X
check_condition(L1, L2, X) :-
    ( (occur_once(L1, X), \+ member(X, L2) )
    ; (occur_once(L2, X), \+ member(X, L1) ) ).

% Проверяет, что X встречается ровно один раз в списке
occur_once(List, X) :-
    count_occurrences(X, List, 1).

% Подсчет вхождений элемента в список
count_occurrences(_, [], 0).
count_occurrences(X, [X|T], N) :-
    count_occurrences(X, T, N1),
    N is N1 + 1.
count_occurrences(X, [H|T], N) :-
    X \= H,
    count_occurrences(X, T, N).

% Объединение уникальных элементов из двух списков
union_unique(L1, L2, All) :-
    append(L1, L2, Combined),
    sort(Combined, All).

% Предикат вывода: отображает результат
write_output_50(Result) :-
    format('Результирующий список: ~w', [Result]).

% Главный предикат
solve_50 :-
    read_input_50(L1, L2),
    build_unique_list_logic(L1, L2, Result),
    write_output_50(Result).