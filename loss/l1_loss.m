function [dL, L] = l1_loss(Y, trainY)
%l1_loss Mean absolute error loss function.
    dL = sign(Y - trainY) / size(trainY, 2);
    if nargout > 1
        L = sum(abs(Y(:) - trainY(:))) / numel(trainY);
    end
end