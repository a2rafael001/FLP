module task9


let numbers = [1..20]

let squaresOfMultiplesOf3 = numbers |> List.filter (fun x -> x % 3 = 0) |> List.map (fun x -> x * x)
let cubesOfMultiplesOf5 = numbers |> List.filter (fun x -> x % 5 = 0) |> List.map (fun x -> x * x * x)

let combinedList = squaresOfMultiplesOf3 @ cubesOfMultiplesOf5

let run () =
    printfn "Квадраты чисел, кратных 3: %A" squaresOfMultiplesOf3
    printfn "Кубы чисел, кратных 5: %A" cubesOfMultiplesOf5
    printfn "Объединенный список: %A" combinedList


