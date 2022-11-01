function h = DrawLinks(Org)

    figure;

    if Org(3,:) == zeros(1, size(Org, 2)) 
        h = plot(Org(1,:), Org(2,:));
    else
        h = plot3(Org(1,:), Org(2,:), Org(3,:));
    end

end

