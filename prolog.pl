sum-up-numbers-simple([], 0).

sum-up-numbers-simple([HEAD|TAIL], TOTAL) :- 
    number(HEAD),
    sum-up-numbers-simple(TAIL, REMAINDER),
    TOTAL is HEAD + REMAINDER.

sum-up-numbers-simple([_|TAIL], TOTAL) :-
    sum-up-numbers-simple(TAIL, TOTAL).
