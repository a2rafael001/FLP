% ---------- Задание 1 ----------
% Рекурсивное размещение с повторениями из n по k (одно размещение)
placement_rep_single(_, 0, []).
placement_rep_single(Alphabet, K, [H|T]) :-
    K > 0,
    member(H, Alphabet),
    K1 is K - 1,
    placement_rep_single(Alphabet, K1, T).

% Вывод всех размещений с повторениями на экран
placement_rep_all(Alphabet, K) :-
    placement_rep_single(Alphabet, K, Placement),
    write(Placement), nl, fail; true.

% ---------- Задание 2 ----------
% Рекурсивные сочетания без повторений из n по k (одно сочетание)
combination_single(_, 0, []).
combination_single([H|T], K, [H|CombT]) :-
    K > 0, K1 is K - 1,
    combination_single(T, K1, CombT).
combination_single([_|T], K, Comb) :-
    K > 0,
    combination_single(T, K, Comb).

% Вывод всех сочетаний без повторений на экран
combinations_all(Alphabet, K) :-
    combination_single(Alphabet, K, Combination),
    write(Combination), nl, fail; true.

% ---------- Задание 3 ----------
% Нерекурсивные размещения с повторениями (итеративно на Prolog через backtracking)
% (по факту то же, что рекурсивное размещение, только с выводом сразу всех результатов)

% Предикат уже реализован выше placement_rep_all/2 (его достаточно)

% ---------- Задание 4 ----------
% Нерекурсивные сочетания без повторений (итеративно на Prolog через backtracking)

% Предикат уже реализован выше combinations_all/2 (его достаточно)

% ---------- Задание 5 ----------
% Слова длины K, содержащие ровно 3 буквы 'a'
word_with_3a(Alphabet, K, Word) :-
    length(Word, K),
    maplist({Alphabet}/[X]>>member(X, Alphabet), Word),
    include(=(a), Word, AList),
    length(AList, 3).

% Вывод всех слов на экран
words_with_3a(Alphabet, K) :-
    word_with_3a(Alphabet, K, Word),
    write(Word), nl, fail; true.

% ---------- Задание 6 ----------
% Предикат, получающий одно размещение (для использования отдельно)
% уже реализован: placement_rep_single/3 выше.

% Предикат, выводящий все размещения из n по k с повторениями:
% уже реализован: placement_rep_all/2 выше.

% ---------- Задание 7 ----------
% Предикат, получающий одно сочетание без повторений:
% уже реализован: combination_single/3 выше.

% Предикат, выводящий на экран все сочетания без повторений:
% уже реализован: combinations_all/2 выше.

% ---------- Задание 8 ----------
% Предикат, строящий все слова длины K с ровно 3 буквами 'a':
% уже реализован: words_with_3a/2 выше.
