module Task7

// Функция для нахождения самого частого элемента в списке
let mostFrequent (lst: 'a list) =
    lst
    |> List.countBy id  
    |> List.sortByDescending snd  
    |> List.tryHead  
    |> Option.map fst  

// Альтернативная реализация с хвостовой рекурсией
let mostFrequentTailRec (lst: 'a list) =
    let rec countElements lst counts =
        match lst with
        | [] -> counts
        | x::xs ->
            let newCounts = 
                match Map.tryFind x counts with
                | Some c -> Map.add x (c + 1) counts
                | None -> Map.add x 1 counts
            countElements xs newCounts
    
    if List.isEmpty lst then None
    else
        lst
        |> countElements Map.empty
        |> Map.toList
        |> List.maxBy snd
        |> fst
        |> Some