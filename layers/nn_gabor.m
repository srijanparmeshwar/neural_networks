function [layer] = nn_gabor()
%nn_gabor Gabor activation.
    layer.W = [];
    layer.X = @(X) X;
    layer.Y = @(~, X) exp(- 0.5 *  X .^ 2) .* sin(2 * X);
    layer.dYdX = @(~, X) exp(- 0.5 * X .^ 2) .* (2 * cos(2 * X) - X .* sin(2 * X));
    layer.dYdW = @(~, ~) [];
    layer.dLdW = @(~, ~) [];
    layer.dLdY = @(delta, dYdX) delta .* dYdX;
end