/**
QUESTION 2
**/

%For list with no element which results in a sum of 0
sum-up-numbers-general([], 0).

%Case if the first element of the list is a list, we recursively go inside the nested list and apply this same function again
sum-up-numbers-general([HEAD|TAIL], TARGET) :-
    is_list(HEAD),
    sum-up-numbers-general(TAIL, REMAINING),
    sum-up-numbers-general(HEAD, TOTALHEAD),
    TARGET is REMAINING + TOTALHEAD.

%Case if the first element of the list is a number i.e valid case
sum-up-numbers-general([HEAD|TAIL], TARGET) :-
    number(HEAD),
    sum-up-numbers-general(TAIL, REMAINING),
    TARGET is REMAINING + HEAD.

%Case if first element of the list not a number
sum-up-numbers-general([_|TAIL], TARGET) :-
    sum-up-numbers-general(TAIL, TARGET).


/****************************************************************************************************************************/

/**
QUESTION 1
**/

%For list with no element which results in a sum of 0
sum-up-numbers-simple([], 0).

%Case if the first element of the list is a number i.e valid case
sum-up-numbers-simple([HEAD|TAIL], TOTAL) :- 
    number(HEAD),
    sum-up-numbers-simple(TAIL, REMAINING),
    TOTAL is HEAD + REMAINING.

%Case if first element of the list not a number
sum-up-numbers-simple([_|TAIL], TOTAL) :-
    sum-up-numbers-simple(TAIL, TOTAL).


/****************************************************************************************************************************/

/**
QUESTION 3
**/

%Case if the first list has only one element
min-above-min([SINGLENUM], [], SINGLENUM) :-
    number(SINGLENUM).

%Case when the second list is empty
min-above-min(LIST1, LIST2, TARGET) :-
    length(LIST2, 0), %Check for the second list being empty
    min-val-in-list(LIST1, TARGET). %return the minimum element of list1 using helper function

%Case when the first element is a number
%also, the first element is greater than the minimum value we have
%makes call to a function to find the number that is larger than the current number
min-above-min([HEAD|TAIL], LIST2, HEAD) :-
    number(HEAD),
    min-val-in-list(LIST2, MINLIST),
    MINLIST < HEAD,
    larger-num-than-current-given(TAIL, MINLIST, HEAD, HEAD).

%Other cases
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


/****************************************************************************************************************************/

/**
QUESTION 4
**/

%Base case
common-unique-elements([], _, []).

common-unique-elements([HEAD|TAIL], LIST2, [HEAD|TAIL2]) :- 
    not(check-for-nested(HEAD, TAIL)),
    check-for-nested(HEAD, LIST2),
    common-unique-elements(TAIL, LIST2, TAIL2).

common-unique-elements([HEAD|TAIL], LIST2, JOINLIST) :-
    is_list(HEAD),
    common-unique-elements(HEAD, LIST2, NESTEDLIST),
    common-unique-elements(TAIL, LIST2, TAIL2),
    append(NESTEDLIST, TAIL2, JOINLIST). 

common-unique-elements([_|TAIL], LIST2, TAIL2) :-   
    common-unique-elements(TAIL, LIST2, TAIL2).

check-for-nested(SINGLE, [SINGLE|_]).

check-for-nested(NESTED, [VAL|LIST]) :-
    is_list(VAL),
    check-for-nested(NESTED, VAL);
    check-for-nested(NESTED,LIST).  

check-for-nested(NESTED, [_|LIST]) :-
    check-for-nested(NESTED, LIST).
