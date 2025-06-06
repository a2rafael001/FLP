:- dynamic(known/2).

% Старт
start :-
    retractall(known(_, _)),
    identify(Person),
    format('Я думаю, это ~w!~n', [Person]).

% Определение личности
identify(nikolay) :- is_nikolay, !.
identify(sergey) :- is_sergey, !.
identify(ivan) :- is_ivan, !.
identify(maria) :- is_maria, !.
identify(alexey) :- is_alexey, !.
identify(svetlana) :- is_svetlana, !.
identify(olga) :- is_olga, !.
identify(mikhail) :- is_mikhail, !.
identify(daniil) :- is_daniil, !.
identify(katya) :- is_katya, !.
identify(andrey) :- is_andrey, !.
identify(unknown).

% ---------- Правила ----------

is_ivan :-
    must_be(male),
    must_be(married),
    must_be(has_children),
    must_be(generation(old)).

is_maria :-
    must_be(female),
    must_be(married),
    must_be(has_children),
    must_be(generation(old)).

is_alexey :-
    must_be(male),
    must_be(married),
    must_be(has_children),
    must_be(generation(middle)).

is_svetlana :-
    must_be(female),
    must_be(married),
    must_be(has_children),
    must_be(generation(middle)).

is_olga :-
    must_be(female),
    must_be(married),
    must_be(has_children),
    must_be(generation(middle)).

is_mikhail :-
    must_be(male),
    must_be(married),
    must_be(has_children),
    must_be(generation(middle)).

is_sergey :-
    must_be(male),
    must_be(not_married),
    must_be(no_children),
    must_be(generation(middle)).

is_nikolay :-
    must_be(male),
    must_be(married),
    must_be(has_children),
    must_be(generation(middle)),
    must_be(works_abroad).  % ❗ Новый вопрос

is_daniil :-
    must_be(male),
    must_be(not_married),
    must_be(no_children),
    must_be(generation(young)).

is_katya :-
    must_be(female),
    must_be(not_married),
    must_be(no_children),
    must_be(generation(young)).

is_andrey :-
    must_be(male),
    must_be(not_married),
    must_be(no_children),
    must_be(generation(young)).

% ---------- Проверки must_be ----------

must_be(male) :-
    known(male, yes), !.
must_be(male) :-
    \+ known(male, _),
    ask('Это мужчина? (да/нет) ', male).

must_be(female) :-
    known(male, no), !.
must_be(female) :-
    \+ known(male, _),
    ask('Это мужчина? (да/нет) ', male),
    known(male, no).

must_be(married) :-
    known(married, yes), !.
must_be(married) :-
    \+ known(married, _),
    ask('Он/Она в браке? (да/нет) ', married).

must_be(not_married) :-
    known(married, no), !.
must_be(not_married) :-
    \+ known(married, _),
    ask('Он/Она в браке? (да/нет) ', married),
    known(married, no).

must_be(has_children) :-
    known(has_children, yes), !.
must_be(has_children) :-
    \+ known(has_children, _),
    ask('У него/неё есть дети? (да/нет) ', has_children).

must_be(no_children) :-
    known(has_children, no), !.
must_be(no_children) :-
    \+ known(has_children, _),
    ask('У него/неё есть дети? (да/нет) ', has_children),
    known(has_children, no).

must_be(generation(Gen)) :-
    known(generation, Gen), !.
must_be(generation(_)) :-
    \+ known(generation, _),
    ask_generation.

must_be(works_abroad) :-
    known(works_abroad, yes), !.
must_be(works_abroad) :-
    \+ known(works_abroad, _),
    ask('Он работает за границей? (да/нет) ', works_abroad).

% ---------- Вопросы ----------

ask_generation :-
    write('К какому поколению он/она относится? (old/middle/young) '),
    read(Ans),
    (   member(Ans, [old, middle, young]) ->
        assertz(known(generation, Ans))
    ;   write('Неверный ответ. Попробуйте снова.'), nl,
        ask_generation
    ).

ask(QuestionText, Key) :-
    write(QuestionText),
    read(Reply),
    (   Reply = да  -> assertz(known(Key, yes))
    ;   Reply = нет -> assertz(known(Key, no)), fail
    ;   write('Пожалуйста, введите "да" или "нет".'), nl,
        ask(QuestionText, Key)
    ).
