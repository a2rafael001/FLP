module Task2

open ChurchList

let printChurchList (clist: 'a ChurchList) =
    let rec printHelper clist =
        clist (fun x next -> 
            printf "%A " x
            next) ()
    printHelper clist
    printfn ""