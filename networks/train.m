function [network, d] = train(network, trainX, trainY, rate, alpha)
%grad_train Train network using gradient descent.
    [~, network, d] = fc_net(network, trainX, trainY, rate, alpha);
end