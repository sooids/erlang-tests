-module(selfattrs).
-compile(export_all).
-vsn(1234).
-author({soo}).
-purpose("test attrs").

fac(1) -> 1;
fac(N) -> N * fac(N - 1).


