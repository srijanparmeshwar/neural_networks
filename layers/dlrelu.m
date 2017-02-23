function [Y] = dlrelu(~, X)
%dlrelu Derivative of Leaky ReLU.
    Y = X;
    Y(Y >= 0) = 1;
    Y(Y < 0) = - 0.01;
end