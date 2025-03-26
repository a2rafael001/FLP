module FunctionalOperations

let applyOperation num operation initValue =
    num.ToString().ToCharArray()
    |> Array.map (fun c -> int c - int '0')
    |> Array.fold operation initValue

let testNumberTraversal () =
    let num = 1234
    printfn "Сумма цифр: %d" (applyOperation num (+) 0)
    printfn "Произведение цифр: %d" (applyOperation num (*) 1)

let testNumberTraversalWithLambdas () =
    let num = 5678
    printfn "Минимум цифр: %d" (applyOperation num min 9)
    printfn "Максимум цифр: %d" (applyOperation num max 0)

let applyConditionalOperation num operation initValue condition =
    num.ToString().ToCharArray()
    |> Array.map (fun c -> int c - int '0')
    |> Array.filter condition
    |> Array.fold operation initValue

let testConditionalNumberTraversal () =
    let num = 2468
    printfn "Сумма четных цифр: %d" (applyConditionalOperation num (+) 0 (fun x -> x % 2 = 0))

let functionSelector choice =
    match choice with
    | 1 -> sumCoprimes
    | 2 -> sumDivisibleByThree
    | 3 -> countCoprimes
    | _ -> (fun _ -> 0)

let tupleFunctionExecution () =
    printf "Введите номер функции (1-3) и аргумент: "
    let choice, num = System.Console.ReadLine().Split() |> Array.map int |> fun arr -> arr.[0], arr.[1]
    let result = (functionSelector choice) num
    printfn "Результат: %d" result
