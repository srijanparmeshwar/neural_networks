function [dL, L] = l2_loss(Y, trainY)
%l2_loss Mean squared error loss function.
    dL = (Y - trainY);
    if nargout > 1
        L = mean(dL(:) .^ 2);
    end
    dL =  dL / size(dL, 2);
end