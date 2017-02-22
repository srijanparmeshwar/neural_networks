function [dCdW] = dconvdW(delta, dYdW, width, height, fx, fy, channels, filters)
%dconvdW
    delta = reshape(delta, height, width, channels * filters, []);
    dYdW = reshape(dYdW, height, width, channels, []);
    dCdW = zeros(fy, fx, channels, filters);
    for channel = 1:channels
        for filter_index = 1:filters
            dCdW(:, :, channel, filter_index) = sum(convn(delta(:, :, (channel - 1) * filters + filter_index, :), dYdW(:, :, channel, :), 'valid'), length(size(delta)));
        end
    end
end