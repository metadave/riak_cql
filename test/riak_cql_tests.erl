-module(riak_cql_tests).

-include_lib("eunit/include/eunit.hrl").

simple1_test() -> {ok, T} = riak_cql_parser:string("{counter foo inc 1}"),
                 Expected = [{update,
                              [{update,{"foo",riak_dt_pncounter},{increment,1}}]}],
                 ?assertEqual(Expected, T).
simple2_test() -> {ok, T} = riak_cql_parser:string("{counter foo inc 1,
                                                     counter bar dec 1}"),
                 Expected = [{update,
                              [{update,{"foo",riak_dt_pncounter},{increment,1}},
                               {update,{"bar",riak_dt_pncounter},{decrement,1}}]}],
                 ?assertEqual(Expected, T).

