module Task5

open Task1

// Функция нахождения самого частого элемента списка Черча
let mostFrequentElement (ChurchList churchList) =
    let lst = toList churchList
    let rec countOccurrences item lst count =
        match lst with
        | [] -> count
        | x :: xs -> countOccurrences item xs (if x = item then count + 1 else count)
    
    let rec findMostFrequent lst (maxElem, maxCount) =
        match lst with
        | [] -> maxElem
        | x :: xs ->
            let count = countOccurrences x lst 0
            if count > maxCount then findMostFrequent xs (x, count)
            else findMostFrequent xs (maxElem, maxCount)
    
    match lst with
    | [] -> failwith "Список пуст"
    | x :: xs -> findMostFrequent lst (x, 0)