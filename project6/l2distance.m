function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

[d,n]=size(X);
% YOUR CODE (you can copy it from previous projects)

if (nargin==1) % case when there is only one input (X)
	[~,n]=size(X);
	XT=transpose(X); % take X transpose 
	GX=mtimes(XT,X); % finder innerproduct of X with X
	Sii=diag(G);
	S=repmat(Sii,1,n);
	R=transpose(S); %
	D2=S-2*G+R; % compute distance squared
	D=sqrt(D2); % component wise sqaure root of D2


else  % case when there are two inputs (X,Z)
	[~,n]=size(X);
	[~,m]=size(Z);
	XT=transpose(X); % take X transpose 
    ZT=transpose(Z); % take z transpose 
	G=mtimes(XT,Z);  % find innerproduct matrix of X and Z
    GX=mtimes(XT,X); % finder innerproduct of X with X
    GZ=mtimes(ZT,Z); % finder innerproduct of Z with Z
	Sii=diag(GX);
	Rjj=diag(GZ);
	S=repmat(Sii,1,m); %
	R=transpose(repmat(Rjj,1,n)); %
	D2=S-2*G+R; % compute distance squared
	D=sqrt(D2); % component wise sqaure root of D2

end;



