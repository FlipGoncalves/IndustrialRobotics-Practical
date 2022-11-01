function M=TransGeom(x, y, alpha)

    % Returns homogenious 2D transformation
    % M - return Matrix
    % x, y - translation values
    % alpha - rotation value

    M = [ cos(alpha)    -sin(alpha)     x
          sin(alpha)    cos(alpha)      y
          0             0           1];

end