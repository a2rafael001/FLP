module Program

open Task1
open Task2
open Task3
open Task4
open Task5
open Task6

[<EntryPoint>]
let main argv =
    printf "Введите количество элементов: "
    let n = int (System.Console.ReadLine())
    let churchList = readChurchList n
    
    printf "Список: "
    printChurchList churchList
    
    let minElem = minElement churchList
    printfn "Минимальный элемент: %d" minElem
    
    let sumEvenNumbers = sumEven churchList
    printfn "Сумма четных элементов: %d" sumEvenNumbers
    
    let oddCount = countOdd churchList
    printfn "Количество нечетных элементов: %d" oddCount
    
    let mostFrequent = mostFrequentElement churchList
    printfn "Самый частый элемент: %d" mostFrequent
    
    printf "Введите строки через пробел: "
    let inputStrings = System.Console.ReadLine().Split(' ') |> List.ofArray
    let tree = buildTree inputStrings
    printf "Обход дерева (in-order): "
    printTree tree
    
    0