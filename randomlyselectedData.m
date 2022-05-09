function randomlyselectedData(Train,TrainClass)

for i=1:1:4
    
    [Xlabel,tlabel,Xunlabel,tunlabel]=gen_lb_unlb2(Train, TrainClass);

    file1=sprintf('C://Users//Jayanta//Documents//coding//matlab//sample//data//Xlabel%d',i);
    file2=sprintf('C://Users//Jayanta//Documents//coding//matlab//sample//data//tlabel%d',i);
    file3=sprintf('C://Users//Jayanta//Documents//coding//matlab//sample//data//Xunlabel%d',i);
    file4=sprintf('C://Users//Jayanta//Documents//coding//matlab//sample//data//tunlabel%d',i);

    save(file1,'Xlabel');
    save(file2,'tlabel');
    save(file3,'Xunlabel');
    save(file4,'tunlabel');
end

    
    

