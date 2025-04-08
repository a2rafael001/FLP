open System.Collections.Generic

let countWays (n:int) : int64 =
    let cache = Dictionary<int, int64>()
    
    let rec countTail n =
        match n with
        | _ when n < 0 -> 0L
        | 0 -> 1L
        | _ when cache.ContainsKey(n) -> cache.[n]
        | _ ->
            // Серый блок
            let greyWays = countTail (n - 1)

            // Красные блоки
            let redWays =
                [3..n]
                |> List.fold (fun acc blockLen ->
                    acc + (if n - blockLen - 1 >= 0 then countTail (n - blockLen - 1) else 1L)
                ) 0L

            let total = greyWays + redWays
            cache.[n] <- total
            total

    countTail n

[<EntryPoint>]
let main argv =
    let result = countWays 50
    printfn "Количество способов заполнить строку длины 50: %d" result
    0
