module task1


let list1 = [1; 2; 3; 4]

// Вычисляем квадраты элементов
let squares = List.map (fun x -> x * x) list1

// Вычисляем кубы элементов
let cubes = List.map (fun x -> x * x * x) list1

// Получаем список сумм квадратов и кубов
let sumSquaresCubes = List.map2 (+) squares cubes

let run () =
    printfn "Список квадратов: %A" squares
    printfn "Список кубов: %A" cubes
    printfn "Список сумм квадратов и кубов: %A" sumSquaresCubes
