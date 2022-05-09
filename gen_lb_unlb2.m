function [Xlabel,tlabel,Xunlabel,tunlabel]=gen_lb_unlb2(X,t) % X is features and t is class label
    Xlabel=[];
    Xunlabel=[];
    tlabel=[];
    tunlabel=[];
    for i=1:max(t) % loop no. of classes times
        k=1;
        Xtemp=[];
        ttemp=[];
        for j=1:size(X,1) % size(x,1) means no. of tuples present in X
            if(t(j)==i)
                Xtemp(k,:)=X(j,:);
                ttemp(k)=i;
                k=k+1;
            end     
        end     
        bb=randperm(size(Xtemp,1)); 
        k=1;
        Xlabeltemp=[];
        tlabeltemp=[];
        Xunlabeltemp=[];
        tunlabeltemp=[];
      
        for j=1:round(((size(Xtemp,1)*10)/100)) % 10percent of tuples for training
            Xlabeltemp(k,:)=Xtemp(bb(j),:);
            tlabeltemp(k)=i;
            k=k+1;
        end
        k=1;
        for j=round(((size(Xtemp,1)*10)/100))+1:size(Xtemp,1) % remaining 90percent to be predicted
            Xunlabeltemp(k,:)=Xtemp(bb(j),:);
            tunlabeltemp(k)=i;
            k=k+1;
        end
        Xlabel=[Xlabel; Xlabeltemp];
        Xunlabel=[Xunlabel; Xunlabeltemp];
        tlabel=[tlabel tlabeltemp];
        tunlabel=[tunlabel tunlabeltemp];
    end