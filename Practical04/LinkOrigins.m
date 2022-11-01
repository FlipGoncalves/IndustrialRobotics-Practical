function org = LinkOrigins(AA)

    org = zeros(3, size(AA,3)+1);

    T = eye(4,4);

    for i=1:(size(AA,4))
        T = T*AA(:,:,i);
        org(:,i+1) = T(1:3,4);
    end

end

