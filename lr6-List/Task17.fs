module Task17

// 1. Реверс массива
let reverseArray (arr: 'a[]) = Array.rev arr

// 2. Копирование последнего элемента из B в A
let copyLastElement (a: 'a[]) (b: 'a[]) =
    if b.Length = 0 then a
    else Array.append a [| b.[b.Length - 1] |]

// 3. Объединение двух массивов
let concatArrays (a: 'a[]) (b: 'a[]) = Array.append a b

// 4. Фильтр элементов, делящихся на 3
let filterDivByThree (arr: int[]) = Array.filter (fun x -> x % 3 = 0) arr

// 5. Разность чисел, представленных массивами
let arraysToNumberDiff (a: int[]) (b: int[]) =
    let num1 = Array.fold (fun acc x -> acc * 10 + x) 0 a
    let num2 = Array.fold (fun acc x -> acc * 10 + x) 0 b
    num1 - num2

// 6. Объединение множеств (уникальные элементы из обоих массивов)
let unionOfSortedArrays (a: int[]) (b: int[]) =
    let rec merge i j acc =
        if i >= a.Length && j >= b.Length then List.rev acc |> List.toArray
        elif i >= a.Length then merge i (j+1) (b.[j]::acc)
        elif j >= b.Length then merge (i+1) j (a.[i]::acc)
        elif a.[i] < b.[j] then merge (i+1) j (a.[i]::acc)
        elif a.[i] > b.[j] then merge i (j+1) (b.[j]::acc)
        else merge (i+1) (j+1) (a.[i]::acc)
    merge 0 0 [] |> Array.distinct

// 7. Пересечение множеств
let intersectSortedArrays (a: int[]) (b: int[]) =
    let rec intersect i j acc =
        if i >= a.Length || j >= b.Length then List.rev acc |> List.toArray
        elif a.[i] < b.[j] then intersect (i+1) j acc
        elif a.[i] > b.[j] then intersect i (j+1) acc
        else intersect (i+1) (j+1) (a.[i]::acc)
    intersect 0 0 []

// 8. Симметрическая разность
let symmetricDiff (a: int[]) (b: int[]) =
    let union = unionOfSortedArrays a b
    let intersection = intersectSortedArrays a b
    Array.filter (fun x -> not (Array.contains x intersection)) union

// 9. Массив первых 100 чисел, делящихся на 13 или 17
let generateSpecialArray () =
    let rec generate n count acc =
        if count >= 100 then List.rev acc |> List.toArray
        elif n % 13 = 0 || n % 17 = 0 then generate (n+1) (count+1) (n::acc)
        else generate (n+1) count acc
    generate 1 0 []

// 10. Поиск рациональных корней многочлена
let findRationalRoots (coefficients: int[]) =
    let p = coefficients.[coefficients.Length - 1]
    let q = coefficients.[0]
    
    let divisors n =
        let nAbs = abs n
        if nAbs = 0 then []
        else
            [1..nAbs]
            |> List.filter (fun x -> nAbs % x = 0)
    
    let pDivisors = divisors p
    let qDivisors = divisors q
    
    let candidates =
        qDivisors
        |> List.collect (fun qd ->
            pDivisors |> List.map (fun pd -> (pd, qd)))
        |> List.distinct
        |> List.map (fun (p, q) -> float p / float q)
        |> List.distinct
    
    let evaluate x =
        Array.fold (fun (sum, power) coeff -> 
            (sum + float coeff * (x ** power), power + 1.0)) (0.0, 0.0) coefficients
        |> fst
    
    candidates
    |> List.filter (fun x -> abs (evaluate x) < 1e-10)
    |> List.toArray