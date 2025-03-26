module Task4

open Task1
open Task3

// Функция нахождения минимального элемента
let minElement (ChurchList churchList) =
    let lst = toList (ChurchList churchList)
    match lst with
    | [] -> failwith "Список пуст"
    | x::xs -> List.fold min x xs

// Функция суммы четных элементов
let sumEven (ChurchList churchList) =
    foldChurchList (+) (fun x -> x % 2 = 0) 0 (ChurchList churchList)

// Функция подсчета количества нечетных элементов
let countOdd (ChurchList churchList) =
    foldChurchList (fun acc _ -> acc + 1) (fun x -> x % 2 <> 0) 0 (ChurchList churchList)
