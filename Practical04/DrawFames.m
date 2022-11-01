function H = DrawFames(AA, P, F)

    H(1) = patch('Vertices', P(1:3,:)', 'Faces', F, 'Facecolor', 'w');
    grid on; axis equal; hold on;

    TT = eye(4);
    for n=1:(size(AA,4))
        TT = TT*AA(:,:,n);
        P2 = TT*P;
        H(n+1) = patch('Vertices', P2(1:3,:)', 'Faces', F, 'Facecolor', 'g');
    end
end

