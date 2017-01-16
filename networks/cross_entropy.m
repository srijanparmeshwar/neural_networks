function [C] = cross_entropy(trainX, trainY, W)
%cross_entropy Cross entropy loss function for use with fminsearch_train.
    Y = net(W, trainX, size(trainY, 1));
    C = - sum(mean(...
            trainY .* log(Y)...
            + (1 - trainY) .* log(1 - Y)...
        ));
end
