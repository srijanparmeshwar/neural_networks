function [W] = flatten_weights(network)
%flatten_weights Flatten weight cell array to vector.
    W = cell2mat(cellfun(@(w) w(:)', network.W, 'UniformOutput', false));
end

