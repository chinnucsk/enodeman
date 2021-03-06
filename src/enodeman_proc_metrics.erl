-module(enodeman_proc_metrics).

-export([
    get_descr/0,
    all_metrics/0,
    get_names/0
]).

all_metrics_ll() -> [
    { 
        registered_name,
        <<"Registered process name">>,
        {erlang, process_info, [registered_name]}, %XXX: doesn't work
        false
    },
    { 
        initial_call,
        <<"Initial call function">>,
        {erlang, process_info, [initial_call]}, %XXX: doesn't work
        false
    },
    { 
        memory,
        <<"Memory used">>,
        {erlang, process_info, [memory]}, %XXX: doesn't work
        true
    },
    { 
        reductions,
        <<"Reductions">>,
        {erlang, process_info, [reductions]}, %XXX: doesn't work
        true
    },
    { 
        message_queue_len,
        <<"Message queue len">>,
        {erlang, process_info, [message_queue_len]}, %XXX: doesn't work
        true
    }
].

all_metrics() -> 
    [ {I,U} || {I,_,U,_} <- all_metrics_ll() ].

get_descr() -> 
    [
        [{id, pid},{title, <<"process pid">>}, {api, false}] | 
        [ 
            [{id, I},{title, T},{api,A}] 
            || {I,T,_,A} <- all_metrics_ll()
        ]
    ].

get_names() ->
    [ I || {I,_,_,_} <- all_metrics_ll() ].

