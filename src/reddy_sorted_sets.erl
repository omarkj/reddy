-module(reddy_sorted_sets).
-author('Bradford Winfrey <bradford.winfrey@gmail.com>').

-include("reddy.hrl").
-include("reddy_ops.hrl").

-export([zadd/4,
         zadd_/5,
         zrem/3,
         zrem_/4,
         zcard/2,
         zcard_/3,
         zcount/4,
         zcount_/5,
         zincrby/4,
         zincrby_/5,
         zrank/3,
         zrank_/4,
         zrevrank/3,
         zrevrank_/4,
         zrange/4,
         zrange_/5,
         zrange/5,
         zrange_/6,
         zrevrange/4,
         zrevrange_/5,
         zrevrange/5,
         zrevrange_/6,
         zremrangebyrank/4,
         zremrangebyrank_/5,
         zscore/3,
         zscore_/4,
         zremrangebyscore/4,
         zremrangebyscore_/5,
         zrangebyscore/4,
         zrangebyscore_/5,
         zrangebyscore/5,
         zrangebyscore_/6,
         zrevrangebyscore/4,
         zrevrangebyscore_/5,
         zrevrangebyscore/5,
         zrevrangebyscore_/6,
         zinterstore/4,
         zinterstore_/5,
         zinterstore/5,
         zinterstore_/6]).

zadd(Conn, Key, Score, Member) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZADD, [Key, Score, Member]);
zadd(Pool, Key, Score, Member) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZADD, [Key, Score, Member]).

zadd_(Conn, Key, Score, Member, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZADD, [Key, Score, Member], WantsReturn);
zadd_(Pool, Key, Score, Member, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zadd_, [Key, Score, Member, WantsReturn]).

zrem(Conn, Key, Member) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZREM, [Key, Member]);
zrem(Pool, Key, Member) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZADD, [Key, Member]).

zrem_(Conn, Key, Member, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZREM, [Key, Member], WantsReturn);
zrem_(Pool, Key, Member, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zrem_, [Key, Member, WantsReturn]).

zcard(Conn, Key) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZCARD, [Key]);
zcard(Pool, Key) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZCARD, [Key]).

zcard_(Conn, Key, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZCARD, [Key], WantsReturn);
zcard_(Pool, Key, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zcard_, [Key, WantsReturn]).

zcount(Conn, Key, Min, Max) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZCOUNT, [Key, Min, Max]);
zcount(Pool, Key, Min, Max) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZCOUNT, [Key, Min, Max]).

zcount_(Conn, Key, Min, Max, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZCOUNT, [Key, Min, Max], WantsReturn);
zcount_(Pool, Key, Min, Max, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zcount_, [Key, Min, Max, WantsReturn]).

zincrby(Conn, Key, Increment, Member) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZINCRBY, [Key, Increment, Member]);
zincrby(Pool, Key, Increment, Member) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZINCRBY, [Key, Increment, Member]).

zincrby_(Conn, Key, Increment, Member, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZINCRBY, [Key, Increment, Member], WantsReturn);
zincrby_(Pool, Key, Increment, Member, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zincrby_, [Key, Increment, Member, WantsReturn]).

zrank(Conn, Key, Member) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZRANK, [Key, Member]);
zrank(Pool, Key, Member) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZRANK, [Key, Member]).

zrank_(Conn, Key, Member, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZRANK, [Key, Member], WantsReturn);
zrank_(Pool, Key, Member, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zrank_, [Key, Member, WantsReturn]).

zrevrank(Conn, Key, Member) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZREVRANK, [Key, Member]);
zrevrank(Pool, Key, Member) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZREVRANK, [Key, Member]).

zrevrank_(Conn, Key, Member, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZREVRANK, [Key, Member], WantsReturn);
zrevrank_(Pool, Key, Member, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zrevrank_, [Key, Member, WantsReturn]).

zrange(Conn, Key, Start, End) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZRANGE, [Key, Start, End]);
zrange(Pool, Key, Start, End) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZRANGE, [Key, Start, End]).

zrange_(Conn, Key, Start, End, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZRANGE, [Key, Start, End], WantsReturn);
zrange_(Pool, Key, Start, End, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zrange_, [Key, Start, End, WantsReturn]).

zrange(Conn, Key, Start, End, Options) when is_record(Options, reddy_optional_args) andalso is_pid(Conn) ->
  Args = [Key, Start, End] ++ reddy_protocol:get_optional_args(Options),
  reddy_conn:sync(Conn, ?ZRANGE, Args);
