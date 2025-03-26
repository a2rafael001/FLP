module Task9

// Вспомогательные функции
let sumOfDigits n =
    let rec sum n acc =
        if n = 0 then acc
        else sum (n / 10) (acc + n % 10)
    sum (abs n) 0

let countDivisors n =
    if n = 0 then 0
    else
        let nAbs = abs n
        [1..nAbs]
        |> List.filter (fun x -> nAbs % x = 0)
        |> List.length

// Основная функция
let composeSpecialTriples (listA: int list) (listB: int list) (listC: int list) =
    // Обработка списка A - сортировка по убыванию
    let sortedA = listA |> List.sortDescending
    
    // Обработка списка B - сортировка по сумме цифр по возрастанию,
    // при равенстве сумм - по убыванию абсолютного значения
    let sortedB =
        listB
        |> List.sortBy (fun x -> (sumOfDigits x, -abs x))
    
    // Обработка списка C - сортировка по количеству делителей по убыванию,
    // при равенстве - по убыванию абсолютного значения
    let sortedC =
        listC
        |> List.sortByDescending (fun x -> (countDivisors x, abs x))
        |> List.sortByDescending countDivisors
    
    // Формирование кортежей
    List.zip3 sortedA sortedB sortedC