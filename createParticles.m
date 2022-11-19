%% put particles between a certain limit of coordinates

function particles = createParticles(n,x_range,y_range)

    x_min = 2; %(x_range(2)-x_range(1))/2;
    x_max = x_range(2);
    y_min = y_range(1);
    y_max = -1; %y_min + (y_range(2)-y_range(1))/2.5;

    p = struct('x',{},'y',{},'theta',{});
    
    for i = 1:n
        randi = x_min + rand()*(x_max-x_min);
        randj = y_min + rand()*(y_max-y_min);
        rando = rand()*2*pi;

        p(i).x = randi;
        p(i).y = randj;
        p(i).theta = rando;
        
    end

    particles = p;

end
