function [Y, network] = nn(network, X, trainY, rate, alpha)
%nn Feedforward network implementation.

    train = nargin > 2;
    depth = length(network);
    
    Y = X;
    for layer_index = 1:depth
        W = network{layer_index}.W;
        X = network{layer_index}.X(Y);
        
        network{layer_index}.input = X;
        Y = network{layer_index}.Y(W, X);
    end
    
    if train
        if nargin < 4
            rate = 0.05;
        end
        if nargin < 5
            alpha = 0.01;
        end
        
        deltas = Y - trainY;
        dLdY = deltas / size(trainY, 2);
        
        for layer_index = depth:-1:1
            layer = network{layer_index};
            
            dYdX = layer.dYdX(layer.W, layer.input);
            dYdW = layer.dYdW(layer.W, layer.input);
            dLdW = layer.dLdW(dLdY, dYdW);
            dLdY = layer.dLdY(dLdY, dYdX);
            
            layer.W = layer.W - rate * dLdW;
            network{layer_index} = layer;
        end
    end
end