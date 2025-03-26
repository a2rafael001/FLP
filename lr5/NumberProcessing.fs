module NumberProcessing

let rec gcd a b = if b = 0 then a else gcd b (a % b)

let isCoprime x y = gcd x y = 1

let sumCoprimes num =
    [1..num] |> List.filter (isCoprime num) |> List.sum

let countCoprimes num =
    [1..num] |> List.filter (isCoprime num) |> List.length

let sumDivisibleByThree num =
    num.ToString().ToCharArray()
    |> Array.map (fun c -> int c - int '0')
    |> Array.filter (fun x -> x % 3 = 0)
    |> Array.sum

let testNumberProcessing () =
    let num = 10
    printfn "Количество взаимно простых с %d: %d" num (countCoprimes num)
    printfn "Сумма цифр, делящихся на 3 в %d: %d" num (sumDivisibleByThree num)
