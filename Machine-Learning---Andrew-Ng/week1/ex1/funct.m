
clear; clc; close all;

val = csvread('data.csv');
X = val(1:7655,1:4);
Y = val(1:7655,5);
disp(size(X));
disp(size(Y));
m = length(Y);

[X mu sigma] = featureNormalize(X);
X(:,1) = -1 * X(:,1) .+ 40;
X(:,3) = 1 ./ (1 .+ exp(-1 * X(:,3)));
%X(:,4) = X(:,4) .^ 2;

subplot(2,2,1);
plot(X(:,1), Y,'b.', 'markersize', 8);
ylabel('Power'); xlabel('Temperature');
subplot(2,2,2);
plot(X(:,2), Y,'r.', 'markersize', 8);
ylabel('Power'); xlabel('Exhaust Vacuum');
subplot(2,2,3);
plot(X(:,3), Y,'m.', 'markersize', 8);
ylabel('Power'); xlabel('Pressure');
subplot(2,2,4);
plot(X(:,4), Y,'g.', 'markersize', 8);
ylabel('Power'); xlabel('Humidity');


X = [ones(m, 1) X];

% Choose some alpha value
alpha = 0.0055;
num_iters = 1000;

% Init Theta and Run Gradient Descent 
theta = zeros(5, 1);
[theta, J_history] = gradientDescentMulti(X, Y, theta, alpha, num_iters);

figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

