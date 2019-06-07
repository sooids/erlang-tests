-module(selfcode).
-export([area/1]).

area({rectangle, W, H}) -> W * H;
area({circle, R}) -> R * R * 3.14159;
area({square, Side}) -> Side * Side.