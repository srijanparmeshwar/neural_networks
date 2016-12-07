function [C] = func_diff(trainX, trainY, W)
%func_diff Sum of squared errors.
    D = (trainY - net(W, trainX, size(trainY, 1))) .^ 2;
    C = sum(D(:));
end