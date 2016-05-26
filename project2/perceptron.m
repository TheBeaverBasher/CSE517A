function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
w=zeros(d,1);
randAssign = randperm(n);
x = x(:,randAssign);
y = y(:,randAssign);
%% fill in code here
for t = 1:100
   m = 0;
   for i = 1:n
       if y(i)*(w'*x(:,i)) <= 0
           w = perceptronUpdate(x(:,i),y(i),w);
           m = m+1;
       end
   end
   if m == 0
       break
   end
end
end
