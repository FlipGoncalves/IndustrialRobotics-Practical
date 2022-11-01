function A=Tlink(teta, l, d, alpha)

    if nargin == 1
        l = teta(2);
        d = teta(3);
        alpha = teta(4);
        teta = teta(1);
    end


    rotX = [ 1     0           0           0
          0     cos(alpha)  -sin(alpha) 0
          0     sin(alpha)  cos(alpha)  0
          0     0           0           1
        ];

    rotZ = [ cos(teta)    -sin(teta) 0     0
          sin(teta)    cos(teta)  0     0
          0             0           1     0
          0             0           0     1
        ];

    trans = [ 1   0   0   l
              0   1   0   0
              0   0   1   d
              0   0   0   1
            ];

    A = rotZ*trans*rotX;
end