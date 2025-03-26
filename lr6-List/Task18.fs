module Task18

// Проверка упорядоченности строчных символов по возрастанию
let areLowercaseLettersOrdered (str: string) =
    let lowercaseChars = 
        str 
        |> Seq.filter System.Char.IsLower
        |> Seq.toList
    
    let rec isOrdered = function
        | [] | [_] -> true
        | x::y::rest -> x <= y && isOrdered (y::rest)
    
    isOrdered lowercaseChars

// Альтернативная реализация с использованием Seq.pairwise
let areLowercaseLettersOrdered2 (str: string) =
    str
    |> Seq.filter System.Char.IsLower
    |> Seq.pairwise
    |> Seq.forall (fun (a, b) -> a <= b)