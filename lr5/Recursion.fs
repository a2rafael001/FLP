module Recursion

let rec sumDigits n =
    if n = 0 then 0 else (n % 10) + sumDigits (n / 10)

let rec sumDigitsTail n acc =
    if n = 0 then acc else sumDigitsTail (n / 10) (acc + (n % 10))

let sumDigitsRecursive () =
    printf "Введите число: "
    let num = System.Console.ReadLine() |> int
    printfn "Сумма цифр: %d" (sumDigits num)

let testRecursionMethods () =
    let num = 12345
    printfn "Сумма цифр вверх: %d" (sumDigits num)
    printfn "Сумма цифр вниз: %d" (sumDigitsTail num 0)
