% this is intended to be the main function for tracking.
% It requires a folder to be input. This folder should contain the images
% which were tracked, and the matching trackmate output files. There should
% only be one set of output files per image otherwise it will error.

function analysisTest(folder)

dataFormat = '%f';

% get a list of all files that have a tif ending; these are our images

tifFileList = dir(fullfile(folder,'*.tif'));
totalTracks = 0;

% loop through each image
for i = 1:numel(tifFileList)
    
    % find the name of the cell so we can find its matching trajectory
    % output files
    cellName = [tifFileList(i).name(1:end-4),'_'];
    disp('')
    disp('---')
    disp('')
    disp('Analysing new file')
    disp(cellName)
    
    % find the matching xPos, yPos, intensity, trackNum files
    % there should only be one in each case, otherwise it will crash
    xPosFile = dir(fullfile(folder,[cellName,'*xPos.txt']));
    yPosFile = dir(fullfile(folder,[cellName,'*yPos.txt']));
    intensityFile = dir(fullfile(folder,[cellName,'*intensity.txt']));
    trackNumFile = dir(fullfile(folder,[cellName,'*numTracks.txt']));
    
    % find out how many tracks were found on this cell by looking in the
    % trackNum file. This is easier than opening xPos or yPos and counting
    % number of rows
    
    % First check we have the right number of files
    
    if numel(trackNumFile) ~= 1
        error('ERROR: Either no trackNum file, or too many');
    end
    
    % if is OK then open
    openFile = fopen([folder,'/',trackNumFile.name]);
    numTracks = fscanf(openFile,dataFormat,[1]); % there is only one number in this file

    fclose(openFile); % REMEMBER TO CLOSE!!!
    
    totalTracks = totalTracks + numTracks;
    
    % just check quickly that we only found one set of matching text files
    if (numel(xPosFile)==1) && (numel(yPosFile)==1) && (numel(intensityFile)==1)
        
        % read the files into MATLAB
        [xPos,yPos,intensity] = readTrackMateCellFiles([folder,'/',xPosFile.name],[folder,'/',yPosFile.name],[folder,'/',intensityFile.name],numTracks);
        
        % read in the image as well
        imageMatch = tiffread([folder,'/',tifFileList(i).name]);
        
        if i==1
            cellStruct = calculateTrajectoryInfoStruct(cellName(1:end-1),xPos,yPos,intensity,numTracks,imageMatch,0,0);
            currentIndex = numTracks;
            disp('size struct')
            size(cellStruct)
        else
            % second to last argument passed here is stepThreshold - being
            % ignored atm so set to zero
            cellStruct(currentIndex+1:currentIndex+numTracks) = calculateTrajectoryInfoStruct(cellName(1:end-1),xPos,yPos,intensity,numTracks,imageMatch,0);
            currentIndex = currentIndex + numTracks;
        end
    end
    
    % matlab has a silly thing, where this sequence of commands
    % A = [1;2]; A(3:4) = [3;4]
    % B = [1]; B(2:4) = [2;3;4]
    % leads to A being (1;2;3;4) (column vector)
    % and B being (1,2,3,4) (row vector)
    % in our case if the first cell only has one trajectory, we get
    % cellStruct being in the second case, and being a row structure 1xn
    % whilst if the first cell has more than one we get the first case, and
    % cellStruct is a column structure nx1. This is annoying later, so if
    % we are in the 1xn case we do a transpose before saving.
    
    if size(cellStruct,1) < size(cellStruct,2)
        cellStruct = cellStruct';
    end

    save([folder,'/analysed.mat'],'cellStruct')
    
end

disp(['There should have been ',num2str(totalTracks),' tracks'])