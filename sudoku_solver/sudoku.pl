

sudoku(Rows) :-
    transpose(Rows, Columns),
    [R1, R2, R3, R4] = Rows,
    %[R1, R2, R3, R4, R5, R6, R7, R8, R9] = Rows,
    checkMember(Rows, [1,2,3,4]),
    %checkMember(Rows, [1,2,3,4,5,6,7,8,9]),
    /*
    boxCheck(R1, R2, R3),
    boxCheck(R4, R5, R6),
    boxCheck(R7, R8, R9),
    */
    boxCheck(R1, R2),
    boxCheck(R3, R4),
    rowCheck(Rows),
    rowCheck(Columns).

boxCheck([I1, I2|T1], [I3, I4|T2]):-
    rowCheck2([I1,I2,I3,I4]),
    boxCheck(T1, T2).
boxCheck([],[]).

boxCheck([I1, I2, I3 | T1],
         [I4, I5, I6 | T2],
         [I7, I8, I9 | T3]):-
    rowCheck2([I1, I2, I3, I4, I5, I6, I7, I8, I9]),
    boxCheck(T1, T2, T3).
boxCheck([], [], []).

checkMember([R|M], V):-
    checkMember2(R, V),
    checkMember(M, V).
checkMember([], _).

checkMember2([H|T], V):-
    member(H, V),
    checkMember2(T, V).
checkMember2([], _).

rowCheck([H|T]):-
    rowCheck2(H),
    rowCheck(T).
rowCheck([]).

rowCheck2([H|T]):-
    notmember(H, T),
    rowCheck2(T).
rowCheck2([]).

notmember(X, [H|T]):-
    X =\= H,
    notmember(X, T).
notmember(_, []).


%notmember(1, [2,3,4,5]) -> true
%notmember(3, [2,3,4,5]) -> false

reverse([], A, A).
reverse([H | T], A, R) :-
	reverse(T, [H | A], R).

reverse(A, R):-
	reverse( A, [], R).

transpose(M, Ans):-
    [[H|Rs]|RM] = M,
    transposeFirstCol(RM, TR, RestofM),
    transpose(RestofM, TM),
    transposeFirstRow(Rs, TM, T),
    Ans = [[H|TR] | T].
transpose([], []).
    

transposeFirstRow([H|T], [R|TM], [[H|R]|X]):-
    transposeFirstRow(T, TM, X).
transposeFirstRow([], [], []).
    

transposeFirstCol([R|T], [H|X], [RT|RM]):-
    [H|RT] = R,
    transposeFirstCol(T, X, RM).
transposeFirstCol([], [], []).
    
    
