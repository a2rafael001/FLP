module UserInteraction

let favoriteLanguage () =
    printf "Какой у вас любимый язык программирования? "
    let lang = System.Console.ReadLine()
    match lang with
    | "F#" | "Prolog" -> printfn "Вы подлиза!"
    | "Python" -> printfn "Отличный выбор!"
    | "C#" -> printfn "Неплохо, но сложно!"
    | _ -> printfn "Интересный выбор!"

let testLanguageSuperposition () =
    let response = favoriteLanguage()
    response
