function [poscond, negcond] = naivebayes(x,y,x1)
% function possi = naivebayes(x,y);
%
% Computation of log P(Y|X=x1) using Bayes Rule
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
% x1: input vector of d dimensions (dx1)
%
% Output:
% poscond: log conditional probability log P(Y = 1|X=x1)
% negcond: log conditional probability log P(Y = -1|X=x1)

[posPXY, negPXY]=naivebayesPXY(x,y);
[posPY,negPY]=naivebayesPY(x,y);
poscond=log(posPY*prod(posPXY.^x1));
negcond=log(negPY*prod(negPXY.^x1));

