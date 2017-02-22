function [layer] = nn_sigmoid()
%nn_sigmoid
    layer.W = [];
    layer.X = @(X) X;
    layer.Y = @(~, X) 1 ./ (1 + exp(- X));
    layer.dYdX = @dsigmoid;
    layer.dYdW = @(~, ~) [];
    layer.dLdW = @(~, ~) [];
    layer.dLdY = @(delta, dYdX) delta .* dYdX;
end