:- include('utils.pl').

% основной предикат генерации эйлеровых графов
euler_graph(Graph) :-
    generate_graph(8, Graph),
    even_degrees(Graph),
    connected(Graph).

% генерация всех возможных графов из N вершин
generate_graph(N, Graph) :-
    findall([X,Y], (between(1,N,X), between(X,N,Y), X \= Y), Edges),
    subset(Edges, Graph).

% вывод всех эйлеровых графов на экран
find_all_euler_graphs :-
    euler_graph(Graph),
    write(Graph), nl,
    fail; true.
