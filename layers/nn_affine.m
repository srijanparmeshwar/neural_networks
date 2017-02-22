function [layer] = nn_affine(nX, nY, sigma)
%nn_affine Affine layer.
    layer.W = sigma * randn(nY, nX + 1);
    layer.X = @(X) cat(1, ones(1, size(X, 2)), X);
    layer.Y = @(W, X) W * X;
    layer.dYdX = @(W, X) W(:, 2:end)';
    layer.dYdW = @(~, X) X';
    layer.dLdW = @(delta, dYdW) delta * dYdW;
    layer.dLdY = @(delta, dYdX) dYdX * delta;
end