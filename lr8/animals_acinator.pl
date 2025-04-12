:- dynamic(known/2).

% ====== Запуск ======
start :-
    retractall(known(_,_)),
    guess(Animal),
    (   Animal = unknown
    ->  write('Я не могу угадать животное.'), nl
    ;   format('Я думаю, это ~w!~n', [Animal])
    ),
    write('Хотите сыграть ещё раз? (да/нет) '),
    read(Input),
    normalize_input(Input, NormInput),
    valid_yes_no(NormInput, Ans),
    (   Ans = yes
    ->  start
    ;   write('Спасибо за игру!'), nl
    ).

% ====== База животных ======
animal(cat,      [mammal(yes), water(no),  predator(yes), stripes(no),  domestic(yes)]).
animal(dog,      [mammal(yes), water(no),  predator(no),  stripes(no),  domestic(yes)]).
animal(lion,     [mammal(yes), water(no),  predator(yes), stripes(no),  domestic(no)]).
animal(tiger,    [mammal(yes), water(no),  predator(yes), stripes(yes), domestic(no)]).
animal(zebra,    [mammal(yes), water(no),  predator(no),  stripes(yes), domestic(no)]).
animal(giraffe,  [mammal(yes), water(no),  predator(no),  stripes(no),  domestic(no)]).
animal(horse,    [mammal(yes), water(no),  predator(no),  stripes(no),  domestic(yes)]).
animal(sheep,    [mammal(yes), water(no),  predator(no),  stripes(no),  domestic(yes)]).
animal(cow,      [mammal(yes), water(no),  predator(no),  stripes(no),  domestic(yes)]).
animal(goat,     [mammal(yes), water(no),  predator(no),  stripes(no),  domestic(yes)]).
animal(wolf,     [mammal(yes), water(no),  predator(yes), stripes(no),  domestic(no)]).
animal(whale,    [mammal(yes), water(yes), predator(no),  stripes(no),  domestic(no)]).
animal(dolphin,  [mammal(yes), water(yes), predator(no),  stripes(no),  domestic(no)]).
animal(bat,      [mammal(yes), water(no),  predator(no),  stripes(no),  domestic(no)]).
animal(shark,    [mammal(no),  water(yes), predator(yes), stripes(no),  domestic(no)]).
animal(salmon,   [mammal(no),  water(yes), predator(no),  stripes(no),  domestic(no)]).
animal(crocodile,[mammal(no),  water(yes), predator(yes), stripes(yes), domestic(no)]).
animal(frog,     [mammal(no),  water(yes), predator(no),  stripes(no),  domestic(no)]).
animal(eagle,    [mammal(no),  water(no),  predator(yes), stripes(no),  domestic(no)]).
animal(penguin,  [mammal(no),  water(yes), predator(no),  stripes(no),  domestic(no)]).

% ====== Основная логика ======
guess(Animal) :-
    animal(Animal, Properties),
    check_all(Properties), !.
guess(unknown).

check_all([]).
check_all([Prop|Tail]) :-
    check_one(Prop),
    check_all(Tail).

check_one(QuestionName(ExpectedAnswer)) :-
    known(QuestionName, Answer), !,
    Answer = ExpectedAnswer.
check_one(QuestionName(ExpectedAnswer)) :-
    ask_question(QuestionName, UserAnswer),
    assertz(known(QuestionName, UserAnswer)),
    UserAnswer = ExpectedAnswer.

% ====== Вопросы ======
ask_question(QuestionName, Answer) :-
    question_text(QuestionName, Text),
    write(Text), write(' (да/нет) '),
    read(Input),
    normalize_input(Input, NormInput),
    valid_yes_no(NormInput, Answer).

normalize_input(Input, NormInput) :-
    atom_string(Input, InputStr),
    downcase_atom(InputStr, NormInput).

question_text(mammal, 'Это млекопитающее?').
question_text(water, 'Оно живёт в воде?').
question_text(predator, 'Это хищник?').
question_text(stripes, 'У него есть полосы?').
question_text(domestic, 'Оно домашнее?').

% ====== Обработка да/нет ======
valid_yes_no(Input, yes) :- member(Input, [да, yes]).
valid_yes_no(Input, no) :- member(Input, [нет, no]).
valid_yes_no(Input, Res) :-
    \+ member(Input, [да, нет, yes, no]),
    write('Пожалуйста, введите да/нет: '), nl,
    read(NewInput),
    normalize_input(NewInput, NormInput),
    valid_yes_no(NormInput, Res).












