module task10


let analyzeList lst =
    let length = List.length lst
    let sum = List.sum lst
    let min = List.min lst
    let max = List.max lst
    let average = float sum / float length

    printfn "Количество элементов: %d" length
    printfn "Сумма элементов: %d" sum
    printfn "Минимальный элемент: %d" min
    printfn "Максимальный элемент: %d" max
    printfn "Среднее значение: %.2f" average

let run () =
    let inputList = [3; 7; 12; 5; 9]  // Можно заменить на произвольный список
    analyzeList inputList


