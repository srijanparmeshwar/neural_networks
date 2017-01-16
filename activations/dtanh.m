function [Y] = dtanh(X)
%dtanh Derivative of tanh activation.
    Y = sech(X) .^ 2;
end