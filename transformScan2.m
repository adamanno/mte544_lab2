%transforms the lidar point cloud to cartesian coordinates in the global frame
function out = transformScan2(scan,p)
    data = scan2cart(scan);
    
    data(:,3) = 1;

    for i = 1:length(data)
        data(i,:) = p.G*transpose(data(i,:));
    end

    out = data(:,1:2);
end

