module Task3

open ChurchList

let churchFold (clist: 'a ChurchList) (f: 'b -> 'a -> 'b) (p: 'a -> bool) (acc: 'b) =
    let rec foldHelper clist acc =
        clist (fun x next -> 
            if p x then foldHelper next (f acc x)
            else foldHelper next acc) acc
    foldHelper clist acc