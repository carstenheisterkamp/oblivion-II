:-dynamic(entity_prop/5).

translates_to(r,"^ ","mountains").
translates_to(f,"* ","forest"). 
translates_to(b,"B ", "bridge").
translates_to(0,"_ ","plains").
translates_to(p,"| ","path").
translates_to(s,", ","swamp").
translates_to(v,"@ ","village").
translates_to(w, "~ ","river").
translates_to(c, "# ","great walls").
translates_to(en,"E ","northern map exit").
translates_to(eo,"E ","southern map exit").
translates_to(es,"E ","eastern map exit").
translates_to(ew,"E ","western map exit").
translates_to(edc,"D ","castle entrance"). 
translates_to(edr,"D ","mine entrance").
translates_to(edf,"D ","forest entrance").
translates_to(player,"P ","you").
translates_to(enemy,"X ","enemy").

map(flatlands, 
    [[r,r,r,r,r,r,r,r,r,r,r,en,r,r,r,r,r,w,r,r,r,r,r,r],
     [ew,f,f,f,r,r,0,0,f,f,f,0,0,0,0,0,0,b,0,edc,c,c,c,r],
     [r,f,f,f,f,0,0,f,r,edr,r,p,0,0,0,0,0,w,0,v,v,c,c,r],
     [r,f,edf,f,0,0,f,r,r,p,p,r,r,0,r,0,0,0,w,0,v,s,r,r],
     [r,f,f,f,0,0,f,r,p,r,r,r,f,0,0,0,0,0,0,w,s,s,s,r],
     [r,f,f,0,0,0,0,f,0,r,f,0,0,0,0,0,0,0,s,s,w,s,s,eo],
     [r,f,f,f,f,0,0,0,0,0,0,0,0,0,0,0,0,s,s,s,s,w,s,r],
     [r,r,r,r,r,r,r,r,r,r,r,es,r,r,r,r,r,r,r,r,w,w,f,r]]
    ).

walkable([0,f,p,s,en,eo,es,ew,edc,edr,edf]).

tile_at(Area,X,Y,Tile) :- 
    map(Area,M),
    nth0(Y,M,Element),
    nth0(X,Element,Tile).

can_go_tile(Area,X,Y) :-
    tile_at(Area,X,Y,Tile),
    walkable(W),
    memberchk(Tile, W).

available_directions(Area,[X,Y], Dirs) :-
    findall(D,direction(Area,[X,Y],D), Dirs).

direction(Area,[X,Y],north) :-
    Y1 is Y-1,
    can_go_tile(Area,X,Y1).
direction(Area,[X,Y], northeast):-
    X1 is X+1,
    Y1 is Y-1,
    can_go_tile(Area,X1,Y1).
direction(Area,[X,Y],east):-
    X1 is X+1,
    can_go_tile(Area,X1,Y).
direction(Area,[X,Y], southeast):-
    X1 is X+1,
    Y1 is Y+1,
    can_go_tile(Area,X1,Y1).
direction(Area,[X,Y],south):-
    Y1 is Y+1,
    can_go_tile(Area,X,Y1).
direction(Area,[X,Y], southwest):-
    X1 is X-1,
    Y1 is Y+1,
    can_go_tile(Area,X1,Y1).
direction(Area,[X,Y],west):-
    X1 is X-1,
    can_go_tile(Area,X1,Y).
direction(Area,[X,Y], northwest):-
    X1 is X-1,
    Y1 is Y-1,
    can_go_tile(Area,X1,Y1).

% ----------------------------% ENTITY ----------------------------%
entity_prop(player, hp, 100, 100, 100).
entity_prop(player, attack, 10, 10, 10).
entity_prop(player, defense, 5, 5, 5).
entity_prop(player, level, 1, 1, 1).
entity_prop(player, exp, 0, 0, 0).
entity_prop(player, gold, 0, 0, 0).
entity_prop(player, position, [1,1]).

% ------------------------ % USER INTERFACE -----------------------%

print_row([]) :- nl.
print_row([H|T]) :-
    translates_to(H, Emoji, _),
    write(Emoji), 
    print_row(T).

print_map([]).
print_map([H|T]) :- 
    print_row(H),
    print_map(T).

print_area(A) :- 
    map(A, M), 
    print_map(M).

% -------------------------- % GAME LOGIC -----------------------%

oblivion :- 
    game_intro,
    game_init,
    game_loop. 

game_intro :- 
    writeln("Welcome to oblivion II").

game_init :-
    writeln("Initializing game").

game_loop :- 
    writeln("Start gameloop"). 

game_exit :- 
    writeln("Game Exit").

% -------------------------- % GAME STATE -----------------------%
