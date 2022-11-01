function MDH = GenerateMultiDH(DH,MQ, t)

    if nargin < 3
        t = zeros(1, size(DH,1));
    end

    for i=1:size(MQ,2)
        MDH(:,:,i) = DH;
        for k=1:size(t)
            if t(k) == 1
                MDH(:,3,i) = MQ(:,i);
            else
                MDH(:,1,i) = MQ(:,i);
            end
        end
    end
end

