function [layer] = nn_linear()
%nn_linear
    layer.W = [];
    layer.M = zeros(size(layer.W));
    layer.V = zeros(size(layer.W));
    layer.X = @(X) X;
    layer.Y = @(~, X) X;
    layer.dYdX = @(~, X) ones(size(X));
    layer.dYdW = @(~, ~) [];
    layer.dLdW = @(~, ~) [];
    layer.dLdY = @(delta, dYdX) delta .* dYdX;
end