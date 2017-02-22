function [dCdX] = dconvdX(delta, dYdX, width, height, channels, filters)
%dconvdX
    delta = reshape(delta, height, width, channels * filters, []);
    dCdX = zeros(height, width, channels, size(delta, 4));
    for channel = 1:channels
        for filter_index = 1:filters
            dCdX(:, :, channel, :) = dCdX(:, :, channel, :) + convn(delta(:, :, (channel - 1) * filters + filter_index, :), dYdX, 'same');
        end
    end
    dCdX = reshape(dCdX, [], size(delta, 4));
end