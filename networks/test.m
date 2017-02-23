addpath('../layers');
addpath('../loss');
trainX = linspace(-20, 20, 1000);
trainY = sin(trainX);

network.layers = {
    nn_affine(1, 12, 0.05),...
    nn_gabor(),...
    nn_affine(12, 12, 0.05),...
    nn_gabor(),...
    nn_affine(12, 12, 0.05),...
    nn_gabor,...
    nn_affine(12, 1, 0.05)
};
network.loss = @l2_loss;
network.regulariser = @(W) l2_reg(0.0, W);

for iteration = 1:1000
    [Y, network] = nn(network, trainX, trainY, 0.01 / log(1 + sqrt(1 + iteration)));
    
    plot(trainX, trainY, trainX, Y);
    drawnow;
end

% trainX = randn(48 * 48 * 1, 20);
% trainY = trainX;
% 
% network.layers = {
%     nn_conv(24, 24, 4, 4, 3, 3, 0.05),...
%     nn_gabor(),...
%     nn_conv(24, 24, 2, 2, 9, 2, 0.05),...
%     nn_gabor(),...
%     nn_affine(24 * 24 * 18, 128, 0.05),...
%     nn_gabor(),...
%     nn_affine(128, 128, 0.05),...
%     nn_gabor(),...
%     nn_affine(128, 24 * 24 * 3, 0.05),...
%     nn_sigmoid()
% };
% network.loss = @l1_loss;
% network.regulariser = @(W) l2_reg(0.05, W);
% 
% conv_layers = {conv_layer(5, 5, 8, 0.05), conv_layer(3, 3, 4, 0.05)};
% affine_layers = {affine_layer(256, 0.05), affine_layer(256, 0.05)};
% network = create_conv_net([48, 48, 1], [48, 48, 1], conv_layers, affine_layers, nonlinear_layer('gabor'));
% 
% for iteration = 1:40
%     [Y, network] = nn(network, trainX, trainY, 0.05);
%     tX = reshape(trainX(:, 1), [48, 48, 1]);
%     tY = reshape(Y(:, 1), [48, 48, 1]);
%     tX = imresize(tX, 10);
%     tY = imresize(tY, 10);
%     imshowpair(tX, tY, 'montage');
% end
