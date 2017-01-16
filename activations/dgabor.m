function [Y] = dgabor(X)
%dgabor Derivative of Gabor activation.
    Y = exp(- 0.5 * X .^ 2) .* (2 * cos(2 * X) - X .* sin(2 * X));
end