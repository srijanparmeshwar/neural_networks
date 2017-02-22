% View image produced from a pretrained network.
close all;
addpath('../../networks');
addpath('../../activations');
addpath('../../util');
load('obama_net.mat', 'network');
network = compress(network);
width = 400;
height = 400;
X = get_coords(width, height);
Y = fc_net(network, X);
imY = construct_image(Y, width, height);
imshow(imY);