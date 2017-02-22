addpath('../layers');
trainX = linspace(-3, 3, 100);
trainY = sin(trainX);

network = c();

for iteration = 1:100
    [Y, network] = nn(network, trainX, trainY, 0.1);
    
    plot(trainX, trainY, trainX, Y);
    drawnow;
end