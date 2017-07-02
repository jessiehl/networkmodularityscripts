dirString = 'C:\Users\jessiehl\Documents\DEMO\GrandTheoryOfModularity\neat4j_1_0_src\results\is\run1\';
dirData = dir(dirString);
dirIndex = [dirData.isdir];
fileList = {dirData(~dirIndex).name}';
y = zeros(1,length(fileList));
y2 = zeros(1,length(fileList));
y3 = zeros(1,length(fileList));
y4 = zeros(1,length(fileList)); % third level modularity because apparently that happens!
for i=1:length(fileList)
    num = strsplit(fileList{i}, 'Gen');
    num = strsplit(num{2}, '.');
    num = str2num(num{1});
    mod = one_gen_louvain_mod([dirString fileList{i}]);
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
%x = linspace(1, 1, length(fileList));
plot(y);
hold on;
figure;
plot(y2, 'o');
figure;
plot(y3);
figure;
plot(y4);