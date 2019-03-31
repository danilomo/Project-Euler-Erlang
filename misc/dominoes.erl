-module(dominoes).
-compile(export_all).

shuffle(L) ->
    [Y||{_,Y} <- lists:sort([ {rand:uniform(), N} || N <- L])].

init_board() ->
    Board = [ {I,J} || I <- lists:seq(0,6), J <- lists:seq(0,I) ],
    shuffle(Board).

insert_piece_r(Board, {Upper, Lower}) ->
    BoardPiece = queue:get_r(Board),
    case BoardPiece of
        {_, Upper} ->
            {ok, queue:in({Upper, Lower}, Board)};
        {_, Lower} ->
            {ok, queue:in({Lower, Upper}, Board)};
        _ ->
            {not_ok, Board}
    end.

insert_piece_l(Board, {Upper, Lower}) ->
    BoardPiece = queue:get(Board),
    case BoardPiece of
        {Upper, _} ->
            {ok, queue:in_r({Lower, Upper}, Board)};
        {Lower, _} ->
            {ok, queue:in_r({Upper, Lower}, Board)};
        _ ->
            {not_ok, Board}
    end.

make_move(Board, {Move, Piece}) ->
    case Move of
        right ->
            insert_piece_r(Board, Piece);
        left ->
            insert_piece_l(Board, Piece);
        _ ->
            {not_ok, Board}
    end.

game_server(Board) ->
    receive
        {Sender, Move} ->
            Sender ! make_move(Board, Move);
        _ -> not_ok
    end.

start_server() ->
    spawn(?MODULE, game_server, [queue:from_list([{6,6}])]).
