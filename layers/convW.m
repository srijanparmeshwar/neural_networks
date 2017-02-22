function [Y] = convW(W, X, width, height, channels, filters)
%convW z_ij sum_x sum_y w_xy p_i+x,j+y
% dYdW = d z_ij / d w_ab = p_i+a,j+b
% dYdX = d z_ij / p_uv = w_u-i,v-j
    X = reshape(X, height, width, channels, []);
    Y = zeros(height, width, channels * filters, size(X, 4));
    for channel = 1:channels
        for filter_index = 1:filters
            filter = W(:, :, channel, filter_index);
            Y(:, :, (channel - 1) * filters + filter_index, :) = convn(X(:, :, channel, :), filter, 'same');
        end
    end
    Y = reshape(Y, [], size(X, 4));
end