eagle(eddy).
fly(X) :- bird(X), not neg_fly(X).
bird(X) :- eagle(X).
