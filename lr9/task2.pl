% ======= MAX DIGIT =======
max_digit_up(Number, MaxDigit) :-
    Number >= 0,
    max_digit_up_helper(Number, MaxDigit).

max_digit_up_helper(0, 0).
max_digit_up_helper(Number, MaxDigit) :-
    Number > 0,
    Digit is Number mod 10,
    Rest is Number // 10,
    max_digit_up_helper(Rest, MaxRest),
    MaxDigit is max(Digit, MaxRest).

max_digit_down(Number, MaxDigit) :-
    Number >= 0,
    max_digit_down_helper(Number, 0, MaxDigit).

max_digit_down_helper(0, Acc, Acc).
max_digit_down_helper(Number, Acc, Result) :-
    Number > 0,
    Digit is Number mod 10,
    NewAcc is max(Digit, Acc),
    Rest is Number // 10,
    max_digit_down_helper(Rest, NewAcc, Result).

% ======= SUM DIGITS DIVISIBLE BY 3 =======
sum_digits_div3_up(Number, Sum) :-
    Number >= 0,
    sum_digits_div3_up_helper(Number, Sum).

sum_digits_div3_up_helper(0, 0).
sum_digits_div3_up_helper(Number, Sum) :-
    Digit is Number mod 10,
    Rest is Number // 10,
    sum_digits_div3_up_helper(Rest, PartialSum),
    (   Digit mod 3 =:= 0
    ->  Sum is PartialSum + Digit
    ;   Sum is PartialSum
    ).

sum_digits_div3_down(Number, Sum) :-
    Number >= 0,
    sum_digits_div3_down_helper(Number, 0, Sum).

sum_digits_div3_down_helper(0, Acc, Acc).
sum_digits_div3_down_helper(Number, Acc, Sum) :-
    Digit is Number mod 10,
    Rest is Number // 10,
    (   Digit mod 3 =:= 0
    ->  NewAcc is Acc + Digit
    ;   NewAcc is Acc
    ),
    sum_digits_div3_down_helper(Rest, NewAcc, Sum).

% ======= COUNT DIVISORS =======
count_divisors_up(N, Count) :-
    N > 0,
    count_divisors_up_helper(N, 1, Count).

count_divisors_up_helper(N, Current, 0) :-
    Current > N, !.
count_divisors_up_helper(N, Current, Count) :-
    Current =< N,
    Next is Current + 1,
    count_divisors_up_helper(N, Next, PartialCount),
    (   N mod Current =:= 0
    ->  Count is PartialCount + 1
    ;   Count is PartialCount
    ).

count_divisors_down(N, Count) :-
    N > 0,
    count_divisors_down_helper(N, 1, 0, Count).

count_divisors_down_helper(N, Current, Acc, Acc) :-
    Current > N, !.
count_divisors_down_helper(N, Current, Acc, Count) :-
    (   N mod Current =:= 0
    ->  NewAcc is Acc + 1
    ;   NewAcc is Acc
    ),
    Next is Current + 1,
    count_divisors_down_helper(N, Next, NewAcc, Count).

% ======= MAIN DEMONSTRATION =======
example_program_2 :-
    write('Enter a non-negative integer: '), nl,
    read(Number),
    Number >= 0,
    
    % Max digit
    max_digit_up(Number, MaxUp),
    max_digit_down(Number, MaxDown),
    write('Max digit (up): '), write(MaxUp), nl,
    write('Max digit (down): '), write(MaxDown), nl,

    % Sum of digits divisible by 3
    sum_digits_div3_up(Number, SumUp),
    sum_digits_div3_down(Number, SumDown),
    write('Sum of digits divisible by 3 (up): '), write(SumUp), nl,
    write('Sum of digits divisible by 3 (down): '), write(SumDown), nl,

    % Count divisors
    count_divisors_up(Number, DivCountUp),
    count_divisors_down(Number, DivCountDown),
    write('Divisors count (up): '), write(DivCountUp), nl,
    write('Divisors count (down): '), write(DivCountDown), nl.

