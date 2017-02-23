function [layer] = nn_leaky_relu()
%nn__leaky_relu
    layer.W = [];
    layer.M = zeros(size(layer.W));
    layer.V = zeros(size(layer.W));
    layer.X = @(X) X;
    layer.Y = @(~, X) max(0.01 * X, X);
    layer.dYdX = @dlrelu;
    layer.dYdW = @(~, ~) [];
    layer.dLdW = @(~, ~) [];
    layer.dLdY = @(delta, dYdX) delta .* dYdX;
end