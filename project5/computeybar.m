function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);

mu1 = 0;
mu2 = OFFSET;
sigma = 1;

p11 = normpdf(xTe(1,:),mu1,sigma);
p12 = normpdf(xTe(2,:),mu1,sigma);
p21 = normpdf(xTe(1,:),mu2,sigma);
p22 = normpdf(xTe(2,:),mu2,sigma);

p1 = p11.*p12; %(mvnpdf(xTe', mu1', sigma))';
p2 = p21.*p22; %(mvnpdf(xTe', mu2', sigma))';

ybar = 1 + p2./(p1 + p2);


