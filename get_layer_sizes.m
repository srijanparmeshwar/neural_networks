function [u_sizes, w_sizes] = get_layer_sizes(D_in, D_out)
%get_layer_sizes Returns the structure of the network.
    L = [20];
    u_sizes = [D_in + 1, L + 1, D_out];
    low = u_sizes(1:(end - 2));
    high = u_sizes(2:(end - 1));
    w_sizes = [low .* (high - 1), u_sizes(end - 1) * u_sizes(end)];
end

