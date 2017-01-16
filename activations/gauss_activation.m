function [Y] = gauss_activation(X)
%gauss_activiation Gaussian activation function.
    Y = exp( - X .^ 2);
end