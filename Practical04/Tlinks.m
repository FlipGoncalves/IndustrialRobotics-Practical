function AA = Tlinks(DH)
    
    for i=1:size(DH)
        AA(:,:,:,i) = Tlink(DH(i,:));
    end
    
end

