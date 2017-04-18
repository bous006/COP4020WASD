-module(eventdetector).
-export([start/2, loop/3]).

start(InitialState, TransitionFun) ->
  spawn(?MODULE, loop, [[], InitialState, TransitionFun]).

loop(Observers, State, TFun) -> receive
	{Pid, add_me} -> Pid ! {added}, loop([Pid|Observers], State, TFun,);
	{Pid, add_yourself_to, EDPid} -> EDPid ! {self(), add_me},
		receive {added} -> Pid ! {added},
			loop(Observers, State, TFun);
	{Pid, state_value} -> Pid ! {value_is, State}, loop(Observers, State, TFun);
	Other -> {NewState, Event} = TFun(State,Other),
		case Event of
		none -> loop(Observers, NewState, TFun);
			(_) -> [X ! Event|| X <- Observers], loop(Observers, NewState, Fun)
		end
	end.
