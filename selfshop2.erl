-module(selfshop2).
-export([total/1]).
-import(lists, [map/2, sum/1]).

total(L) -> sum(map(fun({What, N}) -> selfshop:cost(What) * N end, L)).