fly(X) :- bird(X), not neg_fly(X).
neg_fly(X) :- penguin(X).
walk(X) :- neg_fly(X).
bird(tux).
penguin(tweety).
bird(tweety).
