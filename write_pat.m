function [] = write_pat(file_name, A)

[ClassesNumber x] = size(A); % no. of classes
[x FeaturesNumber] = size(A{1}); % nmuber of features

TotPattern = 0; % total number of tuples
for i=1:ClassesNumber
    [PatternNumber(i) x]=size(A{i}); % PatternNumber is a vector tha stores records of each class
    TotPattern = TotPattern + PatternNumber(i);
end

fid=fopen(file_name,'wt');
fprintf(fid,'Matlab generated pat file\n\n');
fprintf(fid,'number of features: %d \n',FeaturesNumber);
fprintf(fid,'number of classes: %d \n',ClassesNumber);
fprintf(fid,'number of patterns: %d \n\n',TotPattern);

count=1;
for i=1:ClassesNumber
    for j=1:PatternNumber(i)
        fprintf(fid,'P%d ',count);
        for n=1:FeaturesNumber
            fprintf(fid,'%f ',A{i}(j,n));
        end
        fprintf(fid,'\n');  
        
        fprintf(fid,'Target ');
        for n=1:ClassesNumber
            if n==i fprintf(fid,'1 ');
            else fprintf(fid,'0 ');    
            end
        end
        fprintf(fid,'\n');  
        count = count + 1;
    end
end
fclose(fid);