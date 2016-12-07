rng(0);

f = @(X) sin(1.5 * X(1, :)) .* cos(X(2, :));

N = 20;
noise = 0.1;

x = linspace(-3, 3, N);
y = linspace(-3, 3, N);
[X, Y] = meshgrid(x, y);
trainX = [X(:)'; Y(:)'];
trainY = f(trainX);
trainY = trainY + noise * randn(size(trainY));

testX = trainX;
testY = f(testX);

tic
W = 0;
while toc < 600
    if W == 0
        W = train(trainX, trainY, 0);
    else
        W = train(trainX, trainY, 1, W);
    end
    cla;
    hold on;
    scatter3(trainX(1, :), trainX(2, :), trainY);
    netY = net(W, testX, size(trainY, 1));
    surf(X, Y, reshape(testY, N, N));
    surf(X, Y, reshape(netY, N, N), ones(N, N));
    hold off;
    drawnow;
end