fly(tux) :- bird(tux),not neg_fly(tux).
fly(tweety) :- bird(tweety),not neg_fly(tweety).
walk(tweety) :- neg_fly(tweety).
neg_fly(tweety) :- penguin(tweety).
walk(tux) :- neg_fly(tux).
neg_fly(tux) :- penguin(tux).
bird(tux).
penguin(tweety).
bird(tweety).
