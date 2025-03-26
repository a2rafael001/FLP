module MathFunctions

let helloWorld () = 
    printfn "Hello, World!"

let solveQuadratic () =
    printf "Введите коэффициенты a, b, c: "
    let a, b, c = System.Console.ReadLine().Split() |> Array.map float |> fun arr -> arr.[0], arr.[1], arr.[2]
    let d = b * b - 4.0 * a * c
    if d > 0.0 then
        let x1 = (-b + sqrt d) / (2.0 * a)
        let x2 = (-b - sqrt d) / (2.0 * a)
        printfn "Корни: %f и %f" x1 x2
    elif d = 0.0 then
        let x = -b / (2.0 * a)
        printfn "Один корень: %f" x
    else
        printfn "Корней нет"

let circleArea r = System.Math.PI * r * r
let cylinderVolume r h = circleArea r * h

let computeCylinderVolume () =
    printf "Введите радиус и высоту: "
    let r, h = System.Console.ReadLine().Split() |> Array.map float |> fun arr -> arr.[0], arr.[1]
    printfn "Объем цилиндра: %f" (cylinderVolume r h)
