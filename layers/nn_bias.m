function [layer] = nn_bias(nX, sigma)
%nn_bias
    layer.W = sigma * randn(nX, 1);
    layer.M = zeros(size(layer.W));
    layer.V = zeros(size(layer.W));
    layer.X = @(X) X;
    layer.Y = @(W, X) bsxfun(@plus, X, W);
    layer.dYdX = @(~, ~) [];
    layer.dYdW = @(~, ~) [];
    layer.dLdW = @(delta, ~) sum(delta, length(size(delta)));
    layer.dLdY = @(delta, ~) delta;
end