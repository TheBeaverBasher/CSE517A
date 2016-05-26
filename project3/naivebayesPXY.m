function [posprob,negprob] = naivebayesPXY(x,y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

[d,n] = size(x);
%%numerator:
yexpand=repmat(y,d,1);
xycwise=x.*yexpand;
posN=sum(xycwise>=0,2);
negN=sum(xycwise<=0,2);

  
%%denominator
posD=sum(posN);
negD=sum(negN);

%%final
posprob=posN/posD;
negprob=negN/negD;
