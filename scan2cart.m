function cart = scan2cart(range)
    
    n = length(range);
    theta = linspace(0, 2*pi, n);

    x = zeros(n,1);
    y = zeros(n,1);
    
    % Convert range data in polar coordinates to cartesian coordinates
    for i = 1:n
        x(i) = range(i)*cos(theta(i));
        y(i) = range(i)*sin(theta(i));

    end
    
    % Remove invalid ranges (i.e. nan or inf)
    x = x(~isnan(x));
    x = x(~isinf(x));
    y = y(~isnan(y));
    y = y(~isinf(y));

    cart = [x y];

end

