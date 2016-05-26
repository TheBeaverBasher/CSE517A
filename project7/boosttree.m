function BDT=boosttree(x,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data x with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% x  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree
%


%% fill in code here
[d, n] = size(x);

if (nargin < 4)
    maxdepth = 3;
    if (nargin < 3);
        nt = 100;
    end;
end;

weights = (1/n)*ones(1,n);
alphas = zeros(1,nt);

for i = 1:nt
    t = id3tree(x,y,maxdepth,weights);
    preds = evaltree(t,x);
    epsilon = sum(weights(preds~=y));
    if (epsilon > 0.5)
        break
    end;
    alphas(i) = 0.5*log((1-epsilon)/epsilon);
    
    
    
    for j = 1:n
        if (preds(j) ~= y(j))
            c = -1
        else
            c = 1
        end;
        
        weights(j) = (weights(j)*e^(-alphas(i)*c))/(sqrt(epsilon*(1-epsilon)));
    end;
    
end;

BDT = t;

