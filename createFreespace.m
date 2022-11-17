function fspace = createFreespace(map, type)
    f = (zeros([size(map) 1], type));

    for i = 1:size(map,1)
        for j = 1:size(map,2)
            if map(i,j) == 254
                f(i,j) = 254;
            end
        end
    end
    
    fspace = f;

end
