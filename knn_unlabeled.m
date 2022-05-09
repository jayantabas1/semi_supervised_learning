function [] = knn_unlabeled(K_)
all_accuracy=zeros(10,1);
for findx=1:10
    xfile=sprintf('C://Users//Jayanta//Documents//coding//matlab//sample//data//Xlabel%d',findx);
    yfile=sprintf('C://Users//Jayanta//Documents//coding//matlab//sample//data//tlabel%d',findx);
    ufile=sprintf('C://Users//Jayanta//Documents//coding//matlab//sample//data//Xunlabel%d',findx);
    yunfile=sprintf('C://Users//Jayanta//Documents//coding//matlab//sample//data//tunlabel%d',findx);
    
    X=load(xfile);
    Y=load(yfile);
    U=load(ufile);
    Yu=load(yunfile);
    
    X=X.Xlabel;
    Y=Y.tlabel;
    U=U.Xunlabel;
    Yu=Yu.tunlabel;
    
    % this will help in finding how many unique classes we have in any
    % dataset.
    class=unique(Y);
    
    %Calculate Centroid
    centroid= zeros(size(class,2),size(X,2)); %3 *4
    count = zeros(size(class,2),1); %3 *1
    
    for i=1:size(X,1)
        % the training datas will be keep on adding with respective to the
        % value of Y. for example if the value of Y is 1 then the 1rst row
        % of centroid will be updated as well as the count.
        centroid(Y(1,i),:) = centroid(Y(1,i),:)+X(i,:);
        count(Y(1,i),1)=count(Y(1,i),1)+1;
    end
    centroid=centroid./count;
    
    %check_count=10; %count to check for maximum distance points
    to_remove = int16.empty(0,1);
    %Assign labels to unlabeled data
    for i=1:size(class,2)
        dist=zeros(size(U,1),1); %dist = 135 *1
        for j=1:size(U,1)
            dist(j,1)=norm(U(j,:)-centroid(i,:));
        end
        [out,sorted_indx] = sort(dist); % sort function is returning the
        %indexes of the elements. out is the sorted dist matrix.
        
      %{
           max_indx=sorted_indx(end-check_count+1:end,1);
        for k=1:size(max_indx,1)
            class=knn_predict(3,X,Y,U(max_indx(k),:));
            X=[X;U(max_indx(k),:)];
            to_remove=[to_remove;max_indx(k)];
            Y=[Y,class];
        end
        %}
     
        min_indx=sorted_indx(1:15);
        disp(min_indx);
        new_class = zeros(size(min_indx,1),1);
        probabilities = zeros(size(min_indx,1),1);
        for k=1:size(min_indx,1)
            [class,prob]=knn_predict(5,X,Y,U(min_indx(k),:));
            new_class(k) =new_class(k) + class;
            probabilities(k) = probabilities(k)+ prob;
        end
        % finding the probabilities of 15 tuples and sorting them in
        % decreasing order.
        [probabilities, indx] = sort(probabilities,'descend');
        new_class = new_class(indx);
        min_indx = min_indx(indx);
        X = [X;U(min_indx(1:5),:)]; % appending rowwise the newly labelled tuples.
        to_remove=[to_remove;min_indx(1:5)];
        Y = Y';
        Y=[Y;new_class(1:5)];% appending the class labels.
        Y = Y';
    end
    
    %remove assigned unlabeled values
    to_remove=unique(to_remove,'rows');
    
    to_remove=sort(to_remove,'descend');
    for i=1:size(to_remove,1)
        U(to_remove(i),:)=[];
        Yu(:,to_remove(i))=[];
    end
    
    %Predict and check accuracy
    predictions=zeros(size(U,1),1);
    dist=zeros(size(X,1),1);
    for u=1:size(U,1)
        for i=1:size(X,1)
            dist(i,1)=norm(X(i,:)-U(u,:));
        end
        
        [out,idx]=sort(dist);
    
        selected=Y(idx(1:K_,1));
    
        class=mode(selected);
        predictions(u,1)=class;
    end
    all_accuracy(findx,1)=accuracy(predictions,Yu);
end

disp(all_accuracy);