function res = remove(cluster,index)
    
    res = cluster(:)';
    exists = 0;
    for i = 1:length(cluster)
        if cluster(i) == index
            exists = 1;
            position = i;
        end
   
    end
    if exists == 1
        res(position) = [];
    end
    
end 