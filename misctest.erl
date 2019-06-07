-module(misctest).
-export([sum/1, map/2]).

sum(L) -> sum(L, 0).

sum([], N) -> N;
sum([H|T], N) -> sum(T, H+N).

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F, T)].
