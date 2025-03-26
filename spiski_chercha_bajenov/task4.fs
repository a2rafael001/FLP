module task4


// Исходное распределение конфет
let candies = [("Оля", 10); ("Ира", 3); ("Слава", 7); ("Каролина", 0)]

// Среднее количество конфет
let totalCandies = List.sumBy snd candies
let avg = totalCandies / List.length candies

// Определение, кому нужно отдать, а кому забрать
let adjustments =
    candies
    |> List.map (fun (name, count) -> (name, count - avg))

let run () =
    printfn "Распределение конфет: %A" candies
    printfn "Среднее количество конфет: %d" avg
    printfn "Необходимо перераспределить: %A" adjustments

