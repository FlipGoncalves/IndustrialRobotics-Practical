function rotacao = Rotation(a)

    a = a * pi / 180;
    rotacao = [cos(a) -sin(a)
                sin(a) cos(a)];

end