function [X] = get_coords(w, h)
%get_coords Get input coordintes for image neural network, to produce an
% image of size w x h.
    x = linspace(0, 1, w);
    y = linspace(0, 1, h);
    [xm, ym] = meshgrid(x, y);
    X = [xm(:)'; ym(:)'];
end