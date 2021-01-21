% INSERT NAMES AND EMAIL ADDRESSES OF YOUR GROUP MEMBERS:
% Name: Safial Islam Ayon Email: safial.islam.ayon@uni-potsdam.de
% Name: Nazrin Akther Nira Email: nira@uni-potsdam.de

% Size of subgrid
#const s=3.

% Initialize the subrid size and number of 1 to 9
subgrid_size(1..s*s,1..s*s).
v(1..s*s).

% Initial all numbers in the sudoku
initial(X,Y,(((X-1)/s)*s + (Y-1)/s),V) :- initial(X,Y,V).
sudoku(X,Y,S,V) :- initial(X,Y,S,V).

% Initial the remaining places
remaining_grid(X,Y) :- subgrid_size(X,Y), not initial(X,Y,_,_).
remaining_grid(X,Y,(((X-1)/s)*s + (Y-1)/s)) :- remaining_grid(X,Y).

% In sudoku one number is take place in a row or a coloum or a subgrid only one
{sudoku(X,Y,S,V): v(V), not initial(X,_,_,V), not initial(_,Y,_,V), not initial(_,_,S,V)} = 1 :- remaining_grid(X,Y,S).

% This number are not correct so not take this 
:-#sum{1,X,V:sudoku(X,Y,S,V)} != s*s, X=(1..s*s).
:-#sum{1,Y,V:sudoku(X,Y,S,V)} != s*s, Y=(1..s*s).
:-#sum{1,S,V:sudoku(X,Y,S,V)} != s*s, S=(0..s*s-1).

% Initial the final result
sudoku(X,Y,V) :- sudoku(X,Y,S,V).

% print the result
#show sudoku/3.
