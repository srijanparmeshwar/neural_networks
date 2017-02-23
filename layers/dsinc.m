function [Y] = dsinc(~, X)
%dsinc Derivative of sinc function.
    Y = X;
    Y(Y ~= 0) = (cos(pi * X(Y ~= 0)) - sinc(X(Y ~= 0))) ./ X(Y ~= 0);
end