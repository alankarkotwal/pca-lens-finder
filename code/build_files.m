function outlist = build_files(dirname)

origDir = pwd;
cd(dirname);

files = dir;
noOfFiles = size(files);
outlist = cell(1, noOfFiles(1)-2);

for i=1:noOfFiles-2
    outlist{i} = files(i+2).name;
end

cd(origDir);