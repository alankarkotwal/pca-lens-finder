function outlist = build_files(dirname)

% This function generates a cellstr of all imagenames in directory dirname
% Expects: string
% Outputs: cellstr

origDir = pwd;
cd(dirname);

files = dir;
noOfFiles = size(files);
outlist = cell(1, noOfFiles(1)-2);

for i=1:noOfFiles-2
    outlist{i} = [dirname '/' files(i+2).name];
end

cd(origDir);