function cart = scan2cart(range)
    
    n = length(range);
    theta = linspace(0, 2*pi, n);

    x = zeros(n,1);
    y = zeros(n,1);
    
    for i = 1:n
        x(i) = range(i)*cos(theta(i));
        y(i) = range(i)*sin(theta(i));

    end
    
    x = x(~isnan(x));
    x = x(~isinf(x));
    y = y(~isnan(y));
    y = y(~isinf(y));

    cart = [x y];

end

