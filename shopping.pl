:- dynamic basket/1.

basket([coffee, milk, chocolate, apple, juice]).

display_items([]).
display_items([H|T]) :-
    write(H), nl,
    display_items(T).

menu :-
    nl,
    write('** SHOPPING LIST **'), nl,
    write('d. display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. exit.'), nl,
    write('ENTER YOUR CHOICE .'), nl,
    read(Choice),
    option(Choice).

option(d) :-
    basket(L),
    display_items(L),
    menu.

option(a) :-
    write('enter the item you want to add it'), nl,
    read(Item),
    retract(basket(L)),
    append(L, [Item], NewL),
    assert(basket(NewL)),
    write('The item has been added'), nl,
    menu.

option(e) :-
    write('Goodbye'), nl.
