%addpath('\iris.pat')
%%%%%%%%%training set%%%%%%%%%%%%%%
[A] = read_pat('iris.pat');
Train=[];
TrainClass=[];
for i=1:1:size(A,1) % size(A,1) means number of classes
    Train=[Train; A{i}];
    TrainClass=[TrainClass; ones(size(A{i},1),1)*i];
end

randomlyselectedData(Train,TrainClass);