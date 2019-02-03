function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

%fprintf("theta1 size"); disp(size(Theta1));
%fprintf("theta2 size"); disp(size(Theta2));
%fprintf("X size"); disp(size(X));
%fprintf("p size"); disp(size(p));

z1 = X * Theta1';
sig1 = sigmoid(z1);
%fprintf("sig1 size"); disp(size(sig1));
sig1 = [ones(m,1) sig1];
z2 = sig1 * Theta2';
%fprintf("L2 size"); disp(size(z2));
[val p] = max(z2,[],2);
%fprintf("p size"); disp(size(p));




% =========================================================================


end
