% takes in a cell array of file locations for .mat files for each condition and
% compiles them into one struct per condition

function compileStructData(fileLocs,saveLocation)

% load the individual data
data = cell(1);

for i=1:numel(fileLocs)
    data{i} = load(fileLocs{i});
end

% conglomerate these into one big struct
dataStruct = data{1}.cellStruct;

for i=2:numel(data)
    dataStruct = [dataStruct;data{i}.cellStruct];
end

% initialise variables for our new struct which will be a 1x1 struct with
% fields

allStruct.data = dataStruct; % store all the data used to construct other fields
allStruct.timeScale = 0.033; % this is the scaling from frames to s
allStruct.spaceScale = 0.097*0.097; % scaling from px^2 to um^2
allStruct.MSD50 = zeros(1,44); % all MSD from single fluorophores where track existed for at least 50 frames
allStruct.MSD75 = zeros(1,75);
allStruct.MSD100 = zeros(1,100); % all MSD from single fluorophores where track existed for at least 100 frames
allStruct.MSDLongAxis50 = zeros(1,44);
allStruct.MSDLongAxis75 = zeros(1,75);
allStruct.MSDLongAxis100 = zeros(1,100);
allStruct.MSDShortAxis50 = zeros(1,44);
allStruct.MSDShortAxis75 = zeros(1,75);
allStruct.MSDShortAxis100 = zeros(1,100);
allStruct.MSD50Group0 = zeros(1,44);
allStruct.MSD50Group2 = zeros(1,44);
allStruct.MSD50Group3 = zeros(1,44);

allStruct.asymptotes = zeros(1);
allStruct.Dlinear = zeros(1);
allStruct.DlinearLongAxis = zeros(1);
allStruct.DlinearShortAxis = zeros(1);
allStruct.asymptotesLongAxis = zeros(1);
allStruct.asymptotesShortAxis = zeros(1);
allStruct.alphas = zeros(1);

allStruct.asymptotes75 = zeros(1);
allStruct.Dlinear75 = zeros(1);
allStruct.DlinearLongAxis75 = zeros(1);
allStruct.DlinearShortAxis75 = zeros(1);
allStruct.asymptotesLongAxis75 = zeros(1);
allStruct.asymptotesShortAxis75 = zeros(1);
allStruct.alphas75 = zeros(1);

allStruct.asymptotes100 = zeros(1);
allStruct.Dlinear100 = zeros(1);
allStruct.DlinearLongAxis100 = zeros(1);
allStruct.DlinearShortAxis100 = zeros(1);
allStruct.asymptotesLongAxis100 = zeros(1);
allStruct.asymptotesShortAxis100 = zeros(1);
allStruct.alphas100 = zeros(1);

% fill in the values for these fields

% we then go through and find the groups and their MSDs
% what we want saved are, the MSD values 1:50 of single fluorophores for
% those with an MSD of at least 50
% the MSD values 1:100 of single fluorophores for those with an MSD of at
% least 100

MSD50temp = zeros(1,44);
MSD75temp = zeros(1,75);
MSD100temp = zeros(1,100);
MSDLongAxis50temp = zeros(1,44);
MSDLongAxis75temp = zeros(1,75);
MSDLongAxis100temp = zeros(1,100);
MSDShortAxis50temp = zeros(1,44);
MSDShortAxis75temp = zeros(1,75);
MSDShortAxis100temp = zeros(1,100);

asymptotes = zeros(1);
asymptotesLongAxis = zeros(1);
asymptotesShortAxis = zeros(1);
Dlinear = zeros(1);
DlinearLongAxis = zeros(1);
DlinearShortAxis = zeros(1);
alphas = zeros(1);

asymptotes75 = zeros(1);
asymptotesLongAxis75 = zeros(1);
asymptotesShortAxis75 = zeros(1);
Dlinear75 = zeros(1);
DlinearLongAxis75 = zeros(1);
DlinearShortAxis75 = zeros(1);
alphas75 = zeros(1);

asymptotes100 = zeros(1);
asymptotesLongAxis100 = zeros(1);
asymptotesShortAxis100 = zeros(1);
Dlinear100 = zeros(1);
DlinearLongAxis100 = zeros(1);
DlinearShortAxis100 = zeros(1);
alphas100 = zeros(1);

index50 = 1;
index75 = 1;
index100 = 1;

count = 0;

