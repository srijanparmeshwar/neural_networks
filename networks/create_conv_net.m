function [network] = create_conv_net(input_size, output_size, conv_layers, affine_layers, nonlinearity, loss, regulariser)
%create_conv_net
    if nargin < 6
        network.loss = @l2_loss;
    else
        network.loss = loss;
    end
    
    if nargin < 7
        network.regulariser = @(W) zeros(size(W));
    else
        network.regulariser = regulariser;
    end
    
    layer_size = input_size;
    
    network.layers = {};
    for layer_index = 1:length(conv_layers)
        height = layer_size(1);
        width = layer_size(2);
        channels = layer_size(3);
        network.layers = [
            network.layers,...
            conv_layers{layer_index}.create(width, height, channels),...
            nonlinearity.create();
        ];
        channels = conv_layers{layer_index}.filters * channels;
        layer_size(3) = channels;
    end
    
    layer_size = prod(layer_size);
    for layer_index = 1:length(affine_layers)
        network.layers = [
            network.layers,...
            affine_layers{layer_index}.create(layer_size),...
            nonlinearity.create();
        ];
        layer_size = affine_layers{layer_index}.H;
    end
    
    output_affine_layer = affine_layer(prod(output_size), 0.25);
    output_sigmoid_layer = nonlinear_layer('sigmoid');
    network.t = 1;
    network.layers = [network.layers, output_affine_layer.create(layer_size), output_sigmoid_layer.create()];
end