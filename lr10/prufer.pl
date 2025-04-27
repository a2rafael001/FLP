% Построить матрицу смежности из кода Прюфера
prufer_to_adjacency(Prufer, Matrix) :-
    length(Prufer, L),
    N is L + 2,
    numlist(1, N, Vertices),
    count_vertices(Prufer, Counts0),
    init_counts(Vertices, Counts0, Counts),
    build_edges(Prufer, Counts, Edges),
    last_two_vertices(Counts, V1, V2),
    append(Edges, [edge(V1, V2)], AllEdges),
    build_matrix(N, AllEdges, Matrix).

% Счётчик количества вхождений вершин
count_vertices([], []).
count_vertices([H|T], [H-1|Rest]) :-
    \+ member(H-_, Rest),
    count_vertices(T, Rest).
count_vertices([H|T], [H-N1|Rest1]) :-
    select(H-N, Rest, Rest1),
    N1 is N + 1,
    count_vertices(T, Rest).

% Инициализация счётчиков для всех вершин
init_counts([], Counts, Counts).
init_counts([V|T], Counts0, Counts) :-
    ( select(V-C, Counts0, Rest)
    -> Counts1 = [V-C|Rest]
    ;  Counts1 = [V-0|Counts0]
    ),
    init_counts(T, Counts1, Counts).

% Построение рёбер
build_edges([], Counts, []).
build_edges([H|T], Counts0, [edge(Min,H)|Edges]) :-
    find_min_zero(Counts0, Min),
    update_counts(Counts0, Min, H, Counts1),
    build_edges(T, Counts1, Edges).

% Поиск минимальной вершины с нулевым счётчиком
find_min_zero(Counts, Min) :-
    findall(V, (member(V-0, Counts)), Zeros),
    min_list(Zeros, Min).

% Обновление счётчиков
update_counts(Counts0, V1, V2, Counts) :-
    select(V1-_, Counts0, Rest1),
    select(V2-Cnt, Rest1, Rest2),
    Cnt1 is Cnt - 1,
    append([V1--1, V2-Cnt1], Rest2, Counts).

% Нахождение двух последних вершин
last_two_vertices(Counts, V1, V2) :-
    findall(V, (member(V-N, Counts), N =< 0), [V1,V2]).

% Построение матрицы смежности
build_matrix(N, Edges, Matrix) :-
    findall(Row, (between(1, N, I), findall(E, (between(1, N, J), (member(edge(I,J), Edges); member(edge(J,I), Edges)) -> E=1 ; E=0), Row)), Matrix).
