% Определение детей и городов
children([alik, borya, vitya, lena, dasha]).
cities([kharkiv, uman, poltava, slavyansk, kramatorsk]).

% Главный предикат решения
solve :-
    % Получаем список детей и городов
    children(Children),
    cities(Cities),
    
    % Генерируем уникальные назначения городов детям
    assign_cities(Children, Cities, Assignment),
    
    % Проверяем условия задачи
    check_conditions(Assignment),
    
    % Выводим результат
    print_assignment(Assignment).

% Предикат для распределения уникальных городов
assign_cities([], []).
assign_cities([Child|Children], Cities) :-
    select(City, Cities, RemainingCities), % Выбираем уникальный город
    Child = City,                           % Связываем ребенка с городом
    assign_cities(Children, RemainingCities).

% Проверка всех условий задачи
check_conditions(Assignment) :-
    % Условие 1: Если Алик не из Умани → Боря из Краматорска
    (member(alik-uman, Assignment) -> true ; member(borya-kramatorsk, Assignment)),
    
    % Условие 2: Боря или Витя из Харькова (но не оба)
    (member(borya-kharkiv, Assignment) ; member(vitya-kharkiv, Assignment)),
    \+ (member(borya-kharkiv, Assignment), member(vitya-kharkiv, Assignment)),
    
    % Условие 3: Если Витя не из Славянска → Лена из Харькова
    (member(vitya-slavyansk, Assignment) -> true ; member(lena-kharkiv, Assignment)),
    
    % Условие 4: Даша из Умани ∨ Лена из Краматорска
    (member(dasha-uman, Assignment) ; member(lena-kramatorsk, Assignment)).

% Вывод результата в удобочитаемом виде
print_assignment(Assignment) :-
    maplist(writeln, Assignment).

% Запуск решения
?- solve.