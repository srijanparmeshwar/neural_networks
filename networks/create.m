function [network] = create(D_in, D_out, H, Hf, Hd, alpha)
%create Create a fully connected network with input layer size D_in, output
% layer size D_out and layer sizes, activations and derivatives given by H,
% Hf, and Hd respectively. Weights are initialised with Gaussian
% distribution of mean 0 and standard deviation alpha.
    L = [D_in + 1, H + 1, D_out];
    W = cell(1, length(L) - 1);
    V = cell(1, length(L) - 1);
    
    for index = 2:(length(L) - 1)
        W{index - 1} = alpha * randn(L(index) - 1, L(index - 1));
        V{index - 1} = zeros(L(index) - 1, L(index - 1));
    end
    W{end} = alpha * randn(L(end), L(end - 1));
    V{end} = zeros(L(end), L(end - 1));
    
    network.W = W;
    network.V = V;
    network.depth = length(L);
    network.decay = 0.5;
    network.functions = Hf;
    network.derivatives = Hd;
end