-module(selfshop1).
-export([total/1]).

total([{What, N}|T]) -> selfshop:cost(What) * N + total(T);
total([])			 -> 0.	