zrange(Pool, Key, Start, End, Options) when is_record(Options, reddy_optional_args) andalso is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZRANGE, [Key, Start, End, Options]).

zrange_(Conn, Key, Start, End, Options, WantsReturn) when is_record(Options, reddy_optional_args) andalso is_pid(Conn) ->
  Args = [Key, Start, End] ++ reddy_protocol:get_optional_args(Options),
  reddy_conn:async(Conn, ?ZRANGE, Args, WantsReturn);
zrange_(Pool, Key, Start, End, Options, WantsReturn) when is_record(Options, reddy_optional_args) andalso is_atom(Pool) ->
  ?WITH_POOL(Pool, zrange_, [Key, Start, End, Options, WantsReturn]).

zrevrange(Conn, Key, Start, End) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZREVRANGE, [Key, Start, End]);
zrevrange(Pool, Key, Start, End) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZREVRANGE, [Key, Start, End]).

zrevrange_(Conn, Key, Start, End, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZREVRANGE, [Key, Start, End], WantsReturn);
zrevrange_(Pool, Key, Start, End, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zrevrange_, [Key, Start, End, WantsReturn]).

zrevrange(Conn, Key, Start, End, Options) when is_record(Options, reddy_optional_args) andalso is_pid(Conn) ->
  Args = [Key, Start, End] ++ reddy_protocol:get_optional_args(Options),
  reddy_conn:sync(Conn, ?ZREVRANGE, Args);
zrevrange(Pool, Key, Start, End, Options) when is_record(Options, reddy_optional_args) andalso is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZREVRANGE, [Key, Start, End, Options]).

zrevrange_(Conn, Key, Start, End, Options, WantsReturn) when is_record(Options, reddy_optional_args) andalso is_pid(Conn) ->
  Args = [Key, Start, End] ++ reddy_protocol:get_optional_args(Options),
  reddy_conn:async(Conn, ?ZREVRANGE, Args, WantsReturn);
zrevrange_(Pool, Key, Start, End, Options, WantsReturn) when is_record(Options, reddy_optional_args) andalso is_atom(Pool) ->
  ?WITH_POOL(Pool, zrevrange_, [Key, Start, End, Options, WantsReturn]).

zremrangebyrank(Conn, Key, Start, Stop) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZREMRANGEBYRANK, [Key, Start, Stop]);
zremrangebyrank(Pool, Key, Start, Stop) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZREMRANGEBYRANK, [Key, Start, Stop]).

zremrangebyrank_(Conn, Key, Start, Stop, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZREMRANGEBYRANK, [Key, Start, Stop], WantsReturn);
zremrangebyrank_(Pool, Key, Start, Stop, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zremrangebyrank_, [Key, Start, Stop, WantsReturn]).

zscore(Conn, Key, Member) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZSCORE, [Key, Member]);
zscore(Pool, Key, Member) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZSCORE, [Key, Member]).

zscore_(Conn, Key, Member, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZSCORE, [Key, Member], WantsReturn);
zscore_(Pool, Key, Member, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zscore_, [Key, Member, WantsReturn]).

zremrangebyscore(Conn, Key, Min, Max) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZREMRANGEBYSCORE, [Key, Min, Max]);
zremrangebyscore(Pool, Key, Min, Max) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZREMRANGEBYSCORE, [Key, Min, Max]).

zremrangebyscore_(Conn, Key, Min, Max, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZREMRANGEBYSCORE, [Key, Min, Max], WantsReturn);
zremrangebyscore_(Pool, Key, Min, Max, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zremrangebyscore_, [Key, Min, Max, WantsReturn]).

zrangebyscore(Conn, Key, Min, Max) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZRANGEBYSCORE, [Key, Min, Max]);
zrangebyscore(Pool, Key, Min, Max) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZRANGEBYSCORE, [Key, Min, Max]).

zrangebyscore_(Conn, Key, Min, Max, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZRANGEBYSCORE, [Key, Min, Max], WantsReturn);
zrangebyscore_(Pool, Key, Min, Max, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zrangebyscore_, [Key, Min, Max, WantsReturn]).

zrangebyscore(Conn, Key, Min, Max, Options) when is_record(Options, reddy_optional_args) andalso is_pid(Conn) ->
  Args = [Key, Min, Max] ++ reddy_protocol:get_optional_args(Options),
  reddy_conn:sync(Conn, ?ZRANGEBYSCORE, Args);
