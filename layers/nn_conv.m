function [layer] = nn_conv(width, height, fx, fy, channels, filters, sigma)
%nn_conv
    layer.W = sigma * randn(fy, fx, channels, filters);
    layer.X = @(X) X;
    layer.Y = @(W, X) conv3(W, X, width, height, channels, filters);
    layer.dYdX = @(W, X) flip(flip(W, 1), 2);
    layer.dYdW = @(W, X) flip(flip(X, 1), 2);
    layer.dLdW = @(delta, dYdW) dconvdW(delta, dYdW, width, height, fx, fy, channels, filters);
    layer.dLdY = @(delta, dYdX) dconvdX(delta, dYdX, width, height, channels, filters);
end