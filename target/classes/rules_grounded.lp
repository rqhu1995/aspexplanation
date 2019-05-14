person(tom).
couple(tom,alice).
child(kate).
mother(alice,kate).
call(kate,father,jason).
unknown(tom,kate).
green(tom):-unknown(tom,kate),mother(alice,kate),child(kate),couple(tom,alice),person(tom),not father(tom,kate).
