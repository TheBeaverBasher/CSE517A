function [pos,neg] = naivebayesPY(x,y)
% function [pos,neg] = naivebayesPY(x,y);
%
% Computation of P(Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% pos: probability p(y=1)
% neg: probability p(y=-1)
%

% add one all-ones positive and negative example

[~,n] = size(y);
pos=sum(y>0)/n;
neg=1-pos;

