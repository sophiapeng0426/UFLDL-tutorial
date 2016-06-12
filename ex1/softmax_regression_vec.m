function [f,g] = softmax_regression(theta, X,y)
  %
  % Arguments:
  %   theta - A vector containing the parameter values to optimize.
  %       In minFunc, theta is reshaped to a long vector.  So we need to
  %       resize it to an n-by-(num_classes-1) matrix.
  %       Recall that we assume theta(:,num_classes) = 0.
  %
  %   X - The examples stored in a matrix.  
  %       X(i,j) is the i'th coordinate of the j'th example.
  %   y - The label for each example.  y(j) is the j'th example's label.
  %
  m=size(X,2);
  n=size(X,1);

  % theta is a vector;  need to reshape to n x num_classes.
  theta=reshape(theta, n, []);
  num_classes=size(theta,2)+1;
  theta=[theta,zeros(size(theta,1),1)];
  % initialize objective value and gradient.
  f = 0;
  g = zeros(size(theta));

  %
  % TODO:  Compute the softmax objective function and gradient using vectorized code.
  %        Store the objective function value in 'f', and the gradient in 'g'.
  %        Before returning g, make sure you form it back into a vector with g=g(:);
  %
%%% YOUR CODE HERE %%%
  M = exp(theta'*X);
  I=sub2ind(size(M),y,1:size(M,2));
  f=f-sum(log(M(I)./sum(M,1)));
  y_full = full(sparse(y,1:m,1));
  g=g-X*(y_full-bsxfun(@rdivide,M,sum(M,1)))';
  g(:,end)=[];
  
  g=g(:); % make gradient a vector for minFunc
  
  
  
%   M=exp(theta'*X);
%   y_full=full(sparse(y,1:m,1));
%   % f=f-sum(log(sum(y_full.*M)./sum(M,1)));
%   I=sub2ind(size(M),y,1:size(M,2));
%   f=f-sum(log(M(I)./sum(M,1)));
%   g=g-X*(y_full-bsxfun(@rdivide,M,sum(M,1)))';
%   g(:,end)=[];
%   g=g(:); % make gradient a vector for minFunc
end


