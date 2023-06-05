function res = add(cluster,index)
    res = cluster(:)';
    exists = 0;
    for i = 1:length(cluster)
        if cluster(i) == index
            exists = 1;
        end
   
    end
    if exists == 0
        res(end+1) = index;
    end
    
end 