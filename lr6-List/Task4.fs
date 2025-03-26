module Task4

open ChurchList
open Task3

let minElement clist =
    churchFold clist (fun acc x -> if x < acc then x else acc) (fun _ -> true) System.Int32.MaxValue

let sumEven clist =
    churchFold clist (+) (fun x -> x % 2 = 0) 0

let countOdd clist =
    churchFold clist (fun acc _ -> acc + 1) (fun x -> x % 2 <> 0) 0