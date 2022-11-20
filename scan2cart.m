function cart = scan2cart(range)

    n = length(range);
    m = n - sum(isnan(range)) - sum(isinf(range));
    theta = linspace(0, 2*pi, n);

    x = zeros(m,1);
    y = zeros(m,1);
    
    j = 1;
    for i = 1:n
        x_temp = range(i)*cos(theta(i));
        y_temp = range(i)*sin(theta(i));
        
        if (~isinf(x_temp) && ~isnan(x_temp) && ~isinf(y_temp) && ~isnan(y_temp))
            x(j) = x_temp;
            y(j) = y_temp;
            j = j+1;
        end

    end
    
    cart = [x y];

end

