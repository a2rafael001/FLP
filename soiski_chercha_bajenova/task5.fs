module task5


let numbers = [1..20]

// Отбираем чётные числа и возводим их в квадрат
let evenSquares = numbers |> List.filter (fun x -> x % 2 = 0) |> List.map (fun x -> x * x)

let run () =
    printfn "Квадраты чётных чисел из 1-20: %A" evenSquares


