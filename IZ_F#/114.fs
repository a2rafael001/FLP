open System
open System.Collections.Generic

// Количество способов заполнить строку длиной n
let countWays (n: int) : int =
    // Кешируем результаты
    let cache = Dictionary<int, int>()

    // Хвостовая рекурсивная функция
    let rec countTail n acc =
        if cache.ContainsKey(n) then
            acc + cache.[n]
        elif n < 0 then
            acc
        elif n = 0 then
            acc + 1
        else
            let mutable total = 0
            // Добавляем один серый блок (длина 1)
            total <- total + countTail (n - 1) 0

            // Красные блоки от длины 3 до n
            for blockLength in 3 .. n do
                // После красного блока должен быть хотя бы один серый, поэтому отнимаем ещё 1
                total <- total + countTail (n - blockLength - 1) 0

            cache.[n] <- total
            acc + total

    countTail n 0

[<EntryPoint>]
let main argv =
    let result = countWays 50
    printfn "Результат: %d" result
    0
