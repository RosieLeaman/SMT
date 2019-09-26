% takes in a cell array of file locations for .mat files for each condition and
% compiles them into one struct per condition

% simplified version, simply puts all the data together and does not do any
% analysis

function compileStructDataSimple(fileLocs,saveLocation)

% load the individual data
data = cell(1);

for i=1:numel(fileLocs)
    data{i} = load(fileLocs{i});
    % check if there were any trajectories?
    if numel(data{i}.cellStruct) > 0
        for j=1:numel(data{i}.cellStruct)
            % but also we want to add an identifier so that we know which experiment we
            % belong to
            data{i}.cellStruct(j).experimentID = i;
        end
    end
end

data{1}.cellStruct(2).experimentID

% conglomerate these into one big struct
dataStruct = data{1}.cellStruct;

for i=2:numel(data)
    if numel(data{i}.cellStruct) > 0
        data{i}.cellStruct(1).cellName
        dataStruct = [dataStruct;data{i}.cellStruct];
    end
end

save(saveLocation,'dataStruct')