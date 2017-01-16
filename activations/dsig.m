function [Y] = dsig(X)
%dsig Derivative of sigmoid function.
    Y = 1 ./ (1 + exp(- X));
    Y = Y .* (1 - Y);
end