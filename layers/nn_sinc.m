function [layer] = nn_sinc()
%sinc
    layer.W = [];
    layer.M = zeros(size(layer.W));
    layer.V = zeros(size(layer.W));
    layer.X = @(X) X;
    layer.Y = @(~, X) sinc(X);
    layer.dYdX = @dsinc;
    layer.dYdW = @(~, ~) [];
    layer.dLdW = @(~, ~) [];
    layer.dLdY = @(delta, dYdX) delta .* dYdX;
end