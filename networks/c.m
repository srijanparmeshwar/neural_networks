function [network] = c()
%c
    sigma = 0.25;
    network = {nn_affine(1, 4, sigma), nn_gabor(), nn_affine(4, 1, sigma)};
end