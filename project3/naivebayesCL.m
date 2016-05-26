function [w,b]=naivebayesCL(x,y);
% function [w,b]=naivebayesCL(x,y);
%
% Implementation of a Naive Bayes classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
% b : bias (scalar)
%

[posPXY, negPXY]=naivebayesPXY(x,y); 
[posPY,negPY]=naivebayesPY(x,y);
w=(log(posPXY)-log(negPXY));
b=log(posPY)-log(negPY);




