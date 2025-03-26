module Task12

// Решение с использованием списков Черча
let countMinInRangeChurch (clist: int ChurchList) a b =
    let folder (count, currentMin) x =
        if x >= a && x <= b then
            if x < currentMin then (1, x)
            elif x = currentMin then (count + 1, currentMin)
            else (count, currentMin)
        else (count, currentMin)
    
    let (count, _) = clist folder (0, System.Int32.MaxValue)
    count

// Решение с использованием стандартного list
let countMinInRange (lst: int list) a b =
    lst
    |> List.filter (fun x -> x >= a && x <= b)
    |> function
        | [] -> 0
        | filtered -> 
            let minVal = List.min filtered
            filtered |> List.filter ((=) minVal) |> List.length