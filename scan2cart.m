function cart = scan2cart(range)

    n = length(range);
    theta = linspace(0, 2*pi, n);
    
    x = zeros(720,1);
    y = zeros(720,1);
    
    for i = 1:length(theta)
        x(i) = range(i)*cos(theta(i));
        y(i) = range(i)*sin(theta(i));
    end
    
    cart.x = x;
    cart.y = y;

end

