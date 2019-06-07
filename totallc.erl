-module(totallc).
-export([total/1]).
-import(shop, [cost/1]).

total(L) -> lists:sum([cost(Product) * Count || {Product, Count} <- L]).