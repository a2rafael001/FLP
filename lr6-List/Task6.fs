module Task6

// Определение двоичного дерева с элементами типа string
type BinaryTree =
    | Empty
    | Node of string * BinaryTree * BinaryTree

// Функция добавления элемента в дерево
let rec insert value tree =
    match tree with
    | Empty -> Node(value, Empty, Empty)
    | Node(v, left, right) ->
        if value < v then Node(v, insert value left, right)
        else Node(v, left, insert value right)

// Функция обхода дерева в порядке in-order (слева-корень-справа)
let rec inorderTraversal tree =
    match tree with
    | Empty -> []
    | Node(v, left, right) -> inorderTraversal left @ [v] @ inorderTraversal right

// Функция построения дерева из списка строк
let buildTree (values: string list) =
    List.fold insert Empty values

// Функция вывода дерева
let printTree tree =
    inorderTraversal tree |> List.iter (printf "%s ")
    printfn ""
