open System
open ChurchList
open Task1
open Task2
open Task3
open Task4
open Task5
open Task6

[<EntryPoint>]
let main argv =
    printfn "=== Задание 1: Чтение списка ==="
    printf "Введите количество элементов: "
    let n = Console.ReadLine() |> int
    let clist = readChurchList n
    
    printfn "\n=== Задание 2: Вывод списка ==="
    printChurchList clist
    
    printfn "\n=== Задание 3: Тест fold (сумма положительных) ==="
    let sumPos = churchFold clist (+) (fun x -> x > 0) 0
    printfn "Сумма положительных: %d" sumPos
    
    printfn "\n=== Задание 4: Специализированные функции ==="
    printfn "Минимальный элемент: %d" (minElement clist)
    printfn "Сумма четных: %d" (sumEven clist)
    printfn "Количество нечетных: %d" (countOdd clist)
    
    printfn "\n=== Задание 5: Самый частый элемент ==="
    match mostFrequent clist with
    | Some x -> printfn "Самый частый элемент: %d" x
    | None -> printfn "Список пустой"
    
    printfn "\n=== Задание 6: Бинарное дерево строк ==="
    let tree = 
        ["orange"; "apple"; "banana"; "grape"; "kiwi"; "pear"]
        |> fromList
    
    printfn "Дерево содержит 'apple': %b" (contains "apple" tree)
    printfn "Дерево содержит 'mango': %b" (contains "mango" tree)
    
    printfn "\nIn-order обход дерева:"
    inOrder tree |> List.iter (printfn "%s")
    
    printfn "\nКоличество элементов в дереве: %d" (fold (fun acc _ -> acc + 1) 0 tree)
    
    printfn "\nВсе задания выполнены!"
    0