% проверка четности степени всех вершин
even_degrees(Graph) :-
    vertices(Graph, Vertices),
    forall(member(V, Vertices), (degree(V, Graph, D), 0 is D mod 2)).

% расчет степени вершины
degree(Vertex, Graph, Degree) :-
    findall(Vertex, (member([Vertex, _], Graph); member([_, Vertex], Graph)), Edges),
    length(Edges, Degree).

% список всех вершин графа
vertices(Graph, Vertices) :-
    findall(V, (member([V, _], Graph); member([_, V], Graph)), Vs),
    sort(Vs, Vertices).

% проверка связности графа
connected(Graph) :-
    vertices(Graph, [Start|Vertices]),
    reachable(Graph, [Start], Visited),
    sort(Visited, SortedVisited),
    sort([Start|Vertices], SortedVisited).

reachable(_, [], []).
reachable(Graph, [V|Queue], Visited) :-
    findall(X, (member([V,X], Graph); member([X,V], Graph)), Neighbors),
    subtract(Neighbors, [V|Queue], NewNeighbors),
    append(Queue, NewNeighbors, NextQueue),
    reachable(Graph, NextQueue, NextVisited),
    append([V], NextVisited, Visited).
