function [layer] = nn_relu()
%nn_relu
    layer.W = [];
    layer.M = zeros(size(layer.W));
    layer.V = zeros(size(layer.W));
    layer.X = @(X) X;
    layer.Y = @(~, X) max(0, X);
    layer.dYdX = @(~, X) X >= 0;
    layer.dYdW = @(~, ~) [];
    layer.dLdW = @(~, ~) [];
    layer.dLdY = @(delta, dYdX) delta .* dYdX;
end