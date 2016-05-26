function [loss,gradient]=ridge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w dx1 weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
[d,~]=size(xTr);

loss = (yTr-w'*xTr)*(yTr-w'*xTr)'+lambda*(w'*w);

gradient = (2*(w'*xTr-yTr)*xTr')'+2*lambda*w;