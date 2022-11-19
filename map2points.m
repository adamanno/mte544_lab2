function pointCloud = map2points(map)
    gridSize = map.GridSize;
    occMatrix = checkOccupancy(map);
    
    n = sum(sum(occMatrix == 0)); % count number of 0 (occupued) cells
    pts = zeros(n,2);

    idx = 1;
    for i = 1:gridSize(1) % iterate through rows
        for j = 1:gridSize(2) % iterate through columns
            if occMatrix(i,j) == 0
                pts(idx,:) = grid2world(map, [i j]);
                idx = idx + 1;
            end
        end
    end

    pointCloud = pts;
end

