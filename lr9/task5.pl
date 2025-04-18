%  ЗАДАЧА 1: Количество чисел, взаимно простых с заданным

% Предикат чтения: read_number(-N)
% Унифицирует N с введенным числом
read_number(N) :- 
    write('Введите число: '), 
    read(N), 
    integer(N), 
    N > 0.

% Предикат логики: count_coprimes(+N, -Count)
% N - входное число (унифицировано)
% Count - количество взаимно простых чисел (унифицируется при успехе)
count_coprimes(N, Count) :-
    euler_phi(N, Count). % Используем функцию Эйлера

% Вспомогательный предикат: euler_phi(+N, -Result)
% Реализация функции Эйлера через разложение на простые множители
euler_phi(N, Result) :-
    prime_factors(N, Factors),
    remove_duplicates(Factors, UniqueFactors),
    calculate_phi(N, UniqueFactors, Result).

% Предикат вывода: print_coprimes_count(+Count)
print_coprimes_count(Count) :-
    format('Количество взаимно простых чисел: ~w~n', [Count]).

% Пример использования: 
% read_number(N), count_coprimes(N, C), print_coprimes_count(C).


%  ЗАДАЧА 2: Делитель, взаимно простой с наибольшим количеством цифр


% Предикат логики: find_best_divisor(+N, -BestDivisor)
% N - входное число (унифицировано)
% BestDivisor - искомый делитель (унифицируется при успехе)
find_best_divisor(N, BestDivisor) :-
    divisors(N, Divisors),
    digits(N, Digits),
    max_coprime_divisor(Divisors, Digits, BestDivisor).

% Вспомогательные предикаты:

% divisors(+N, -Ds) - находит все делители числа
divisors(N, Ds) :-
    findall(D, (between(1, N, D), N mod D =:= 0), Ds).

% digits(+N, -Digits) - возвращает список цифр числа
digits(N, Digits) :-
    number_chars(N, Chars),
    maplist(number_chars, Digits, Chars).

% max_coprime_divisor(+Ds, +Digits, -MaxD) - ищет делитель с максимумом совпадений
max_coprime_divisor([D|Ds], Digits, MaxD) :-
    count_coprime_digits(D, Digits, C),
    max_coprime_divisor(Ds, Digits, D, C, MaxD).

max_coprime_divisor([], _, MaxD, _, MaxD).
max_coprime_divisor([D|Ds], Digits, CurMax, CurMaxCount, MaxD) :-
    count_coprime_digits(D, Digits, C),
    (C > CurMaxCount -> 
        max_coprime_divisor(Ds, Digits, D, C, MaxD)
    ; 
        max_coprime_divisor(Ds, Digits, CurMax, CurMaxCount, MaxD)
    ).

% count_coprime_digits(+D, +Digits, -C) - считает цифры, взаимно простые с D
count_coprime_digits(D, Digits, C) :-
    include(coprime(D), Digits, Coprimes),
    length(Coprimes, C).

coprime(X, Y) :- gcd(X, Y) =:= 1.

% Предикат вывода: print_best_divisor(+D)
print_best_divisor(D) :-
    format('Лучший делитель: ~w~n', [D]).

% Пример использования:
% read_number(N), find_best_divisor(N, D), print_best_divisor(D).


%  ОБЩИЕ ВСПОМОГАТЕЛЬНЫЕ ПРЕДИКАТЫ


% Проверка на простой множитель
prime_factors(N, Factors) :- 
    N > 1, 
    prime_factors(N, 2, [], Factors).

prime_factors(1, _, F, F).
prime_factors(N, D, Acc, F) :-
    (D*D > N -> 
        append(Acc, [N], F)
    ; 
        (N mod D =:= 0 ->
            N1 is N // D,
            prime_factors(N1, D, [D|Acc], F)
        ;
            D1 is D + 1,
            prime_factors(N, D1, Acc, F)
        )
    ).

% Удаление дубликатов из списка
remove_duplicates([], []).
remove_duplicates([H|T], [H|R]) :-
    exclude(==(H), T, T1),
    remove_duplicates(T1, R).

% Расчет функции Эйлера
calculate_phi(N, [], N).
calculate_phi(N, [P|Ps], Result) :-
    Result1 is N // P * (P - 1),
    calculate_phi(Result1, Ps, Result).

% GCD (используем встроенный предикат)
gcd(X, Y, G) :- G is gcd(X, Y).