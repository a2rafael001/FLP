module Task19

open System

// Частота символа в алфавите (английские буквы)
let alphabetFrequency (c: char) =
    match Char.ToLower(c) with
    | 'e' -> 0.127
    | 't' -> 0.091
    | 'a' -> 0.082
    | 'o' -> 0.075
    | 'i' -> 0.070
    | 'n' -> 0.067
    | 's' -> 0.063
    | 'h' -> 0.061
    | 'r' -> 0.060
    | 'd' -> 0.043
    | 'l' -> 0.040
    | 'c' -> 0.028
    | 'u' -> 0.028
    | 'm' -> 0.024
    | 'w' -> 0.024
    | 'f' -> 0.022
    | 'g' -> 0.020
    | 'y' -> 0.020
    | 'p' -> 0.019
    | 'b' -> 0.015
    | 'v' -> 0.010
    | 'k' -> 0.008
    | 'j' -> 0.002
    | 'x' -> 0.002
    | 'q' -> 0.001
    | 'z' -> 0.001
    | _ -> 0.0 // для не-буквенных символов

// Вычисление разницы частот для строки
let calculateFrequencyDiff (str: string) =
    if String.IsNullOrEmpty(str) then 0.0
    else
        // Частота самого частого символа в строке
        let strFreq =
            str.ToLower()
            |> Seq.filter Char.IsLetter
            |> Seq.countBy id
            |> Seq.map (fun (c, cnt) -> (c, float cnt / float str.Length))
            |> Seq.sortByDescending snd
            |> Seq.tryHead
            |> Option.map snd
            |> Option.defaultValue 0.0
        
        // Частота этого символа в алфавите
        let mostFreqChar = 
            str.ToLower()
            |> Seq.filter Char.IsLetter
            |> Seq.countBy id
            |> Seq.sortByDescending snd
            |> Seq.tryHead
            |> Option.map fst
        
        let alphabetFreq = 
            mostFreqChar
            |> Option.map alphabetFrequency
            |> Option.defaultValue 0.0
        
        strFreq - alphabetFreq

// Сортировка строк по возрастанию разницы частот
let sortStringsByFrequencyDiff (strings: string list) =
    strings
    |> List.map (fun s -> (s, calculateFrequencyDiff s))
    |> List.sortBy snd
    |> List.map fst