rng(0);
addpath('../../networks');
addpath('../../activations');
addpath('../../util');
close all;

% Image regression example of trying to learn a function which maps (x, y)
% coordinates to (R, G, B) values as seen on Andrej Karpathy's ConvnetJS demo at
% https://cs.stanford.edu/people/karpathy/convnetjs/demo/image_regression.html.
% Image of Obama taken from http://www.biography.com/people/barack-obama-12782369.
obama = double(imread('obama.jpg')) / 255;
p = 4;
n_batches = 32;
s = p * n_batches;
batch_size = p * p * n_batches;
obama = imresize(obama, [s, s]);
imshow(obama);

w = size(obama, 2);
h = size(obama, 1);

testX = get_coords(300, 300);
trainX = get_coords(w, h);
trainY = reshape(permute(obama, [3, 1, 2]), 3, []);

network = create_network(2, 3, [16 * ones(1, 8)], @gabor_activation, @dgabor, @sigmoid_activation, @dsig, 0.25);

% Run mini batch gradient descent.
decay_param = log(90) / 1200;
epoch = 1;
min_error = 1;
m_d = 0;
figure;
while epoch < 5000
    rate = 0.05 / sqrt(epoch);
    for batch = 1:n_batches
        r = batch:n_batches:(s * s);
        [network, d] = train(network, trainX(:, r), trainY(:, r), rate, 0);
        m_d = 0.9 * m_d + 0.1 * d;

        disp(m_d);
    end
    if m_d < min_error
        min_error = m_d;
        best_net = network;
        best_iter = epoch;
    end
    if mod(epoch, 10) == 0
        testY = fc_net(network, testX);
        imY = construct_image(testY, 300, 300);
        imshow(imY);
    end
    if epoch < 1200
        network.decay = 1 / (1 + exp(- decay_param * epoch));
    end
    epoch = epoch + 1;
end

network = compress(best_net);
save('model.mat', 'network'); 