module Task16

// Основная функция для обработки списка
let processList (lst: int list) =
    // 1. Четные элементы, деленные на 2
    let list1 = lst |> List.filter (fun x -> x % 2 = 0) |> List.map (fun x -> x / 2)
    
    // 2. Элементы из list1, делящиеся на 3
    let list2 = list1 |> List.filter (fun x -> x % 3 = 0)
    
    // 3. Квадраты элементов из list2
    let list3 = list2 |> List.map (fun x -> x * x)
    
    // 4. Элементы из list3, которые есть в list1
    let list4 = list3 |> List.filter (fun x -> List.contains x list1)
    
    // 5. Объединение list2, list3 и list4
    let list5 = list2 @ list3 @ list4
    
    (list1, list2, list3, list4, list5)

// Альтернативная реализация с использованием композиции функций
let processListAlt =
    let evenHalved = List.filter (fun x -> x % 2 = 0) >> List.map (fun x -> x / 2)
    let divByThree = List.filter (fun x -> x % 3 = 0)
    let squared = List.map (fun x -> x * x)
    let inFirstList lst1 = List.filter (fun x -> List.contains x lst1)
    
    fun lst ->
        let l1 = evenHalved lst
        let l2 = divByThree l1
        let l3 = squared l2
        let l4 = inFirstList l1 l3
        let l5 = l2 @ l3 @ l4
        (l1, l2, l3, l4, l5)