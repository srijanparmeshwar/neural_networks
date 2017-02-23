function [layer] = affine_layer(H, sigma)
%affine_layer
    layer.H = H;
    layer.create = @(nX) nn_affine(nX, H, sigma);
end