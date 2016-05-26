function bias=recoverBias(K,yTr,alphas,C)
% function bias=recoverBias(K,yTr,alphas,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : 1xn input labels
% alphas  : nx1 vector or alpha values
% C : regularization constant
% 
% Output:
% bias : the hyperplane bias of the kernel SVM specified by alphas
%
% Solves for the hyperplane bias term, which is uniquely specified by the support vectors with alpha values
% 0<alpha<C
%


% YOUR CODE 
[n,~]=size(K);
alpha=1;
dist=1;
for i=1:n
    disti=abs(alphas(i)-C/2);
    if disti<=dist
        alpha=i;
    end;
end;
bias=1/yTr(alpha)-trace(diag(alphas)*K*diag(yTr));