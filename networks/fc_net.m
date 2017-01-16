function [Y, network, d] = fc_net(network, X, trainY, rate, alpha)
%fc_net Fully connected feedforward network implementation.
% Pass trainY to train network. Uses gradient descent with momentum.
    
    train = nargin > 2;
    L = network.depth;
    functions = network.functions;
    W = network.W;

    % Feedforward.
    if train
        inputs = cell(1, L);
        derivatives = network.derivatives;
        V = network.V;
    end
    Y = X;
    for index = 1:(L - 1)
        Yh = cat(1, ones(1, size(Y, 2)), Y);
        if train
            inputs{index} = Yh;
        end
        activation = functions{index};
        weights = W{index};
        Y = weights * Yh;
        Y = activation(Y);
    end
    
    if train
        if nargin < 4
            rate = 0.01;
        end
        if nargin < 5
            alpha = 0.01;
        end
        
        % Backpropagation.
        deltas = Y - trainY;
        % L2 loss function.
        delta_i = deltas / size(trainY, 2);
        % Cross entropy loss function.
%         delta_i = deltas ./ (Y .* (1 - Y));
%         delta_i = delta_i / size(trainY, 2);
        if nargout > 2
            d = mean(deltas(:) .^ 2);
        end
        for index = (L - 1):-1:1
            X = inputs{index};
            derivative = derivatives{index};
            weights = W{index};
            velocity = V{index};

            % Derivative of nonlinearity.
            f_in = weights * X;
            df = derivative(f_in);
            delta_i = delta_i .* df;

            % Derivative of affine layer.
            w_i1 = weights(:, 2:end)';
            velocity = network.decay * velocity - rate * delta_i * X';
            weights = weights + velocity;
            if index < L - 1
                weights = (1 - alpha) * weights;
            end
            
            W{index} = weights;
            V{index} = velocity;
            delta_i = w_i1 * delta_i;
        end
        
        network.W = W;
        network.V = V;
    end

end