function [Y] = dgauss(X)
%dgauss Derivative of Gaussian activation.
    Y = - (2 * X) .* exp(- X .^ 2);
end