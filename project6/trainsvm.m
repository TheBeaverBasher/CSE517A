function [svmclassify,sv_i,alphas]=trainsvm(xTr,yTr, C,ktype,kpar)
% function [svmclassify,sv_i,alphas]=trainsvm(xTr,yTr, C,ktype,kpar);
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% C   : regularization constant (in front of loss)
% ktype : (linear, rbf, polynomial)
% 
% Output:
% svmclassify : a classifier (scmclassify(xTe) returns the predictions on xTe)
% sv_i : indices of support vecdtors
% alphas : a nx1 vector of alpha values
%
% Trains an SVM classifier with kernel (ktype) and parameters (C,kpar)
% on the data set (xTr,yTr)
%

if nargin<5,kpar=1;end;
yTr=yTr(:);
% svmclassify=@(xTe) (rand(1,size(xTe,2))>0.5).*2-1; %% classify everything randomly
n=length(yTr);



disp('Generating Kernel ...')
    K=computeK(ktype, xTr, xTr, kpar);
disp('Solving QP ...')
    [H,q,Aeq,beq,lb,ub]=generateQP(K,yTr,C);
    alphas=quadprog (H, q, Aeq.*0,beq.*0 ,Aeq,beq,lb, ub);
disp('Recovering bias')
    bias=recoverBias(K,yTr,alphas,C);
disp('Extracting support vectors ...')
    sv_i=find(alphas);
disp('Creating classifier ...')
    svmclassify=@(xTe) ((alphas(sv_i).*yTr(sv_i))'*computeK(ktype,xTr(:,sv_i),xTe,kpar))'+bias;
disp('Computing training error:') % this is optional, but interesting to see
%
% YOUR CODE 
%


