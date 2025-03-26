module Task14

// Решение с использованием списков Черча
let belowAverageChurch (clist: int ChurchList) =
    let (sum, count) = 
        clist (fun x (s, c) -> (s + x, c + 1)) (0, 0)
    
    let average = if count = 0 then 0.0 else float sum / float count
    
    clist (fun x acc -> if float x < average then ChurchList.cons x acc else acc) ChurchList.empty

// Решение с использованием стандартного list
let belowAverage (lst: int list) =
    if List.isEmpty lst then []
    else
        let average = List.averageBy float lst
        lst |> List.filter (fun x -> float x < average)