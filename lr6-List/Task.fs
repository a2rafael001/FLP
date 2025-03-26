module Task1

open ChurchList

let readChurchList n =
    let rec readHelper n acc =
        if n <= 0 then acc
        else
            printf "Введите элемент: "
            let elem = System.Console.ReadLine() |> int
            readHelper (n-1) (cons elem acc)
    readHelper n empty