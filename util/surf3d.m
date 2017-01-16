function [X, Y, Z] = surf3d(x, y, f)
%surf3d Plot a 3D surface of Z = f(X, Y).
    [X, Y] = meshgrid(x, y);
    Z = reshape(f(X(:)', Y(:)'), size(X));
    surf(X, Y, Z);
end