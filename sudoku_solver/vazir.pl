
vazir(Vazirs):-
    size(Vazirs, 9),
    %checkBounds(Vazirs),
    rowCheck(Vazirs),
    % ---
    printVazir(Vazirs).

size([], 0).
size([[R, _]|T], S):-
    size(T, S2),
    S is S2 + 1,
    R is 10 - S.

checkBounds2([X, Y]):-
    member(X, [1,2,3,4,5,6,7,8,9]),
    member(Y, [1,2,3,4,5,6,7,8,9]).

checkBounds([H|T]):-
    checkBounds2(H),
    checkBounds(T).
checkBounds([]).

rowCheck([H|T]):-
    rowCheck2(H, T),
    rowCheck(T).
rowCheck([]).

rowCheck2(V, [H|T]):-
    checkBounds2(V),
    checkBounds2(H),
    [XV, YV] = V,
    [XH, YH] = H,
    XV =\= XH,
    YV =\= YH,

    R1V is XV - YV,
    R1H is XH - YH,
    R2V is XV + YV,
    R2H is XH + YH,

    R1V =\= R1H,
    R2V =\= R2H,
    rowCheck2(V, T).
rowCheck2(_, []).

printVazir([H|T]):-
    [_, Y] = H,
    printRow(Y),
    K is 9 - Y,
    printRes(K),
    nl,
    printVazir(T).
printVazir([]).

printRow(Y):-
    Y is 1, write(q);
    Y > 1, write('_'), K is Y-1, printRow(K).
printRes(Y):-
    Y > 0, write('_'), K is Y-1, printRes(K).
printRes(0).
