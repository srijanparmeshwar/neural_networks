function [layer] = conv_layer(fx, fy, filters, sigma)
%conv_layer
    layer.filters = filters;
    layer.create = @(width, height, channels) {
        nn_conv(width, height, fx, fy, channels, filters, sigma),...
        nn_bias(width * height * channels * filters, sigma)
    };
end