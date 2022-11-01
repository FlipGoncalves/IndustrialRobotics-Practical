function MQ = LinspaceVect(Q1, Q2, N)

    for i=1:size(Q1,1)
        MQ(i,:) = linspace(Q1(i), Q2(i), N);
    end

end