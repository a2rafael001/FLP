
type PaymentResult =
    | Error of string
    | Success of float

module PaymentResult =
    let map f = function
        | Error msg -> Error msg 
        | Success amount -> Success (f amount)  


let payment1 = Success 1000.0  
let payment2 = Error "Недостаточно средств"  


let applyDiscount x = x * 0.9

let result1 = PaymentResult.map applyDiscount payment1  
let result2 = PaymentResult.map applyDiscount payment2  

printfn "%A" result1  
printfn "%A" result2 
