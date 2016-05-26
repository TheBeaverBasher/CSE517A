function T=prunetree(T,xTe,y)
% function T=prunetree(T,xTe,y)
%
% Prunes a tree to minimal size such that performance on data xTe,y does not
% suffer.
%
% Input:
% T = tree
% xTe = validation data x (dxn matrix)
% y = labels (1xn matrix)
%
% Output:
% T = pruned tree
%

%% fill in code here

[d, n] = size(xTe);

tempT = T;

for i = 1:n
    tempPreds = evaltree(tempT, xTe);
    x = xTe(:,i);
    t = tempT(:,1);
    
    
    while t(4) ~= 0
        if (x(t(2)) <= t(3))
            t = tempT(:,t(4));
        else
            t = tempT(:,t(5));
        end;
    end;
    
    tempT2 = tempT;
    tempT2(4,t(6)) = 0;
    tempT2(5,t(6)) = 0;
    temp2Preds = evaltree(tempT2, xTe);
    
    if (sum(y ~= tempPreds) > sum(y ~= temp2Preds))
        tempT = tempT2;
    end
    
end;
T = tempT;




