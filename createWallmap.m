function wspace = createWallmap(map, type)
    w = (zeros([size(map) 1], type));

    for i = 1:size(map,1)
        for j = 1:size(map,2)
            if map(i,j) == 0
                w(i,j) = 254;
            end
        end
    end
    
    wspace = w;

end
