module task7


let totalWagons = 20
let restaurantWagons = totalWagons / 3  // Каждый 3-й вагон — ресторан
let passengerWagons = totalWagons - restaurantWagons
let seatsPerWagon = 20
let totalPassengerSeats = passengerWagons * seatsPerWagon

let run () =
    printfn "Всего вагонов: %d" totalWagons
    printfn "Ресторанных вагонов: %d" restaurantWagons
    printfn "Пассажирских вагонов: %d" passengerWagons
    printfn "Общее количество пассажирских мест: %d" totalPassengerSeats


