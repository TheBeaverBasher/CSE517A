function [loss,gradient,preds]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
[~,n]=size(xTr);

loss = sum(max(1-yTr.*(w'*xTr),zeros(1,n))) + lambda*(w'*w);

y1 = yTr; x1 = xTr;
y1(yTr.*(w'*xTr)>1) = 0;
x1(:,yTr.*(w'*xTr)>1) = 0;
grad = -x1*y1';
gradient = sum(grad,2) + 2*lambda*w;