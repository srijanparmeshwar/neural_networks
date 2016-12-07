function [Y] = net(W, X, N)
%net Neural network implementation.
%     X = cat(1, ones(1, size(X, 2)), X);
    [u_sizes, w_sizes] = get_layer_sizes(size(X, 1), N);
    
    pos = 1;
    Y = X;
    for index = 1:length(w_sizes)
        w1 = u_sizes(index);
        w2 = u_sizes(index + 1);
        s = w_sizes(index);
        if index < length(w_sizes)
            activation = @sigmoid_activation;
            Yc = cat(1, ones(1, size(Y, 2)), Y);
            w2 = w2 - 1;
        elseif index == length(w_sizes)
            activation = @linear_activation;
            Yc = cat(1, ones(1, size(Y, 2)), Y);
        end
        weights = W(pos:(pos + s - 1));
        weights = reshape(weights, w2, w1);
        Y = activation(weights * Yc);
        pos = pos + s;
    end
end

