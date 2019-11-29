% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

% Your program goes here
x_is_oneAway(A,B):-
    Z #= mod(B-1, 8),
    Z #= (mod(A-1, 8) + 1).

x_is_oneAway(A,B):-
    Z #= mod(B-1, 8),
    Z #= (mod(A-1, 8) - 1).

x_is_twoAway(A,B):-
  	Z #= mod(B-1, 8),
    Z #= (mod(A-1, 8) + 2).

x_is_twoAway(A,B):-
    Z #= mod(B-1, 8),
    Z #= (mod(A-1, 8) - 2).

y_is_one(A,B):-
    Z #= B div 8,
    Z #= (A div 8 + 1).
    
y_is_one(A,B):-
    Z #= B div 8,
    Z #= (A div 8 - 1).

y_is_two(A,B):-
    Z #= B div 8,
    Z #= (A div 8 + 2).
    
y_is_two(A,B):-
    Z #= B div 8,
    Z #= (A div 8 - 2).

jump(A,B):-
	x_is_oneAway(A,B),
	y_is_two(A,B).

jump(A,B):-
    x_is_twoAway(A,B),
    y_is_one(A,B).

/** <examples>
?- jump(1,X).
*/
