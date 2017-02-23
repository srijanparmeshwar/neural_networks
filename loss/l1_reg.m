function [dL] = l1_reg(alpha, W)
%l1_reg
    dL = alpha * sign(W);
end