for i=1:numel(dataStruct)
    % check if single
    if dataStruct(i).group == 1
        count = count + 1;
        % save the asymptote and Dlinear data (this does not depend on MSD
        % length)
        
        % if single check length
        % we actually check if greater than or equal to 44, as the shortest
        % trajectory can be is 44 frames
        if numel(dataStruct(i).MSD)>=44
            MSD50temp(index50,1:44) = dataStruct(i).MSD(1:44);
            asymptotes(index50) = dataStruct(i).asymptote;
            asymptotesLongAxis(index50) = dataStruct(i).asymptoteLongAxis;
            asymptotesShortAxis(index50) = dataStruct(i).asymptoteShortAxis;

            Dlinear(index50) = dataStruct(i).Dlinear;
            DlinearLongAxis(index50) = dataStruct(i).DlinearLongAxis;
            DlinearShortAxis(index50) = dataStruct(i).DlinearShortAxis;
            alphas(index50) = dataStruct(i).alpha;
            
            % problem is that MSDlongAxis and MSDshortAxis are only set if
            % we could find the long axis so check for this
            
            if numel(dataStruct(i).MSDlongAxis) > 0
                MSDLongAxis50temp(index50,1:44) = dataStruct(i).MSDlongAxis(1:44);
                MSDShortAxis50temp(index50,1:44) = dataStruct(i).MSDshortAxis(1:44);
                
            % otherwise we stick nans everywhere
            else
                MSDLongAxis50temp(index50,1:44) = NaN(1,44);
                MSDShortAxis50temp(index50,1:44) = NaN(1,44);
            end
            index50 = index50 + 1;
        end
        
        % also save those MSD that go greater than 75 frames, to see if we can
        % learn anything from these
        % here we do not take into account the problem with losing
        % initial/starting points
        if numel(dataStruct(i).MSD)>=75
            MSD75temp(index75,1:75) = dataStruct(i).MSD(1:75);
            asymptotes75(index75) = dataStruct(i).asymptote;
            asymptotesLongAxis75(index75) = dataStruct(i).asymptoteLongAxis;
            asymptotesShortAxis75(index75) = dataStruct(i).asymptoteShortAxis;

            Dlinear75(index75) = dataStruct(i).Dlinear;
            DlinearLongAxis75(index75) = dataStruct(i).DlinearLongAxis;
            DlinearShortAxis75(index75) = dataStruct(i).DlinearShortAxis;
            alphas75(index75) = dataStruct(i).alpha;
            
            if numel(dataStruct(i).MSDlongAxis) > 0
                MSDLongAxis75temp(index75,1:75) = dataStruct(i).MSDlongAxis(1:75);
                MSDShortAxis75temp(index75,1:75) = dataStruct(i).MSDshortAxis(1:75);
            else
                MSDLongAxis75temp(index75,1:75) = NaN(1,75);
                MSDShortAxis75temp(index75,1:75) = NaN(1,75);
            end
            index75 = index75 + 1;
        end
        
        % also save those MSD that go greater than 100, to see if we can
        % learn anything from these
        % here we do not take into account the problem with losing
        % initial/starting points
        if numel(dataStruct(i).MSD)>=100
            MSD100temp(index100,1:100) = dataStruct(i).MSD(1:100);
            asymptotes100(index100) = dataStruct(i).asymptote;
            asymptotesLongAxis100(index100) = dataStruct(i).asymptoteLongAxis;
            asymptotesShortAxis100(index100) = dataStruct(i).asymptoteShortAxis;

            Dlinear100(index100) = dataStruct(i).Dlinear;
            DlinearLongAxis100(index100) = dataStruct(i).DlinearLongAxis;
            DlinearShortAxis100(index100) = dataStruct(i).DlinearShortAxis;
            alphas100(index100) = dataStruct(i).alpha;
            
            if numel(dataStruct(i).MSDlongAxis) > 0
                MSDLongAxis100temp(index100,1:100) = dataStruct(i).MSDlongAxis(1:100);
                MSDShortAxis100temp(index100,1:100) = dataStruct(i).MSDshortAxis(1:100);
            else
                MSDLongAxis100temp(index100,1:100) = NaN(1,100);
                MSDShortAxis100temp(index100,1:100) = NaN(1,100);
            end
            index100 = index100 + 1;
        end
    end
end


allStruct.MSD50 = MSD50temp;
allStruct.MSD75 = MSD75temp;
allStruct.MSD100 = MSD100temp;
allStruct.MSDLongAxis50 = MSDLongAxis50temp;
allStruct.MSDLongAxis75 = MSDLongAxis75temp;
allStruct.MSDLongAxis100 = MSDLongAxis100temp;
allStruct.MSDShortAxis50 = MSDShortAxis50temp;
allStruct.MSDShortAxis75 = MSDShortAxis75temp;
allStruct.MSDShortAxis100 = MSDShortAxis100temp;

allStruct.asymptotes = asymptotes;
allStruct.Dlinear = Dlinear;
allStruct.DlinearLongAxis = DlinearLongAxis;
allStruct.DlinearShortAxis = DlinearShortAxis;
allStruct.asymptotesLongAxis = asymptotesLongAxis;
allStruct.asymptotesShortAxis = asymptotesShortAxis;
allStruct.alphas = alphas;

allStruct.asymptotes75 = asymptotes75;
allStruct.Dlinear75 = Dlinear75;
allStruct.DlinearLongAxis75 = DlinearLongAxis75;
allStruct.DlinearShortAxis75 = DlinearShortAxis75;
allStruct.asymptotesLongAxis75 = asymptotesLongAxis75;
allStruct.asymptotesShortAxis75 = asymptotesShortAxis75;
allStruct.alphas75 = alphas75;

allStruct.asymptotes100 = asymptotes100;
allStruct.Dlinear100 = Dlinear100;
allStruct.DlinearLongAxis100 = DlinearLongAxis100;
allStruct.DlinearShortAxis100 = DlinearShortAxis100;
allStruct.asymptotesLongAxis100 = asymptotesLongAxis100;
allStruct.asymptotesShortAxis100 = asymptotesShortAxis100;
allStruct.alphas100 = alphas100;

save(saveLocation,'allStruct')