open MathFunctions
open Recursion
open NumberProcessing
open UserInteraction
open FunctionalOperations

[<EntryPoint>]
let main argv =
    printfn "Выберите задание для выполнения:"
    let choice = System.Console.ReadLine()
    match choice with
    | "1" -> helloWorld()
    | "2" -> solveQuadratic()
    | "3" -> computeCylinderVolume()
    | "4" -> sumDigitsRecursive()
    | "5" -> testRecursionMethods()
    | "6" -> testFunctionReturn()
    | "7" -> testNumberTraversal()
    | "8" -> testNumberTraversalWithLambdas()
    | "9" -> testConditionalNumberTraversal()
    | "10" -> testMultipleExamples()
    | "11" -> favoriteLanguage()
    | "12" -> testLanguageSuperposition()
    | "13" -> testMutuallyPrimeTraversal()
    | "14" -> testEulerFunction()
    | "15" -> testConditionalMutuallyPrimeTraversal()
    | "16" -> testCustomNumberFunctions()
    | "19" -> testFunctionalDecomposition()
    | "20" -> tupleFunctionExecution()
    | _ -> printfn "Некорректный выбор"
    0
