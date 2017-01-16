function [network] = create_network(D_in, D_out, H, f, df, out_f, dout_f, alpha)
%create_network Creates a fully connected network with hidden activations and
% derivatives given by f and df, output activation and derivative given by
% out_f and dout_f.
    if nargin < 4
        alpha = 0.25;
    end
    F = cell(1, length(H));
    D = cell(1, length(H));
    for index = 1:length(H)
       F{index} = f;
       D{index} = df;
    end
    network = create(D_in, D_out, H, [F, {out_f}], [D, {dout_f}], alpha);
end