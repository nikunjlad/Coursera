function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
%fprintf("grad size"); disp(size(grad));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

predictions = X * theta;
%fprintf("predictions size"); disp(size(predictions));
sigmoidal = sigmoid(predictions);
%disp(sigmoidal);
%fprintf("sigmoid size"); disp(size(sigmoidal));

J = [(-1 * ((y' * log(sigmoidal)) + ((1 - y)' * log(1 - sigmoidal)))) / m] + [(lambda / (2 * m)) * sum(theta(2:length(theta)) .^ 2)];

%======================= Method 1 ==========================%
%{
for j = 1:length(grad)
  if j == 1
    grad(j) = grad(j) + ((1 / m) * sum((sigmoidal - y) .* X(:,j)));
  else
    grad(j) = [grad(j) + ((1 / m) * sum((sigmoidal - y) .* X(:,j)))] + [(lambda / m) * theta(j)];
end
%}

%======================= Method 2 ===========================%
%disp(size(X));
grad = grad + ((1 / m) * (X' * (sigmoidal - y)));
%disp(size(grad));
temp = theta;
%disp(size(temp));
temp(1) = 0;
h = sigmoidal - y;
%disp(size(h));
grad = grad + [(lambda / m) * temp];
% =============================================================

end
