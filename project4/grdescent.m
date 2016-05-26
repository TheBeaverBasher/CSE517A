function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;

e = inf; 
prevLoss = inf;
w = w0; wprev = w0; 
prevLoss2 = inf;
t = 1; 
while (e > tolerance && t < maxiter)
    [loss, gradient] = func(w);
    if loss <= prevLoss
        wprev = w; 
        prevLoss2 = prevLoss;
        prevLoss = loss;
        w = w - stepsize.*gradient; 
        stepsize = 1.01*stepsize; 
        e = norm(gradient); 
        t = t+1;
    else
        w = wprev;
        prevLoss = prevLoss2;
        stepsize = 0.5*stepsize;
    end
end
