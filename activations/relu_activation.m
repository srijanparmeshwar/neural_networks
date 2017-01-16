function [Y] = relu_activation(X)
%relu_activiation Leaky ReLU activation function.
    Y = X;
    Y(Y < 0) = 0.01 * Y(Y < 0);
end