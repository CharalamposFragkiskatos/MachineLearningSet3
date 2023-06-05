function res = f(x,h,Xi)
    N = length(Xi);
    res = 0;
    for i =1:N
        res = res + K(x-Xi(i), h);
    end
    res= res/N;
end 