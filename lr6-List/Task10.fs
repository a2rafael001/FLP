module Task10

// Функция для чтения списка строк с клавиатуры
let readStringList () =
    printfn "Введите количество строк:"
    let count = System.Console.ReadLine() |> int
    
    let rec readLines n acc =
        if n <= 0 then acc
        else
            printfn "Введите строку #%d:" (count - n + 1)
            let line = System.Console.ReadLine()
            readLines (n - 1) (line :: acc)
    
    readLines count []
    |> List.rev

// Функция для сортировки списка строк по длине
let sortByLength (strings: string list) =
    strings
    |> List.sortBy (fun s -> s.Length)

// Альтернативная версия с хвостовой рекурсией
let sortByLengthTailRec (strings: string list) =
    let rec insert sortedList item =
        match sortedList with
        | [] -> [item]
        | head::tail when item.Length <= head.Length -> item::head::tail
        | head::tail -> head :: (insert tail item)
    
    let rec sortHelper acc = function
        | [] -> acc
        | head::tail -> sortHelper (insert acc head) tail
    
    sortHelper [] strings