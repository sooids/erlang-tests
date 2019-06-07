-module(self_try).
-export([generate_exception/1, demo3/0]).

generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> erlang:error(a).

demo3() ->
	try generate_exception(5)
	catch
		error:X:Stacktrace ->
			{X, Stacktrace}
	end.
