function [A]=read_iris_file(filename)
fid=fopen(filename,'r');
FeaturesNumber=4; % number of features
ClassesNumber=3; % number of class labels
PatternsNumber=150; % number of tuples or records
A=cell(ClassesNumber,1); %cell returns a ClassesNimber * 1 size of array

for i=1:PatternsNumber %loop will go to 1 to 150.
    pattern=zeros(1,FeaturesNumber);  %[0 0 0 0].
    for j=1:FeaturesNumber
        pattern(j)=fscanf(fid,'%f',1) % store all the features of a record respectively in the array called pattern
        tline=fgets(fid,1); %  skip the feature separators
    end
    tline=fgetl(fid) % finally store the class label of particular tuple and identify the class labels
    
    if(strcmp(tline,'Iris-setosa'))
        class=1;
    end
    if (strcmp(tline,'Iris-versicolor'))
        class=2;
    end
    if (strcmp(tline,'Iris-virginica'))
        class=3;
    end
    A{class}=[A{class}; pattern]; % cell array that stores features of tuples in matrices w.r.t. class label
end