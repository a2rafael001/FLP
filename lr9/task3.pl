% 1. Найти индекс минимального элемента в списке

find_min_index(List, Index) :-
    find_min_index(List, 0, 0, 0, Index).

% Вспомогательный предикат с аккумуляторами:
% find_min_index(+List, +CurrentIndex, +CurrentMin, +CurrentMinIndex, -ResultIndex)
find_min_index([], _, _, ResultIndex, ResultIndex).
find_min_index([H|T], I, CurrentMin, _, ResultIndex) :-
    H < CurrentMin,
    NewI is I + 1,
    find_min_index(T, NewI, H, I, ResultIndex).
find_min_index([H|T], I, CurrentMin, CurrentMinIndex, ResultIndex) :-
    H >= CurrentMin,
    NewI is I + 1,
    find_min_index(T, NewI, CurrentMin, CurrentMinIndex, ResultIndex).

% Предикат вывода: print_min_index(+Index)
print_min_index(Index) :-
    write('Index of minimal element: '), write(Index), nl.

% Пример использования:
% read_list(List), find_min_index(List, Index), print_min_index(Index).

% 2. Найти количество элементов в интервале [A, B]


% Предикат чтения: read_interval(-A, -B)
read_interval(A, B) :-
    write('Enter A: '), read(A),
    write('Enter B: '), read(B).

% Предикат логики: count_in_interval(+List, +A, +B, -Count)
% Используем include/3 для фильтрации
count_in_interval(List, A, B, Count) :-
    include(between(A, B), List, Filtered),
    length(Filtered, Count).

% Вспомогательный предикат для фильтрации
between(A, B, X) :- X >= A, X =< B.

% Предикат вывода: print_count(+Count)
print_count(Count) :-
    write('Elements in interval: '), write(Count), nl.

% Пример использования:
% read_list(List), read_interval(A, B), count_in_interval(List, A, B, Count), print_count(Count).

% 3. Найти количество элементов между первым и последним минимальным


% Предикат логики: count_between_min(+List, -Count)
count_between_min(List, Count) :-
    find_min_index(List, FirstIndex),      % Первое вхождение минимума
    reverse(List, Reversed),               % Переворачиваем список
    find_min_index(Reversed, LastRevIndex),% Индекс в перевернутом списке
    length(List, Len),
    LastIndex is Len - LastRevIndex - 1,   % Реальный индекс последнего минимума
    Count is LastIndex - FirstIndex - 1.   % Вычисляем расстояние

% Предикат вывода: print_count_between(+Count)
print_count_between(Count) :-
    write('Elements between first and last min: '), write(Count), nl.

