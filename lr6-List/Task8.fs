module Task8

// Функция для подсчета элементов, которые могут быть квадратом какого-то элемента списка
let countSquareElements (lst: int list) =
    let uniqueElements = lst |> List.distinct
    let squares = uniqueElements |> List.map (fun x -> x * x)
    
    squares
    |> List.filter (fun sq -> lst |> List.contains sq)
    |> List.length

// Версия с хвостовой рекурсией
let countSquareElementsTailRec (lst: int list) =
    let unique = lst |> List.distinct
    
    let rec countSquares acc = function
        | [] -> acc
        | x::xs ->
            let square = x * x
            if List.contains square lst then
                countSquares (acc + 1) xs
            else
                countSquares acc xs
    
    countSquares 0 unique