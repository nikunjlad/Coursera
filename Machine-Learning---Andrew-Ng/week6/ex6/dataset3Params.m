function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%
%{
% You need to return the following variables correctly.
Ct = [0.01,0.03,0.1,0.3,1,3,10,30];
sigmat = [0.01,0.03,0.1,0.3,1,3,10,30];
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
k = 1;
dat = zeros(64,3);

for i = 1:length(Ct)
    for j =1:length(sigmat)
        model = svmTrain(X, y, Ct(i), @(x1, x2) gaussianKernel(x1, x2, sigmat(j))); 
        predictions = svmPredict(model, Xval);
        err = mean(double(predictions ~= yval));
        dat(k,1) = err;
        dat(k,2) = Ct(i);
        dat(k,3) = sigmat(i);
        fprintf('Error: %f, C: %f, sigma: %f', err,Ct(i),sigmat(j));
        k = k + 1;
    end
end

mini = min(dat(:,1));
ind = find(mini == dat(:,1));
C = dat(ind,2);
sigma = dat(ind,3);
fprintf('C: %f, sigma: %f\n',C,sigma);

% =========================================================================

end
%}


C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C_values = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma_values = [0.01 0.03 0.1 0.3 1 3 10 30];

for i=1:length(C_values)
    for j=1:length(sigma_values)
        C = C_values(i);
        sigma = sigma_values(j);
        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
        predictions = svmPredict(model, Xval);
        predictions_error(i,j) = mean(double(predictions ~= yval));
    end
end

mm = min(min(predictions_error));
[i j] = find(predictions_error == mm);
C = C_values(i);
sigma = sigma_values(j);

end

