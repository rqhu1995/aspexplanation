abnormal(A) :- not father(A, B), person(A), child(B).
father(A, B):- call_father(B, A),person(A), child(B).
call_father("jack", "peter").
child("jack").
person("peter").
person("sam").
