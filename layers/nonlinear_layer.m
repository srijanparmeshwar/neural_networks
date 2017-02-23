function [layer] = nonlinear_layer(nonlinearity)
%nonlinear_layer
    if strcmp(nonlinearity, 'sinc')
        layer.create = @nn_sinc;
    elseif strcmp(nonlinearity, 'gabor')
        layer.create = @nn_gabor;
    elseif strcmp(nonlinearity, 'sigmoid')
        layer.create = @nn_sigmoid;
    elseif strcmp(nonlinearity, 'relu')
        layer.create = @nn_relu;
    elseif strcmp(nonlinearity, 'lrelu')
        layer.create = @nn_leaky_relu;
    else
        layer.create = @nn_linear;
    end
end