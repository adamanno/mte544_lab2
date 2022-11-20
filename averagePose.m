function avg = averagePose(p)
    n = length(p);
    x_temp = 0;
    y_temp = 0;
    t_temp = 0;
    
    for i = 1:n
        x_temp = x_temp + p(i).x;
        y_temp = y_temp + p(i).y;
        t_temp = t_temp + p(i).theta;
    end

    avg = [x_temp/n, y_temp/n, t_temp/n];
end

