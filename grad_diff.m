function [C] = grad_diff(trainX, trainY, W)
%grad_diff Sum of squared differences of gradients.
    Y = net(W, trainX, size(trainY, 1));
    dY = diff(Y, 1, 2);
    dtY = diff(trainY, 1, 2);
    dX = diff(trainX, 1, 2);
    D = bsxfun(@rdivide, dY - dtY, dX) .^ 2;
    D = D(~isinf(D));
    C = sum(D(:));
end