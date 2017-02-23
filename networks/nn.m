function [Y, network, L] = nn(network, X, trainY, rate)
%nn Feedforward network implementation.

    train = nargin > 2;
    depth = length(network.layers);
    
    Y = X;
    for layer_index = 1:depth
        W = network.layers{layer_index}.W;
        X = network.layers{layer_index}.X(Y);
        
        network.layers{layer_index}.input = X;
        Y = network.layers{layer_index}.Y(W, X);
    end
    
    if train
        if nargin < 4
            rate = 0.05;
        end
        
        [dLdY, L] = network.loss(Y, trainY);
        
        for layer_index = depth:-1:1
            layer = network.layers{layer_index};
            
            dYdX = layer.dYdX(layer.W, layer.input);
            dYdW = layer.dYdW(layer.W, layer.input);
            dLdW = layer.dLdW(dLdY, dYdW) + network.regulariser(layer.W);
            dLdY = layer.dLdY(dLdY, dYdX);
            
            layer.M = 0.9 * layer.M + 0.1 * dLdW;
            layer.V = 0.999 * layer.V + 0.001 * dLdW .^ 2;
            
            M = layer.M / (1 - power(0.9, network.t));
            V = layer.V / (1 - power(0.999, network.t));
            layer.W = layer.W - rate * (M ./ (sqrt(V) + 1E-8));
            
%             layer.W = layer.W - rate * dLdW;
            network.layers{layer_index} = layer;
        end
        
        network.t = network.t + 1;
    end
end