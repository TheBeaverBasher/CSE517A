function [indices,dists]=findknn(xTr,xTe,k);
% function [indices,dists]=findknn(xTr,xTe,k);
%
% Finds the k nearest neighbors of xTe in xTr.
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
% 
% Output:
% indices = kxn matrix, where indices(i,j) is the i^th nearest neighbor of xTe(:,j)
% dists = Euclidean distances to the respective nearest neighbors
%

[~,ntr]=size(xTr);
[~,n]=size(xTe);
D1=l2distance(xTr, xTe);
[D1sorted, SortIndex] = sort(D1);
I1=transpose(repmat(1:ntr,n,1));
I1sorted = I1(SortIndex);

if k>ntr,
    dists=D1sorted;
    indices=I1sorted;
else
       
    dists=D1sorted(1:k, 1:n);
    indices=I1sorted(1:k, 1:n);
end;