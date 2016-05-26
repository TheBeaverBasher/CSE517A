function preds=competition(xTr,yTr,xTe);
% function preds=competition(xTr,yTr,xTe);
%
% A classifier that outputs predictions for the data set xTe based on 
% what it has learned from xTr,yTr
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%

k = 10;
n = size(xTr,2);
m = size(xTe,2);

x = [xTr xTe];
[coeff,score,latent,tsquared,explained] = pca(x');
xTr = score(1:n,1:20)';
xTe = score(n+1:n+m,1:20)';

preds=knnclassifier(xTr,yTr,xTe,k);
%fill in the code here

