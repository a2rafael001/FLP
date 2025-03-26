module Task1

// Определение списка Черча
type ChurchList<'T> = ChurchList of (('T -> 'T list -> 'T list) -> 'T list -> 'T list)

// Функция создания списка Черча из стандартного списка
let fromList lst =
    ChurchList (fun f acc -> List.foldBack f lst acc)

// Функция преобразования списка Черча в обычный список
let toList (ChurchList churchList) =
    churchList (fun x acc -> x :: acc) []

// Функция чтения списка чисел из ввода пользователя
let readChurchList n =
    let rec readHelper acc count =
        if count = 0 then acc
        else readHelper (int (System.Console.ReadLine()) :: acc) (count - 1)
    fromList (List.rev (readHelper [] n))
