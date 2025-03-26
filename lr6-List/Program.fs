open System
open ChurchList
open Task1
open Task2
open Task3
open Task4
open Task5
open Task6
open Task7
open Task8
open Task9
open Task10
open Task11
open Task12
open Task13
open Task14
open Task15

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

    printfn "\n=== Задание 9: Составление специальных кортежей ==="
    let listA = [10; 20; 30; 40]
    let listB = [123; 45; 67; 89]
    let listC = [12; 24; 36; 48]
    
    printfn "Список A: %A" listA
    printfn "Список B: %A" listB
    printfn "Список C: %A" listC
    
    let result = composeSpecialTriples listA listB listC
    printfn "Результат: %A" result
    
    printfn "\n=== Задание 10: Сортировка строк по длине ==="
    let stringList = readStringList()
    
    printfn "\nИсходный список строк:"
    stringList |> List.iter (printfn "%s")
    
    printfn "\nОтсортированный список (стандартная сортировка):"
    sortByLength stringList |> List.iter (printfn "%s")
    
    printfn "\nОтсортированный список (хвостовая рекурсия):"
    sortByLengthTailRec stringList |> List.iter (printfn "%s")

    printfn "\n=== Задание 11: Перестановка между min и max ==="
    let list11 = [10; 5; 3; 8; 15; 6; 9; 12]
    printfn "Исходный список: %A" list11
    printfn "Результат (Church): %A" (list11 |> ChurchList.ofList |> Task11.reverseBetweenMinMaxChurch |> ChurchList.toList)
    printfn "Результат (list): %A" (Task11.reverseBetweenMinMax list11)

    printfn "\n=== Задание 12: Количество минимальных в интервале ==="
    let list12 = [3; 7; 2; 5; 2; 8; 2; 4; 6]
    let a, b = 3, 7
    printfn "Список: %A, интервал [%d..%d]" list12 a b
    printfn "Количество (Church): %d" (list12 |> ChurchList.ofList |> Task12.countMinInRangeChurch a b)
    printfn "Количество (list): %d" (Task12.countMinInRange list12 a b)

    printfn "\n=== Задание 13: Локальные максимумы ==="
    let list13 = [1; 3; 2; 4; 1; 5; 3; 2]
    printfn "Список: %A" list13
    printfn "Количество (Church): %d" (list13 |> ChurchList.ofList |> Task13.countLocalMaxChurch)
    printfn "Количество (list): %d" (Task13.countLocalMax list13)

    printfn "\n=== Задание 14: Элементы меньше среднего ==="
    let list14 = [10; 20; 30; 40; 50]
    printfn "Список: %A" list14
    printfn "Результат (Church): %A" (list14 |> ChurchList.ofList |> Task14.belowAverageChurch |> ChurchList.toList)
    printfn "Результат (list): %A" (Task14.belowAverage list14)

    printfn "\n=== Задание 15: Простые делители ==="
    let num = 60
    printfn "Число: %d" num
    printfn "Делители (Church): %A" (Task15.primeFactorsChurch num |> ChurchList.toList)
    printfn "Делители (list): %A" (Task15.primeFactors num)
    
    printfn "\nВсе задания выполнены!"
    0