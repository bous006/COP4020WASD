-module(barrier).
-export([start/1]).

start(NumP) -> spawn(fun() -> server(X) end).

server(NumP) -> receive
	{Pid, done} ->
		Pid ! {self(), ok},
		if NumP =:= 0 ->
			Pid ! {self(), continue};
			true -> ok
		end;
	{Pid, how_many_running} ->
		Pid ! {self(), number_running_is, NumP},
		server(NumP)
end,
server(NumP-1). 
