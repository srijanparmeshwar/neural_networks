rng(0);
addpath('../../networks');
addpath('../../activations');
addpath('../../util');
close all;

% Target functions.
f = @(X) sin(2 * X) - 0.5 * sin(0.1 * X + 0.3);
% f = @(X) 0.01 * (0.5 * X .^ 3 - 0.5 * X .^ 2 + X - 1);

N = 40;
noise = 0.1;

range = 5;
trainX = - range + 2 * range * rand(1, N);
trainY = f(trainX) + noise * randn(size(trainX));

testX = linspace(-range - 1, range + 1, 200);
testY = f(testX);

network = create_network(1, 1, [12], @gabor_activation, @dgabor, @linear_activation, @dlinear, 0.5);
rate = 0.2;
regularisation = 0.005;

% Run batch gradient descent.
tic;
while toc < 10
    network = train(network, trainX, trainY, rate, regularisation);
    
    clf;
    hold on;
    scatter(trainX, trainY);
    plot(testX, testY);
    plot(testX, fc_net(network, testX));
    hold off;
    drawnow;
    
    iter = iter + 1;
end

figure, plot(linspace(-range * 2, range * 2, 500), fc_net(network, linspace(- range * 2, range * 2, 500)));