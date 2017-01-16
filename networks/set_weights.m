function [network] = set_weights(network, w)
%set_weights Set the network weights from a vector.
    position = 1;
    for index = 1:length(network.W)
        w_size = size(network.W{index});
        num_weights = numel(network.W{index});
        network.W{index} = reshape(w(position:(position + num_weights - 1)), w_size);
    end
end

