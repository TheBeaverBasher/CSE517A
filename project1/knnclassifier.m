function preds=knnclassifier(xTr,yTr,xTe,k)
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%

[I,D]=findknn(xTr,xTe,k);
class=yTr(I);
if k > 1
    [preds, F, C]= mode(class);   
    if ~(all(cellfun('length',C)==1))
        keep = cellfun('length',C)==1;
        remove = cellfun('length',C) > 1;
        preds = preds.*keep;
        updated = remove.*knnclassifier(xTr,yTr,xTe,k-1);
        preds = preds + updated;
    end
else
    preds=class;
end;