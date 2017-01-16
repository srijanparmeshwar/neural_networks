function [Y] = gabor_activation(X)
%gabor_activation Gabor wavelet activation function (imaginary part).
    Y = exp(- 0.5 *  X .^ 2) .* sin(2 * X);
end