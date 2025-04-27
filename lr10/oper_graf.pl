% ---------- Базовые операции ----------

% Проверка, что ребро эквивалентное (для undirected)
equivalent(edge(X,Y,undirected), edge(Y,X,undirected)).
equivalent(E, E).

% Проверка наличия ребра в графе (с учётом undirected)
edge_in_list(E, List) :-
    member(E1, List),
    (E == E1; equivalent(E, E1)).

% Объединение рёбер (удаляем дубликаты для undirected)
union_edges([], L, L).
union_edges([H|T], L, R) :-
    edge_in_list(H, L), !,
    union_edges(T, L, R).
union_edges([H|T], L, [H|R]) :-
    union_edges(T, L, R).

% Пересечение рёбер
intersection_edges([], _, []).
intersection_edges([H|T], L, [H|R]) :-
    edge_in_list(H, L), !,
    intersection_edges(T, L, R).
intersection_edges([_|T], L, R) :-
    intersection_edges(T, L, R).

% Сумма по модулю 2
xor_edges([], [], []).
xor_edges(L1, L2, R) :-
    findall(E, (member(E, L1), \+ edge_in_list(E, L2)), L1_only),
    findall(E, (member(E, L2), \+ edge_in_list(E, L1)), L2_only),
    append(L1_only, L2_only, R).

% ---------- Главные операции для графов ----------

% Объединение графов
union_graphs(graph(V, E1), graph(V, E2), graph(V, E)) :-
    union_edges(E1, E2, E).

% Пересечение графов
intersection_graphs(graph(V, E1), graph(V, E2), graph(V, E)) :-
    intersection_edges(E1, E2, E).

% Сумма по модулю два графов
xor_graphs(graph(V, E1), graph(V, E2), graph(V, E)) :-
    xor_edges(E1, E2, E).
