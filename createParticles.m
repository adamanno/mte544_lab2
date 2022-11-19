%% put particles between a certain limit of coordinates

function particles = createParticles(n,map)
    
    x_min = 2; %(x_range(2)-x_range(1))/2;
    x_max = map.XWorldLimits(2);
    y_min = map.YWorldLimits(1);
    y_max = -1; %y_min + (y_range(2)-y_range(1))/2.5;

    p = struct('x',{},'y',{},'theta',{},'G',{});
    
    for i = 1:n
        % generate random numbers
        rand_x = x_min + rand()*(x_max-x_min);
        rand_y = y_min + rand()*(y_max-y_min);
        rand_t = rand()*2*pi;
        
        % assign to particle
        p(i).x = rand_x;
        p(i).y = rand_y;
        p(i).theta = rand_t;
        p(i).G = particleTransform(rand_x, rand_y, rand_t);
    end

    particles = p;

end
