function [dCdX] = dconvdX(delta, W, width, height, channels, filters)
%dconvdX
    dCdX = zeros(height, width, channels, size(delta, 4));
    for channel = 1:channels
        for filter = 1:filters
            dCdX(:, :, channel, :) = dCdX(:, :, channel, :) + convn(delta(:, :, (channel - 1) * filters + filter_index), W, 'same');
        end
    end
end