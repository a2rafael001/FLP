% Решение задачи о подругах
% Определяем цвета платьев и туфель для Ани, Вали и Наташи

% Предикат, проверяющий уникальность элементов в списке
unique([]).
unique([H|T]) :- \+ member(H, T), unique(T).

% Главный предикат решения
solve :-
    % Цвета платьев: [Аня, Валя, Наташа]
    Dresses = [AnyaDress, ValyaDress, NatashaDress],
    Dresses = [white, green, blue],  % Все цвета должны быть использованы
    
    % Цвета туфель: [Аня, Валя, Наташа]
    Shoes = [AnyaShoes, ValyaShoes, NatashaShoes],
    Shoes = [white, green, blue],    % Все цвета должны быть использованы
    
    % Условия задачи:
    % 1. Только у Ани совпадают цвета
    AnyaDress = AnyaShoes,          % Цвета Ани совпадают
    ValyaDress \= ValyaShoes,       % Цвета Вали разные
    NatashaDress \= NatashaShoes,   % Цвета Наташи разные
    
    % 2. У Вали нет белого цвета
    ValyaDress \= white,
    ValyaShoes \= white,
    
    % 3. Наташа в зеленых туфлях
    NatashaShoes = green,
    
    % Проверка уникальности
    unique(Dresses),
    unique(Shoes),
    
    % Вывод результата
    format('Аня: платье ~w, туфли ~w~n', [AnyaDress, AnyaShoes]),
    format('Валя: платье ~w, туфли ~w~n', [ValyaDress, ValyaShoes]),
    format('Наташа: платье ~w, туфли ~w~n', [NatashaDress, NatashaShoes]).

