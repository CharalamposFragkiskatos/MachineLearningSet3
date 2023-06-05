function res = exists(cluster,index)
    res = false;
    for i = 1:length(cluster)
        if cluster(i) == index
            res = true;
            break;
        end
    end
    
end 