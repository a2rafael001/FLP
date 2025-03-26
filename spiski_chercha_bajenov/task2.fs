module task2

let agesMen = [25; 37; 48; 60]
let agesWomen = [28; 43]

let average list = 
    list |> List.averageBy float

let averageMen = average agesMen
let averageWomen = average agesWomen

let run () =
    printfn "Средний возраст мужчин: %.2f" averageMen
    printfn "Средний возраст женщин: %.2f" averageWomen
