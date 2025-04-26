% Предикаты чтения и записи строк

% Читает файл и возвращает список строк
read_file_lines(FileName, Lines) :-
    setup_call_cleanup(
        open(FileName, read, Stream),
        read_lines(Stream, Lines),
        close(Stream)
    ).

read_lines(Stream, []) :- at_end_of_stream(Stream), !.
read_lines(Stream, [Line|Rest]) :-
    read_line_to_string(Stream, Line),
    read_lines(Stream, Rest).

% Записывает список строк в файл
write_file_lines(FileName, Lines) :-
    setup_call_cleanup(
        open(FileName, write, Stream),
        write_lines(Stream, Lines),
        close(Stream)
    ).

write_lines(_, []) :- !.
write_lines(Stream, [Line|Rest]) :-
    writeln(Stream, Line),
    write_lines(Stream, Rest).

% Вывод строк на экран
print_lines([]).
print_lines([H|T]) :- writeln(H), print_lines(T).

% -------------- Решения задач --------------

% Задача 1: Длина наибольшей строки
max_line_length(File, MaxLength) :-
    read_file_lines(File, Lines),
    maplist(string_length, Lines, Lengths),
    max_list(Lengths, MaxLength).

% Задача 2: Количество строк без пробелов
count_no_space_lines(File, Count) :-
    read_file_lines(File, Lines),
    include(\S^( \+sub_string(S, _, _, _, " ") ), Lines, NoSpaceLines),
    length(NoSpaceLines, Count).

% Задача 3: Строки, где букв 'a' больше среднего
lines_with_more_a_than_avg(File, ResultLines) :-
    read_file_lines(File, Lines),
    findall(A_Count, (
        member(L, Lines),
        string_chars(L, Chars),
        include(=(a), Chars, AList),
        length(AList, A_Count)
    ), A_Counts),
    sum_list(A_Counts, Sum),
    length(Lines, Len),
    Avg is Sum / Len,
    include({Avg}/[L]>>(
        string_chars(L, Chars),
        include(=(a), Chars, AList),
        length(AList, CountA),
        CountA > Avg
    ), Lines, ResultLines).

% Задача 4: Самое частое слово в файле
most_frequent_word(File, Word) :-
    read_file_lines(File, Lines),
    maplist(split_string_by_space, Lines, WordsNested),
    flatten(WordsNested, Words),
    msort(Words, Sorted),
    pack(Sorted, Packed),
    max_member_by_length(Packed, MostFrequentList),
    MostFrequentList = [Word|_].

split_string_by_space(Line, Words) :-
    split_string(Line, " ", "", Words).

pack([], []).
pack([X|Xs], [Z|Zs]) :-
    transfer(X, Xs, Ys, Z),
    pack(Ys, Zs).

transfer(X, [], [], [X]).
transfer(X, [Y|Ys], [Y|Ys], [X]) :- X \= Y.
transfer(X, [X|Xs], Ys, [X|Zs]) :-
    transfer(X, Xs, Ys, Zs).

max_member_by_length([X], X).
max_member_by_length([X|Xs], Max) :-
    max_member_by_length(Xs, TempMax),
    ( length(X, L1), length(TempMax, L2), L1 >= L2 -> Max = X ; Max = TempMax ).

% Задача 5: Строки из неповторяющихся слов
unique_words_lines(InputFile, OutputFile) :-
    read_file_lines(InputFile, Lines),
    maplist(split_string_by_space, Lines, NestedWords),
    flatten(NestedWords, AllWords),
    findall(Line, (
        member(Line, Lines),
        split_string_by_space(Line, Words),
        forall(member(W, Words), (
            include(==(W), AllWords, Occurrences),
            length(Occurrences, 1)
        ))
    ), ResultLines),
    write_file_lines(OutputFile, ResultLines).

% ---------------------- Генераторы комбинаций ----------------------

% 1) Размещения без повторений из Alphabet по K:
placement_no_rep(Alphabet, K, Placement) :-
    length(Placement, K),
    permutation(Alphabet, Perm),
    prefix_length(Perm, Placement, K).

% 2) Подмножества алфавита:
subset([], []).
subset([H|T], [H|R]) :- subset(T, R).
subset([_|T], R) :- subset(T, R).

% 3) Слова длины 5: ровно 2 буквы 'a', остальные без повторений
words_2a_unique(Alphabet, Word) :-
    length(Word, 5),
    select(a, Alphabet, Rest),
    select(a, [a|Rest], Rest2),
    permutation(Rest2, PermRest),
    prefix_length(PermRest, RestWord, 3),
    append([a,a], RestWord, TempWord),
    permutation(TempWord, Word).

% 4) Слова длины 7: 1 буква 3 раза, другая буква 2 раза, остальные не повторяются
words_special(Alphabet, Word) :-
    length(Word, 7),
    select(X, Alphabet, Rest1),
    select(Y, Rest1, Rest2), X \= Y,
    select(Z1, Rest2, Rest3), Z1 \= X, Z1 \= Y,
    select(Z2, Rest3, _), Z2 \= X, Z2 \= Y, Z2 \= Z1,
    append([X,X,X,Y,Y,Z1,Z2], Temp),
    permutation(Temp, Word).

