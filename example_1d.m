rng(0);

f = @(X) sin(2 * X) - 0.5 * sin(0.1 * X + 0.3);

N = 300;
noise = 0.2;

trainX = linspace(-4, 4, N);
trainY = f(trainX) + noise * randn(size(trainX));

testX = linspace(-5, 5, 200);
testY = f(testX);

tic
W = 0;
while toc < 600
    if W == 0
        W = train(trainX, trainY, 0);
    else
        W = train(trainX, trainY, 0.5, W);
    end
    clf;
    hold on;
    scatter(trainX, trainY);
    plot(testX, testY);
    plot(testX, net(W, testX, 1));
    hold off;
    drawnow;
end