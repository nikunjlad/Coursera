function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

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
%
% Note: grad should have the same dimensions as theta
%


 predictions = X * theta;
 %fprintf("predictions size"); disp(size(predictions));
 sigmoidal = sigmoid(predictions);
 %disp(sigmoidal);
 %fprintf("sigmoid size"); disp(size(sigmoidal));
 J = (-1 * ((y' * log(sigmoidal)) + ((1 - y)' * log(1 - sigmoidal)))) / m;

 %fprintf("X size"); disp(size(X));
 %fprintf("Y size"); disp(size(y));
 
 %for j = 1:1:length(grad)
   grad = grad + ((1 / m) * (X' * (sigmoidal - y)));
 %end
 
% =============================================================

end
