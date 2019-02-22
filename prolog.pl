sum-up-numbers-general([], 0).

sum-up-numbers-general([HEAD|TAIL], TARGET) :-
    is_list(HEAD),
    sum-up-numbers-general(TAIL, REMAINING),
    sum-up-numbers-general(HEAD, TOTALHEAD),
    TARGET is REMAINING + TOTALHEAD.

sum-up-numbers-general([HEAD|TAIL], TARGET) :-
    number(HEAD),
    sum-up-numbers-general(TAIL, REMAINING),
    TARGET is REMAINING + HEAD.

sum-up-numbers-general([_|TAIL], TARGET) :-
    sum-up-numbers-general(TAIL, TARGET).

% DONE

sum-up-numbers-simple([], 0).

sum-up-numbers-simple([HEAD|TAIL], TOTAL) :- 
    number(HEAD),
    sum-up-numbers-simple(TAIL, REMAINING),
    TOTAL is HEAD + REMAINING.

sum-up-numbers-simple([_|TAIL], TOTAL) :-
    sum-up-numbers-simple(TAIL, TOTAL).

%DONE

min-above-min([SINGLENUM], [], SINGLENUM) :-
    number(SINGLENUM).

min-above-min(LIST1, LIST2, TARGET) :-
    length(LIST2, 0),
    min-val-in-list(LIST1, TARGET).

min-above-min([HEAD|TAIL], LIST2, HEAD) :-
    number(HEAD),
    min-val-in-list(LIST2, MINLIST),
    MINLIST < HEAD,
    larger-num-than-current-given(TAIL, MINLIST, HEAD, HEAD).

min-above-min([_|TAIL], LIST2, TARGET) :-
    min-above-min(TAIL, LIST2, TARGET).


%HELPER TO FIND THE MINIMUM IN A LIST
min-val-in-list([SINGLENUM], SINGLENUM) :-
    number(SINGLENUM).

min-val-in-list([HEAD, TEMP|TAIL], MINIMUM) :-
    number(HEAD),
    number(TEMP),
    HEAD =< TEMP,
    min-val-in-list([HEAD|TAIL], MINIMUM).

min-val-in-list([HEAD, TEMP|TAIL], MINIMUM) :-
    number(HEAD),
    number(TEMP),
    TEMP < HEAD,
    min-val-in-list([TEMP|TAIL], MINIMUM).

min-val-in-list([HEAD, _|TAIL], MINIMUM) :-
    number(HEAD),
    min-val-in-list([HEAD|TAIL], MINIMUM).

min-val-in-list([_|TAIL], MINIMUM) :-
    min-val-in-list(TAIL, MINIMUM).


%HELPER TO FIND THE CURRENT BIGGEST NUMBER IS A LIST
%FINDS THE NUMBER BIGGER THAN THE CURRENT PROVIDED NUMBER
larger-num-than-current-given([], _, VAL, VAL). 

larger-num-than-current-given([HEAD|TAIL], CURRENT, VALUE, HEAD) :-
    number(HEAD),
    HEAD > CURRENT,
    HEAD < VALUE,
    larger-num-than-current-given(TAIL, CURRENT, HEAD, HEAD).

larger-num-than-current-given([_|TAIL], CURRENT, VALUE, TARGET) :-
    larger-num-than-current-given(TAIL, CURRENT, VALUE, TARGET).
