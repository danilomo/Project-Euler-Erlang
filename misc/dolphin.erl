-module(dolphin).
-compile(export_all).

dolphin() ->
    receive
        {From, do_a_flip} ->
            From ! "How about no?",
            dolphin();
        {From, fish} ->
            From ! "So long and thanks for all the fish!";
        _ ->
            io:format("Heh, we're smarter than you humans.~n"),
            dolphin()
    end.
