sum-up-numbers-simple([], 0).

sum-up-numbers-simple([HEAD|TAIL], TOTAL) :- 
    number(HEAD),
    sum-up-numbers-simple(TAIL, REMAINING),
    TOTAL is HEAD + REMAINING.

sum-up-numbers-simple([_|TAIL], TOTAL) :-
    sum-up-numbers-simple(TAIL, TOTAL).
