-module(mymisc).
-export([qsort/1, pythag/1, perms/1, max/2, run1/2]).
-export([clear_status/1, filter/2, filter_case/2]).
-export([odds_and_evens_acc/1, odds_and_evens_acc/3]).
-include("selfrecords.hrl"). 

qsort([]) -> [];
qsort([Pivot|T]) -> 
	qsort([X || X <- T, X < Pivot])
	++ [Pivot] ++
	qsort([X || X <- T, X >= Pivot]).


pythag(N) -> [
	{A, B, C} || 
	A <- lists:seq(1, N),
	B <- lists:seq(1, N),
	C <- lists:seq(1, N),
	A + B + C =< N,
	A*A + B*B =:= C*C
].

run1(X, Y) when X =:= dog; X =:= cat, is_integer(Y) -> X.

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].

max(X, Y) when X > Y -> X;
max(_, Y) -> Y.

clear_status(#todo{status=_, who=soo} = R) when is_record(R, todo) ->
	R#todo{status=finished}.

filter(P, [H|T]) -> filter1(P(H), H, P, T);
filter(P, []) when is_function(P) -> [].

filter1(true, H, P, T) -> [H|filter(P, T)];
filter1(false, _, P, T) -> filter(P, T).

filter_case(P, [H|T]) ->
	case P(H) of
		true -> [H|filter_case(P, T)];
		false -> filter_case(P, T)
	end;
filter_case(P, []) when is_function(P, 1) -> [].

odds_and_evens_acc(L) when is_list(L) -> 
	odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
	case (H rem 2) of 
		1 -> odds_and_evens_acc(T, [H|Odds], Evens);
		0 -> odds_and_evens_acc(T, Odds, [H|Evens])
	end;
odds_and_evens_acc([], Odds, Evens) ->
	{lists:reverse(Odds), lists:reverse(Evens)}.