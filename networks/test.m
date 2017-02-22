addpath('../layers');
% trainX = linspace(-3, 3, 100);
% trainY = sin(trainX);
% 
% network = c();
% 
% for iteration = 1:100
%     [Y, network] = nn(network, trainX, trainY, 0.1);
%     
%     plot(trainX, trainY, trainX, Y);
%     drawnow;
% end

trainX = randn(24, 24, 3, 4);
trainY = reshape(trainX, [], 4);

network = {nn_conv(24, 24, 4, 4, 3, 3, 0.05), nn_gabor(), nn_conv(24, 24, 2, 2, 9, 2, 0.05), nn_gabor(), nn_affine(24 * 24 * 18, 128, 0.05), nn_gabor(), nn_affine(128, 128, 0.05), nn_gabor(), nn_affine(128, 24 * 24 * 3, 0.05), nn_sigmoid()};

for iteration = 1:40
    [Y, network] = nn(network, trainX, trainY, 0.1);
    tX = trainX(:, :, :, 1);
    tY = reshape(Y(:, 1), [24, 24, 3]);
    tX = imresize(tX, 10);
    tY = imresize(tY, 10);
    imshowpair(tX, tY, 'montage');
end
