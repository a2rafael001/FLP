module Task15

// Решение с использованием списков Черча
let primeFactorsChurch n =
    let rec factorize acc num p =
        if p * p > num then
            if num > 1 then ChurchList.cons num acc else acc
        elif num % p = 0 then
            factorize (ChurchList.cons p acc) (num / p) p
        else
            factorize acc num (p + 1)
    
    if n < 2 then ChurchList.empty
    else factorize ChurchList.empty n 2

// Решение с использованием стандартного list
let primeFactors n =
    let rec factorize num p acc =
        if p * p > num then
            if num > 1 then num :: acc else acc
        elif num % p = 0 then
            factorize (num / p) p (p :: acc)
        else
            factorize num (p + 1) acc
    
    if n < 2 then []
    else factorize n 2 [] |> List.sort