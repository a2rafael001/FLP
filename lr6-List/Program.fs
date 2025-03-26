module Program

open Task1

[<EntryPoint>]
let main argv =
    printf "Введите количество элементов: "
    let n = int (System.Console.ReadLine())
    let churchList = readChurchList n
    let normalList = toList churchList
    printfn "Список: %A" normalList
    0