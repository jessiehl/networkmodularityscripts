function [y y2 y3 y4] = louvain_single_run(dirString)
dirData = dir(dirString);
dirIndex = [dirData.isdir];
fileList = {dirData(~dirIndex).name}';
y = zeros(1,length(fileList));
y2 = zeros(1,length(fileList));
y3 = zeros(1,length(fileList));
y4 = zeros(1,length(fileList)); % third level modularity because apparently that happens!
for i=1:length(fileList)    
    if(size(strfind(fileList{i}, 'GenSpeciesHashmap.txt'), 2) > 0)
        continue;
    end
    num = strsplit(fileList{i}, 'Gen');
    num = strsplit(num{2}, '.');
    num = str2num(num{1});
    mod = gp_one_gen_louvain_mod([dirString fileList{i}]);
    y(num+1) = mod(1);
    y2(num+1) = length(mod)-1;
    if length(mod) > 2
        y3(num+1) = mod(2);
    else
        y3(num+1) = 0;
    end
    if length(mod) > 3
        y4(num+1) = mod(3);
    else
        y4(num+1) = 0;
    end
end
end