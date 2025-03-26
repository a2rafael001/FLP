module Task5

open ChurchList

let mostFrequent clist =
    let updateCount count x =
        match Map.tryFind x count with
        | Some c -> Map.add x (c + 1) count
        | None -> Map.add x 1 count
    
    let countMap = 
        clist updateCount Map.empty
    
    if Map.isEmpty countMap then None
    else
        countMap
        |> Map.toList
        |> List.maxBy snd
        |> fst
        |> Some