zrangebyscore(Pool, Key, Min, Max, Options) when is_record(Options, reddy_optional_args) andalso is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZRANGEBYSCORE, [Key, Min, Max, Options]).

zrangebyscore_(Conn, Key, Min, Max, Options, WantsReturn) when is_record(Options, reddy_optional_args) andalso is_pid(Conn) ->
  Args = [Key, Min, Max] ++ reddy_protocol:get_optional_args(Options),
  reddy_conn:async(Conn, ?ZRANGEBYSCORE, Args, WantsReturn);
zrangebyscore_(Pool, Key, Min, Max, Options, WantsReturn) when is_record(Options, reddy_optional_args) andalso is_atom(Pool) ->
  ?WITH_POOL(Pool, zrangebyscore_, [Key, Min, Max, Options, WantsReturn]).

zrevrangebyscore(Conn, Key, Min, Max) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZREVRANGEBYSCORE, [Key, Min, Max]);
zrevrangebyscore(Pool, Key, Min, Max) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZREVRANGEBYSCORE, [Key, Min, Max]).

zrevrangebyscore_(Conn, Key, Min, Max, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZREVRANGEBYSCORE, [Key, Min, Max], WantsReturn);
zrevrangebyscore_(Pool, Key, Min, Max, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zrevrangebyscore_, [Key, Min, Max, WantsReturn]).

zrevrangebyscore(Conn, Key, Min, Max, Options) when is_record(Options, reddy_optional_args) andalso is_pid(Conn) ->
  Args = [Key, Min, Max] ++ reddy_protocol:get_optional_args(Options),
  reddy_conn:sync(Conn, ?ZREVRANGEBYSCORE, Args);
zrevrangebyscore(Pool, Key, Min, Max, Options) when is_record(Options, reddy_optional_args) andalso is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZREVRANGEBYSCORE, [Key, Min, Max, Options]).

zrevrangebyscore_(Conn, Key, Min, Max, Options, WantsReturn) when is_record(Options, reddy_optional_args) andalso is_pid(Conn) ->
  Args = [Key, Min, Max] ++ reddy_protocol:get_optional_args(Options),
  reddy_conn:async(Conn, ?ZREVRANGEBYSCORE, Args, WantsReturn);
zrevrangebyscore_(Pool, Key, Min, Max, Options, WantsReturn) when is_record(Options, reddy_optional_args) andalso is_atom(Pool) ->
  ?WITH_POOL(Pool, zrevrangebyscore_, [Key, Min, Max, Options, WantsReturn]).

zinterstore(Conn, Destination, NumKeys, Keys) when is_pid(Conn) ->
  reddy_conn:sync(Conn, ?ZINTERSTORE, [Destination, NumKeys, Keys]);
zinterstore(Pool, Destination, NumKeys, Keys) when is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZINTERSTORE, [Destination, NumKeys, Keys]).

zinterstore_(Conn, Destination, NumKeys, Keys, WantsReturn) when is_pid(Conn) ->
  reddy_conn:async(Conn, ?ZINTERSTORE, [Destination, NumKeys, Keys], WantsReturn);
zinterstore_(Pool, Destination, NumKeys, Keys, WantsReturn) when is_atom(Pool) ->
  ?WITH_POOL(Pool, zinterstore_, [Destination, NumKeys, Keys, WantsReturn]).

zinterstore(Conn, Destination, NumKeys, Keys, Options) when is_record(Options, reddy_optional_args) andalso is_pid(Conn) ->
  Args = [Destination, NumKeys, Keys] ++ reddy_protocol:get_optional_args(Options),
  reddy_conn:sync(Conn, ?ZINTERSTORE, Args);
zinterstore(Pool, Destination, NumKeys, Keys, Options) when is_record(Options, reddy_optional_args) andalso is_atom(Pool) ->
  ?WITH_POOL(Pool, ?ZINTERSTORE, [Destination, NumKeys, Keys, Options]).

zinterstore_(Conn, Destination, NumKeys, Keys, Options, WantsReturn) when is_record(Options, reddy_optional_args) andalso is_pid(Conn) ->
  Args = [Destination, NumKeys, Keys] ++ reddy_protocol:get_optional_args(Options),
  reddy_conn:aync(Conn, ?ZINTERSTORE, Args, WantsReturn);
zinterstore_(Pool, Destination, NumKeys, Keys, Options, WantsReturn) when is_record(Options, reddy_optional_args) andalso is_atom(Pool) ->
  ?WITH_POOL(Pool, zinterstore_, [Destination, NumKeys, Keys, Options, WantsReturn]).

