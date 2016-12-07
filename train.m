function [W] = train(trainX, trainY, alpha, initialW)
%train Train the neural network using optimisation techniques.
    
    % Create network.
    [~, w_sizes] = get_layer_sizes(size(trainX, 1), size(trainY, 1));
    if nargin == 4
        W = initialW;
    else
        W = randn(1, sum(w_sizes));
    end

    % Objective functions.
    loss = @(w) func_diff(trainX, trainY, w) + 0.75 * grad_diff(trainX, trainY, w) + alpha * norm(w);
%     loss = @(w) func_diff(trainX, trainY, w) + alpha * norm(w);
%     loss = @(w) cross_entropy(trainX, trainY, w);
    options = optimset('MaxFunEvals', 400, 'MaxIter', 10);
    
    max_iterations = 1;
    for iteration = 1:max_iterations
        W = fminsearch(loss, W, options);
    end
end

