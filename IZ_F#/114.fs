open System
open System.Collections.Generic

// Подсчёт количества способов разложить строку длиной n
let countWays (n: int) : int =
    let cache = Dictionary<int, int>()        // Кэширование значений
    let mutable callCount = 0                 // Счётчик вызовов

    // Хвостовая рекурсивная функция
    let rec countTail n acc =
        callCount <- callCount + 1

        if cache.ContainsKey(n) then
            acc + cache.[n]
        elif n < 0 then
            acc
        elif n = 0 then
            acc + 1
        else
            let mutable total = 0
            // Пробуем вставить серый блок длины 1
            total <- total + countTail (n - 1) 0

            // Пробуем вставить красные блоки от 3 до n
            for blockLength in 3 .. n do
                total <- total + countTail (n - blockLength - 1) 0

            cache.[n] <- total
            acc + total

    let result = countTail n 0
    printfn "Количество вызовов функции: %d" callCount
    result

[<EntryPoint>]
let main argv =
    let result = countWays 50
    printfn "Количество способов заполнить строку: %d" result
    0
