function res = findCenter(cluster,X)
    res = 0;
    for i = 1:length(cluster)
        res = res+ X(:,cluster(i));
        
    end
    res = res/length(cluster);
    
end 