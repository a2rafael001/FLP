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

    printfn "\n=== Задание 7: Самый частый элемент (стандартный list) ==="
    let testList = [1; 2; 3; 2; 4; 2; 5; 2; 3; 2]
    
    printfn "Тестовый список: %A" testList
    printfn "Самый частый элемент (простая версия): %A" (mostFrequent testList)
    printfn "Самый частый элемент (хвостовая рекурсия): %A" (mostFrequentTailRec testList)
    
   


     printfn "\n=== Задание 8: Подсчет квадратных элементов ==="
    let testList1 = [1; 2; 3; 4; 5; 9; 16; 25]
    let testList2 = [10; 20; 30; 40]
    
    printfn "Тестовый список 1: %A" testList1
    printfn "Количество квадратных элементов (простая версия): %d" (countSquareElements testList1)
    printfn "Количество квадратных элементов (хвостовая рекурсия): %d" (countSquareElementsTailRec testList1)
    
    printfn "\nТестовый список 2: %A" testList2
    printfn "Количество квадратных элементов: %d" (countSquareElements testList2)
    
    
    
    printfn "\nВсе задания выполнены!"
    0