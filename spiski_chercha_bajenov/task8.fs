module task8


let initialCaravan = ["a"; "b"; "c"; "d"]
let joinedLater1 = ["e"; "f"; "g"]
let joinedLater2 = ["h"; "i"]

let fullCaravan = initialCaravan @ joinedLater1 @ joinedLater2

let run () =
    printfn "Полный караван верблюдов: %A" fullCaravan


