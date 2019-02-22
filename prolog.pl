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

;;;;;;;

sum-up-numbers-simple([], 0).

sum-up-numbers-simple([HEAD|TAIL], TOTAL) :- 
    number(HEAD),
    sum-up-numbers-simple(TAIL, REMAINING),
    TOTAL is HEAD + REMAINING.

sum-up-numbers-simple([_|TAIL], TOTAL) :-
    sum-up-numbers-simple(TAIL, TOTAL).
