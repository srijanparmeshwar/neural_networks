function [Y] = conv3(W, X)
%conv3 z_ij sum_x sum_y w_xy p_i+x,j+y
% dYdW = d z_ij / d w_ab = p_i+a,j+b
% dYdX = d z_ij / p_uv = w_u-i,v-j
    channels = size(W, 3);
    filters = size(W, 4);
    Y = zeros(size(X, 1), size(X, 2), size(W, 3) * size(W, 4), size(X, 4));
    for channel = 1:channels
        for filter_index = 1:filters
            filter = W(:, :, channel, filter_index);
            Y(:, :, (channel - 1) * filters + filter_index, :) = convn(X(:, :, channel, :), filter, 'same');
        end
    end
end