function [class,prob] = knn_predict(k,X,Y,p)
    dist=zeros(size(X,1),1);
    for i=1:size(X,1)
        %dist(i,1)=norm(X(i,:)-p);
        dist(i,1) = distance(X(i,:), p); 
    end
    
    [out,idx]=sort(dist);
    
    Y=transpose(Y);
    
    selected=Y(idx(1:k));
       
    class=mode(selected);
    
    count=sum(selected(:)==class);
    
    prob=count/k;
end

