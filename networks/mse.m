function [C] = mse(network, w, trainX, trainY)
%mse Mean of squared errors.
    network = set_weights(network, w);
    D = (trainY - fc_net(network, trainX)) .^ 2;
    C = mean(D(:));
end