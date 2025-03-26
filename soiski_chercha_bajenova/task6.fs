module task6


let wagons = [1..20]

// Каждый 4-й вагон — ресторан
let restaurantWagons = wagons |> List.filter (fun x -> x % 4 = 0)

let run () =
    printfn "Вагоны-рестораны (каждый 4-й): %A" restaurantWagons

