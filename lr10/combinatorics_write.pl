% ---------- Общие предикаты для записи в файл ----------
write_list_to_file(_, []) :- !.
write_list_to_file(Stream, [H|T]) :-
    write(Stream, H),
    nl(Stream),
    write_list_to_file(Stream, T).

% ---------- 1. Размещения без повторений ----------

% Генерация всех размещений без повторений
placement_no_rep(Alphabet, K, Placement) :-
    length(Placement, K),
    permutation(Alphabet, Temp),
    prefix_length(Temp, Placement, K).

% Запись размещений в файл
save_placements(File, Alphabet, K) :-
    open(File, write, Stream),
    findall(P, placement_no_rep(Alphabet, K, P), List),
    maplist(atomics_to_string, List, Strings),
    write_list_to_file(Stream, Strings),
    close(Stream).

% ---------- 2. Подмножества ----------

subset([], []).
subset([H|T], [H|R]) :- subset(T, R).
subset([_|T], R) :- subset(T, R).

% Запись подмножеств в файл
save_subsets(File, Alphabet) :-
    open(File, write, Stream),
    findall(S, subset(Alphabet, S), List),
    maplist(atomics_to_string, List, Strings),
    write_list_to_file(Stream, Strings),
    close(Stream).

% ---------- 3. Слова длины 5 с ровно 2 буквами 'a' ----------

word_with_2a(Alphabet, Word) :-
    length(Word, 5),
    select(a, Alphabet, Rest1),
    select(a, [a|Rest1], Rest2),
    permutation(Rest2, PermRest),
    prefix_length(PermRest, RestWord, 3),
    append([a,a], RestWord, TempWord),
    permutation(TempWord, Word).

% Запись слов длины 5 в файл
save_words_2a(File, Alphabet) :-
    open(File, write, Stream),
    findall(W, word_with_2a(Alphabet, W), List),
    maplist(atomics_to_string, List, Strings),
    write_list_to_file(Stream, Strings),
    close(Stream).

% ---------- 4. Слова длины 7: 1 буква 3 раза, 1 буква 2 раза, остальные уникальны ----------

word_special(Alphabet, Word) :-
    length(Word, 7),
    select(X, Alphabet, Rest1),
    select(Y, Rest1, Rest2), X \= Y,
    select(Z1, Rest2, Rest3), Z1 \= X, Z1 \= Y,
    select(Z2, Rest3, _), Z2 \= X, Z2 \= Y, Z2 \= Z1,
    append([X,X,X,Y,Y,Z1,Z2], Temp),
    permutation(Temp, Word).

% Запись слов длины 7 в файл
save_words_special(File, Alphabet) :-
    open(File, write, Stream),
    findall(W, word_special(Alphabet, W), List),
    maplist(atomics_to_string, List, Strings),
    write_list_to_file(Stream, Strings),
    close(Stream).

% ---------- Вспомогательный предикат ----------
% Перевод списка символов в строку (например, [a,b,c] -> "abc")
atomics_to_string(List, String) :-
    atomic_list_concat(List, '', String).
