function [layer] = nn_conv(width, height, fx, fy, channels, filters, sigma)
%nn_conv
    layer.W = sigma * randn(fx, fy, channels, filters);
    layer.X = @(X) X;
    layer.Y = @(W, X) conv3(W, reshape(X, height, width, channels, []));
    layer.dYdX = @(W, X) flip(flip(W, 1), 2);
    layer.dYdW = @(W, X) flip(flip(X, 1), 2);
    layer.dLdW = @(delta, dYdW) conv3(delta, dYdW);
    layer.dLdY = @(delta, dYdX) conv3(;
end