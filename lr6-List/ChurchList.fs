module ChurchList

// Определение списка Черча
type 'a ChurchList = ('a -> 'b -> 'b) -> 'b -> 'b

// Пустой список
let empty : 'a ChurchList = fun f acc -> acc

// Конструктор (cons)
let cons (head: 'a) (tail: 'a ChurchList) : 'a ChurchList = 
    fun f acc -> f head (tail f acc)

// Конвертация из обычного списка F#
let ofList (lst: 'a list) : 'a ChurchList =
    List.foldBack cons lst empty

// Конвертация в обычный список F# (для тестирования)
let toList (clist: 'a ChurchList) : 'a list =
    clist (fun x xs -> x :: xs) [] |> List.rev