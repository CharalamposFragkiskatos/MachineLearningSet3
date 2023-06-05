function res = PHI(x, stars, circles,ab)
    a = ab(1:21,:);
    b = ab(22:42,:);
    h = 0.000005;
    res = 0;
    for i = 1:21
        res = res + a(i)*exp(-(norm(stars(i,:)-x)^2)/h);
        
    end
    for i = 1:21
        res = res + b(i)*exp(-(norm(circles(i,:)-x)^2)/h);
    end
end 