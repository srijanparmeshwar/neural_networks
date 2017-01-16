rng(0);
addpath('../../networks');
addpath('../../activations');
addpath('../../util');
close all;

% Target function.
f = @(X) sin(1.5 * X(1, :)) .* cos(X(2, :));

N = 24;
noise = 0.15;

x = sort(-4 + 8 * rand(1, N));
y = sort(-4 + 8 * rand(1, N));
[X, Y] = meshgrid(x, y);
trainX = [X(:)'; Y(:)'];
trainY = f(trainX);
trainY = trainY + noise * randn(size(trainY));

testX = trainX;
testY = f(testX);

network = create_network(2, 1, [16], @gabor_activation, @dgabor, @linear_activation, @dlinear, 0.25);
rate = 0.25;
regularisation = 0.005;

% Run batch gradient descent.
tic;
while toc < 10
    network = train(network, trainX, trainY, rate, regularisation);
    
    cla;
    hold on;
    scatter3(trainX(1, :), trainX(2, :), trainY);
    netY = fc_net(network, testX);
    surf(X, Y, reshape(testY, N, N));
    surf(X, Y, reshape(netY, N, N), ones(N, N));
    hold off;
    drawnow;
end

figure, surf3d(linspace(-4.0, 4.0, 100), linspace(-4.0, 4.0, 100), @(x, y) fc_net(network, [x; y]));