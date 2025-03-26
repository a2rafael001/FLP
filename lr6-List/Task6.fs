module Task6

// Определение бинарного дерева
type StringTree =
    | Leaf
    | Node of string * StringTree * StringTree

// Создание пустого дерева
let empty = Leaf

// Вставка элемента в дерево
let rec insert value tree =
    match tree with
    | Leaf -> Node(value, Leaf, Leaf)
    | Node(v, left, right) ->
        if value < v then Node(v, insert value left, right)
        elif value > v then Node(v, left, insert value right)
        else tree

// Построение дерева из списка
let fromList lst =
    List.fold (fun acc x -> insert x acc) Leaf lst

// Обход в глубину (in-order) с хвостовой рекурсией
let inOrder tree =
    let rec loop tree acc =
        match tree with
        | Leaf -> acc
        | Node(v, left, right) ->
            loop left (v :: loop right acc)
    loop tree [] |> List.rev

// Поиск элемента в дереве
let rec contains value tree =
    match tree with
    | Leaf -> false
    | Node(v, left, right) ->
        if value = v then true
        elif value < v then contains value left
        else contains value right

// Fold для дерева
let rec fold f acc tree =
    match tree with
    | Leaf -> acc
    | Node(v, left, right) ->
        let leftAcc = fold f acc left
        let nodeAcc = f leftAcc v
        fold f nodeAcc right