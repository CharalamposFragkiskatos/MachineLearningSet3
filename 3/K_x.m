function res = K_x(x, stars, circles)
    res = ones(2*21,1);
    h = 0.01;
    for i = 1:21
        y = stars(i,:);
        res(i) = exp(-norm(x-y)*norm(x-y)/h);
    end
    for i = 21:41
        y = circles(i-20,:);
        res(i) = exp(-norm(x-y)*norm(x-y)/h);
    end
    
end 