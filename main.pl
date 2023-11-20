/******************************************************************************

                            Online Prolog Compiler.
                Code, Compile, Run and Debug Prolog program online.
Write your code in this editor and press "Run" button to execute it.

*******************************************************************************/

concat([], L, L) :- !.

concat(L1, L2, L) :-
    append(L1, L2, L).
    

% Base case: The reverse of an empty list is an empty list.
renverse([], []).

% Recursive case: Remove the first element of the list, reverse the rest,
% and then append the first element at the end.
renverse([Head|Tail], Reversed) :-
    renverse(Tail, ReversedTail),
    append(ReversedTail, [Head], Reversed).
    

% Définissez un prédicat palindrome(L), qui indique si L est une liste
% palindromique, c'est-à-dire que le premier élément est égal au dernier, le
% deuxième à l'avant-dernier, etc.
palindrome(L) :-
    renverse(L,L).
    
    
% Définissez un prédicat pair(X) qui dit si un nombre est pair.
pair(Nb) :-
    Nb mod 2 =:= 0.



% Cas de base : la somme des 0 premiers entiers est 0.
somme(0, 0).


% Cas récursif : somme(N, X) est vrai si X est la somme de N et de la somme des entiers de 1 à N-1.
somme(N, X) :-
    N > 0, % Assurez-vous que N est positif
    N1 is N - 1, % N1 est N moins 1
    somme(N1, X1), % Calcul récursif de la somme des entiers jusqu'à N1
    X is N + X1. % X est la somme de N et X1


% Définissez le prédicat maximum1(X,Y,Z) qui prend 3 paramètres et 
% détermine le maximum entre deux nombres X et Y (les 2 premiers paramètres) 
% et le retourne dans le 3eme paramètre.
maximal(X,Y,X) :- X>=Y.
maximal(X,Y,Y) :- Y>X.



% Définissez le prédicat factoriel(X,Y), qui calcul le factoriel de X et met le résultat dans Y.
factoriel(0,1).
% Cas récursif : le factoriel de X est X multiplié par le factoriel de X-1.
factoriel(X, Y) :-
    X > 0, % Assurez-vous que X est positif
    X1 is X - 1, % X1 est X moins 1
    factoriel(X1, Y1), % Calcul récursif du factoriel de X1
    Y is X * Y1. % Y est le produit de X et Y1
    

fibo(0,0).
fibo(1,1).
fibo(N,R) :- 
    N>1, 
    N1 is N-1, 
    N2 is N-2, 
    fibo(N1,R1), 
    fibo(N2,R2), 
    R is R1 + R2.
    

nombresPairs(0).
nombresPairs(X) :- nombresPairs(X2), X is X2+2.

    
    
    
    




main:-
    concat([1,2,3], L, [1,2,3,4,5]),
    write(L),
    nl, % Ajoute une nouvelle ligne pour la lisibilité
    concat([1,2],[2,1], L1),
    write(L1),
    nl,
    concat([1,2,3], [4,5], L2),
    nl,
    write(L2),
    nl,
    concat([], [], L3),
    write(L3),
    renverse([1,2],[2,1]),
    renverse([alice], [alice]),
    %renverse([alpha, beta], [alpha, beta])
    renverse([], []),
    %palindrome([alice]),
    pair(2),
    nl,
    somme(5,S),
    write(S),
    nl,
    factoriel(5,D),
    write(D),
    nl,
    nombresPairs(X),
    write(X).
    
    

:- main.
