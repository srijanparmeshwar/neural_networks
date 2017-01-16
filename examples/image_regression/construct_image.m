function [Y] = construct_image(X, w, h)
%construct_image Convert output RGB values at image coordinates to an
% image.
    Y = permute(reshape(X, [3, h, w]), [2, 3, 1]);
end