{father(A,B): call_father(A,B),person(A),person(B),older(A,B)}.
{call_father(A,B): father(A,B),person(A),person(B),older(A,B)}.
{person(A): father(A,B),call_father(A,B),person(B),older(A,B)}.
{person(B): father(A,B),call_father(A,B),person(A),older(A,B)}.
{older(A,B): father(A,B),call_father(A,B),person(A),person(B)}.
