fly(X) :- bird(X), not neg_fly(X).
neg_fly(X) :- penguin(X).
walk(X) :- neg_fly(X).
bird(tux).
penguin(tweety).
bird(tweety).
applicable(0,h(fly(X)),pB(bird(X)),nB(neg_fly(X))) :- bird(X),not neg_fly(X).
blocked(0,h(fly(X)),pB(bird(X)),nB(neg_fly(X))) :- not bird(X),var(X).
blocked(0,h(fly(X)),pB(bird(X)),nB(neg_fly(X))) :- neg_fly(X).
applicable(1,h(neg_fly(X)),pB(penguin(X))) :- penguin(X).
blocked(1,h(neg_fly(X)),pB(penguin(X))) :- not penguin(X),var(X).
applicable(2,h(walk(X)),pB(neg_fly(X))) :- neg_fly(X).
blocked(2,h(walk(X)),pB(neg_fly(X))) :- not neg_fly(X),var(X).
