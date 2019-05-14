green(X) :- person(X), couple(X, Y), child(Z), mother(Y, Z), not father(X, Z), unknown(X, Z).
father(X, Y) :- person(X), child(Y), call(Y, father, X).
person(tom).
couple(tom,alice).
child(kate).
mother(alice,kate).
call(kate, father, jason).
unknown(tom, kate).
