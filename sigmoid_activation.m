function [Y] = sigmoid_activation(X)
%sigmoid_activation Sigmoid activation function.
    Y = 1 ./ (1 + exp(- X));
end

