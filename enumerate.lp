{abnormal(A): father(A,B),person(A),child(B)}.
{father(A,B): abnormal(A),person(A),child(B)}.
{person(A): abnormal(A),father(A,B),child(B)}.
{child(B): abnormal(A),father(A,B),person(A)}.
{father(A,B): call_father(B,A),person(A),child(B)}.
{call_father(B,A): father(A,B),person(A),child(B)}.
{person(A): father(A,B),call_father(B,A),child(B)}.
{child(B): father(A,B),call_father(B,A),person(A)}.
