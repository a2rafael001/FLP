module Task13

// Решение с использованием списков Черча
let countLocalMaxChurch (clist: int ChurchList) =
    let folder (prev, next, count) x =
        match (prev, next) with
        | (Some p, Some n) when p < x && x > n -> (Some x, None, count + 1)
        | _ -> (Some x, None, count)
    
    let (_, _, count) = clist folder (None, None, 0)
    count

// Решение с использованием стандартного list
let countLocalMax (lst: int list) =
    let rec loop prev current rest count =
        match current, rest with
        | Some c, x::xs when Some c > prev && Some c > Some x -> 
            loop (Some c) (Some x) xs (count + 1)
        | Some c, x::xs -> 
            loop (Some c) (Some x) xs count
        | None, x::xs -> 
            loop None (Some x) xs count
        | _, [] -> count
    
    match lst with
    | x::y::xs -> loop None (Some x) (y::xs) 0
    | _ -> 0