module Task11

// Решение с использованием списков Черча
let reverseBetweenMinMaxChurch (clist: int ChurchList) =
    let folder state x =
        let (minVal, maxVal, minIdx, maxIdx, idx, lst) = state
        let newMin = if x < minVal then (x, idx) else (minVal, minIdx)
        let newMax = if x > maxVal then (x, idx) else (maxVal, maxIdx)
        (fst newMin, fst newMax, snd newMin, snd newMax, idx + 1, x :: lst)
    
    let (minVal, maxVal, minIdx, maxIdx, _, lst) = 
        clist folder (System.Int32.MaxValue, System.Int32.MinValue, -1, -1, 0, [])
    
    let startIdx = min minIdx maxIdx + 1
    let endIdx = max minIdx maxIdx - 1
    
    let rec buildList idx revPart rest acc =
        if idx > endIdx then 
            List.rev revPart @ rest |> List.foldBack ChurchList.cons acc
        elif idx >= startIdx then 
            buildList (idx + 1) (List.head rest :: revPart) (List.tail rest) acc
        else 
            buildList (idx + 1) revPart (List.tail rest) (ChurchList.cons (List.head rest) acc)
    
    if minIdx = -1 || maxIdx = -1 then clist
    else buildList 0 [] (List.rev lst) ChurchList.empty

// Решение с использованием стандартного list
let reverseBetweenMinMax (lst: int list) =
    if List.isEmpty lst then lst
    else
        let indexed = lst |> List.mapi (fun i x -> (i, x))
        let minElem = indexed |> List.minBy snd
        let maxElem = indexed |> List.maxBy snd
        
        let startIdx = min (fst minElem) (fst maxElem) + 1
        let endIdx = max (fst minElem) (fst maxElem) - 1
        
        let rec rebuild idx left mid right = function
            | [] -> List.rev left @ List.rev mid @ right
            | (i, x)::xs when i = startIdx -> rebuild idx left [] ((i, x)::right) xs
            | (i, x)::xs when i = endIdx -> rebuild idx left ((i, x)::mid) right xs
            | (i, x)::xs when i > startIdx && i < endIdx -> rebuild idx left ((i, x)::mid) right xs
            | (i, x)::xs -> rebuild (idx + 1) ((i, x)::left) mid right xs
        
        rebuild 0 [] [] [] indexed
        |> List.map snd