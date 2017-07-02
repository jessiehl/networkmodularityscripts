function [ ys1 ys2 ys3 ys4 ] = louvain_across_runs( basedir )
    num = 0; %initialize
    ys1 = zeros(1, 500);
    ys2 = zeros(1, 500);
    ys3 = zeros(1, 500);
    ys4 = zeros(1, 500);
    for r=1:10
        runIdx = r-1;
        runStr = strcat('run', num2str(runIdx));
        runStr = strcat(runStr, '\');
        dirString = strcat(basedir, runStr);
        dirData = dir(dirString);
        dirIndex = [dirData.isdir];
        fileList = {dirData(~dirIndex).name}';
        y = zeros(1,500);
        y2 = zeros(1,500);
        y3 = zeros(1,500);
        y4 = zeros(1,500); % third level modularity because apparently that happens!
        for i=1:500
            if(length(fileList) < i)
                num = num+1;
                y(num+1) = NaN;
                y2(num+1) = NaN;
                y3(num+1) = NaN;
                y4(num+1) = NaN;
            else
                if(size(strfind(fileList{i}, 'GenSpeciesHashmap.txt'), 2) > 0)
                    fileList(i) = [];
                    %i = i-1;
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
        ys1 = [ys1; y];
        ys2 = [ys2; y2];
        ys3 = [ys3; y3];
        ys4 = [ys4; y4];
    end
    % Get rid of that first row of zeros
    ys1 = ys1(2:end,:);
    ys2 = ys2(2:end,:);
    ys3 = ys3(2:end,:);
    ys4 = ys4(2:end,:);
end

