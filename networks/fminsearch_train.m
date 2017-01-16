function [network] = fminsearch_train(network, trainX, trainY, alpha)
%train Train the neural network using fminsearch.
    % Objective functions.
    W = flatten_weights(network);
    loss = @(w) mse(network, w, trainX, trainY) + alpha * sum(1 - exp(- 2 * w .^ 2));
%     loss = @(w) cross_entropy(trainX, trainY, w);
    options = optimset('MaxFunEvals', 400, 'MaxIter', 10);
    
    max_iterations = 1;
    for iteration = 1:max_iterations
        W = fminsearch(loss, W, options);
    end
    network = set_weights(network, W);
end