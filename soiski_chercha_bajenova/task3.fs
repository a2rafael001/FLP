module task3

let salaries = [10.0; 11.0; 12.5; 15.0; 13.0; 7.5]
let increaseRate = 1.15

let newSalaries = salaries |> List.map (fun salary -> salary * increaseRate)

let run () =
    printfn "Новые оклады сотрудников: %A" newSalaries
