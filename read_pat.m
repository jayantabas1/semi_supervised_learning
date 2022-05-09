function [A] = read_pat(file_name)

fid=fopen(file_name,'r');
tline = fgetl(fid);
tline=fgets(fid,1);
while (strcmp(tline, ':')~=1)
    tline=fgets(fid,1);
end
tline=fscanf(fid,'%s',1);
FeaturesNumber = str2num(tline)

tline=fgets(fid,1);
while (strcmp(tline, ':')~=1)
    tline=fgets(fid,1);
end
tline=fscanf(fid,'%s',1);
ClassesNumber = str2num(tline)

tline=fgets(fid,1);
while (strcmp(tline, ':')~=1)
    tline=fgets(fid,1);
end
tline=fscanf(fid,'%s',1);
PatternsNumber = str2num(tline) % here patternsNumber mean no. of tuples

A=cell(ClassesNumber,1);

tline = fgetl(fid);
    
for i=1:PatternsNumber
    tline = fscanf(fid, '%s', 1);
    while (~strfind(tline, 'P') && ~strfind(tline, 'p'));
        tline=fscanf(fid, '%s', 1);
    end
    
    for j=1:FeaturesNumber
        pattern(j) = fscanf(fid, '%f' ,1);
    end
    tline = fscanf(fid, '%s' ,1);
    if (strcmp(tline, 'Target')~=1) && (strcmp(tline, 'target')~=1)
        disp(['errore al campione numero ', num2str(i)]);
    else
        for j=1:ClassesNumber;
            tline = fscanf(fid, '%d' ,1);
            if (tline==1); classe=j; fgetl(fid); break; end;
        end
    end
    
    A{classe}=[A{classe}; pattern];
end

