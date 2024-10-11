# NOTES

% Die Datenstruktur ist eine Liste mit 8 Listen (0-7) in einer Liste
% Die inneren 8 Listen haben je 24 (0-23) Einträge
% Jeder Eintrag stellt ein ein Tile (Kachel) und Geländeeignschaft dar.
% Typisch für Tile based Games
% https://en.wikipedia.org/wiki/Tile-based_video_game

% Die Geographie Map beschreibt nur die Geländeeigenschaften.
% Diese Eigenschaften werden verwendet um bestimmte Werte zu 
% beeinflussen, oder textliche Beschreibungen vorzunehmen, 
% sobald die Spielfigur diese betritt. 
% Einige Kacheltypen sind nicht begehbar, andere erhöhen die
% chance angegriffen zu werden (F Forest) etc.

% THE MAP
%   
% nw n ne   24 * 8 Tiles
% w -|- e   Field of View: 1 Tile
% sw s se
%       
% 0: Plain, b: Bridge, c: Castle, e_: Entrances, führen in eine andere Map, 
% f: Forest, p: Path, q: Quest w: Water s: Swamp
% Chance of encounter: Plain: 0.3, Forest: 0.7, Path: 0.5 

% Noch werden die maps von Hand gemacht, Ziel ist es sie generativ zu erstellen. Roguelike!

% ETS System in Prolog?
% entity_at(player, [11,7]).
% entity_at(merchant,[10,5]).
% entity_stats(player, human, adventurer, [100, 100, 50, 0]).
% entity_stats(merchant, orc, sale[]).
% entity_quipment(player, [[sword, 10], [shield, 5], [helmet, 5], []]).
% enity_items(player, 10, [])


% definiert die begehbaren Tile Typen
walkable([0,f,p,s,en,eo,es,ew,edc,edr,edf]).