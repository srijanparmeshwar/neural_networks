function [compressed_network] = compress(network)
%compress Remove redundant information in network when training is
% complete.
    compressed_network.W = network.W;
    compressed_network.functions = network.functions;
    compressed_network.depth = network.depth;
end