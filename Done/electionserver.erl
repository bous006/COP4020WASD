-module(electionserver).
-export([[start/0, vote/2, results/1]).

-spec start() -> pid().

start() -> spawn(?MODULE,electionserver,[[],[]]).

electionserver(VoteList,CList) -> receive
	{Pid, vote, Candidate} ->
		Pid ! ok,
		lists:member(Candidate,CList) of
			true ->
			(_) -> electionserver([{Candidate,1}|VoteList],[Candidate|CList])
		end;
	{Pid, get_res} ->
		Pid ! {self(),result, lists:sort(VoteList)},
		electionserver(VoteList,CList)
	end.

-spec vote(ES::pid(), Candidate::atom()) -> ok.
vote(SPid,Candidate) -> SPid ! {self(), vote, Candidate},
	receive ok -> ok end.

-spec results(ES::pid()) -> [{atom(), non_neg_integer()}].
results(SPid) -> SPid ! {self(), get_res},
	receive {Spid, result, ResList} -> ResList end.
