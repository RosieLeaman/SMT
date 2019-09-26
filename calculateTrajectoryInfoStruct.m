% main tracking function.

function cellStruct = calculateTrajectoryInfoStruct(cellName,xPos,yPos,intensity,numTracks,imageMatch,plotYes)

% calculate some information about the cell that is not specific to each
% trajectory, i.e. the long axis position

firstFrame = imageMatch(1).data;
lastFrame = imageMatch(numel(imageMatch)).data;
BG_level = mean(lastFrame(:));

[top,bottom] = findBugLength(firstFrame);

% save analysis parameter information 

leftIntensityBuffer = 50;
rightIntensityBuffer = 25;

% set up the struct that will contain all our data

cellStruct.cellName = cellName; % name of matching image so we can match data to it later
cellStruct.trackLen = 0; % length of trajectory in frames before removing long jumps
cellStruct.trajNum = 0; % index of this trajectory on this cell, needed for checking
cellStruct.x = []; % x coordinates from trackmate
cellStruct.y = []; % y coordinates from trackmate
cellStruct.shortX = []; % x coordinates from trackmate stripped of leading and trailing zeros
cellStruct.shortY = []; % y coordinates from trackmate stripped of leading and trailing zeros
cellStruct.frameStart = 0; % frame on which trajectory starts
cellStruct.frameEnd = 0; % frame on which trajectory ends
cellStruct.top = top; % position of the top of the cell in the matching image. It is [x coord, y coord]. This is NaN if it wasn't able to be determined.
cellStruct.bottom = bottom; % same as above but for bottom of the cell
cellStruct.avgPos = []; % average position calculated from the original x-y data
cellStruct.removedPoints = []; % index numbers of any coordinates removed from the original x-y data. This is the index of the frames moved in the shortX, shortY data (it has had leading and trailing zeros removed)
cellStruct.newX = []; % the new x coordinates after removing the above points
cellStruct.newY = []; % same but for y
cellStruct.newAvgPos = []; % new average position calculated from edited x-y data
cellStruct.alpha = 0; % normalised position along the long axis of newAvgPos
cellStruct.sameTracks = 0; % notes any trajectories with higher index that are in the 'same place' as the current track and occur within five frames of this track ending
cellStruct.secondPiece = 0; % this is 1 if this trajectory has a trajectory with a lower index that is in the same place as this one and ended within five frames of this one starting
cellStruct.MSD = []; % this saves the 2-D MSD curve calculated via interval method on newX and newY
cellStruct.MSD2 = []; % this saves the 2-D MSD curve calculated via the from origin method on newX and newY. It is not currently calculated for trajectories that are in pieces.
cellStruct.Dlinear = 0; % estimate of the diffusion coefficient from the linear section of the MSD curve
cellStruct.DlinearError = 0; % IS NOT CURRENTLY SET. 
cellStruct.asymptote = 0; % estimate of the asymptote of the MSD curve calculated frome MSD. If it can't be calculated this is NaN
cellStruct.asymptoteError = 0; % estimate of the error in the asymptote error (it's the residual)
cellStruct.longAxis = []; % coordinates of the long axis
cellStruct.shortAxis = []; % coordinates of the short axis
cellStruct.fakeLongAxis = []; % a randomly chosen unit vector
cellStruct.fakeShortAxis = []; % perpendicular to fakeLongAxis
cellStruct.longAxisCoords = []; % the LA component of the shortX, shortY coordinates basis changed to a basis of (LA,SA)
cellStruct.shortAxisCoords = []; % the SA component of the shortX, shortY coordinates basis changed to a basis of (LA,SA)
cellStruct.fakeLongAxisCoords = []; % same as above but wrt fakeLongAxis, a randomly chosen long axis
cellStruct.fakeShortAxisCoords = []; % same as above but wrt fakeShortAxis
cellStruct.MSDshortAxis = []; % the 1D MSD curve calculated via intervals from the SA components
cellStruct.MSDlongAxis = []; % the 1D MSD curve calculated via intervals from the LA components
cellStruct.MSDfakeShortAxis = [];  % the 1D MSD curve calculated via intervals from the fake SA components
cellStruct.MSDfakeLongAxis = [];  % the 1D MSD curve calculated via intervals from the fake LA components
cellStruct.asymptoteLongAxis = 0; % estimate of the MSD asymptote for the LA MSD
cellStruct.asymptoteShortAxis = 0; % estimate of the MSD asymptote for the SA MSD
cellStruct.DlinearLongAxis = 0; % estimate of the diffusion coefficient from the linear section of the LA MSD
cellStruct.DlinearShortAxis = 0; % estimate of the diffusion coefficient from the linear section of the LA MSD
cellStruct.intensity = []; % the intensity straight out of trackmate (includes trailing and leading zeros)
cellStruct.shortIntensity = []; % the intensity with trailing and leading zeros removed and some extra frames before start and after end calculated
cellStruct.leftIntensityBuffer = leftIntensityBuffer; % amount of frames to pad the 'short intensity' to the left by
cellStruct.rightIntensityBuffer = rightIntensityBuffer; % amount of frames to pad the 'short intensity' to the right by
cellStruct.filteredIntensity = []; % the chung-kennedy filtered shortIntensity
cellStruct.group = 0; % the step group [0 = unknown; 1=single; 2=multiple; 3=possibly single]
cellStruct.stepLocs = []; % locations of the steps (if for some reason we want to know)
cellStruct.stepSizes = []; % the sizes of the steps (arbitrary fluorophore units)


cellStruct = repmat(cellStruct,numTracks,1); % this repeats the struct format for as many tracks as we have

% calculate how long each trajectory is

trackLens = calcTrackLens(intensity,numTracks);

% on the first loop we just get rid of sketchy beginnings/ends of
% trajectories and save some preliminary data

disp('Removing sketchy initial/final jumps')
for traj = 1:numTracks
    disp('new traj')
    disp(traj)
    
    lenTrack = trackLens(traj);
    
    % save some preliminary information
    cellStruct(traj).trackLen = lenTrack;
    cellStruct(traj).trajNum = traj;
    
    
    [shortX,shortY] = makeShortTracks(xPos(:,traj),yPos(:,traj),lenTrack);
    
    % save the data straight from trackmate
    cellStruct(traj).x = xPos(:,traj);
    cellStruct(traj).y = yPos(:,traj);
    cellStruct(traj).intensity = intensity(:,traj);
    
    cellStruct(traj).shortX = shortX;
    cellStruct(traj).shortY = shortY;
    
    xPositive = find(xPos(:,traj)>0);
    cellStruct(traj).frameStart = min(xPositive);
    cellStruct(traj).frameEnd = max(xPositive);
    
    % find the average position
    
    avgPos = calcAveragePos(shortX,shortY);
    cellStruct(traj).avgPos = avgPos;
    
    % remove long initial and final jumps and save the new trajectories
    
    allSkip = findLargeJumps(shortX,shortY,avgPos);
    
    cellStruct(traj).removedPoints = allSkip;
    
    newX = shortX(setdiff(1:numel(shortX),allSkip));
    newY = shortY(setdiff(1:numel(shortY),allSkip));

%     allSkip = findLargeJumps(shortX,shortY,avgPos);
%     
%     cellStruct(traj).removedPoints = allSkip;
%     
%     newX = shortX;
%     newY = shortY;
%     
    % save the new x and y co ordinates
    
    cellStruct(traj).newX = newX;
    cellStruct(traj).newY = newY;
    
    % calculate a new average position from these new co ordinates
    
    newAvgPos = calcAveragePos(newX,newY);
    
    cellStruct(traj).newAvgPos = newAvgPos;
    
    % from the new average position calculate alpha, the normalised
    % distance along the long axis
    
    if ~isnan(top)
        [~,alpha] = nearestPointOnLine(top,bottom,newAvgPos);
    else
        alpha = NaN;
    end
    
    cellStruct(traj).alpha = alpha;
   
end

% now we need to find if there are two trajectories that are in the
% 'same place' and separated by <= 5 frames
% this is noted by in the lower numbered trajectory a list is added of
% trajectories that are in the 'same place'. In the higher numbered
% trajectory a note is added that this trajectory is a secondPiece, and
% should not have any further results calculated
% the MSD data and all further calculations will only be calculated for the
% first piece.
% In the case of a chain, i.e. trajectories 1,2 and 8 are all part of the
% same then 1 will have 2 in its same place list, and 2 will have 8 in its
% same place list. 2 will also say it is a secondPiece. The analysis of all
% three will end up in trajectory 1

% inside this loop we also calculate the LA, SA co-ordinates as this
% simplifies the following loop if these are pre-calculated here

disp('Finding trajectories in the same place')
disp('---')
for traj=1:numTracks
    
    sameTracks = 0;
    num = 1;
    
    for traj2 = traj+1:numTracks        
        trajAvg = cellStruct(traj).newAvgPos;
        traj2Avg = cellStruct(traj2).newAvgPos;
        dist = (trajAvg(1)-traj2Avg(1)).^2 + (trajAvg(2)-traj2Avg(2)).^2;
        
        % set the separation as average positions being less than two pixel
        % apart
        if dist < 2
            disp(['tracks ',num2str(traj),' and ',num2str(traj2),' are in the same place'])
            
            % we need to check whether the trajectories are within five
            % frames of each other
            % the lower numbered one (traj) should occur first
            if (cellStruct(traj2).frameStart - cellStruct(traj).frameEnd) <= 5
                sameTracks = traj2;
                num = num + 1;
                disp('These two occur within five frames')
                cellStruct(traj2).secondPiece = 1;
            else
                disp('But do not occur within five frames')
            end
            
        end  
            
    end
    
    if num > 1
        cellStruct(traj).sameTracks = sameTracks;
    end
    
    % turn the trajectories to (LA,SA) coordinates
    % we already have the long axis top and bottom co ordinates. From
    % these we calculate the vector that goes between them (u1,u2).
    % This is then normalised to give (w1,w2). To find the SA vector we
    % then reverse this v = (w2,-w1). The coordinates of the point (p1,p2) (x-y) in these
    % new coordinates is then (p dot w, p dot v)

    % note that top and bottom are stored as row vectors so we
    % transpose to get a column vector
    
    % second note; note that THIS ONLY WORKS IF WE FOUND THE LONG AXIS. If
    % not skip this step
    
    if ~isnan(cellStruct(traj).top)
        longAxisVec = (cellStruct(traj).top - cellStruct(traj).bottom)';
        fakeLongAxisVec = rand(2,1);
        
        % should be norm^2, not norm.
        longAxisVecNorm = dot(longAxisVec,longAxisVec);
        fakeLongAxisVecNorm = dot(fakeLongAxisVec,fakeLongAxisVec);

        longAxisVec = longAxisVec./longAxisVecNorm;
        fakeLongAxisVec = fakeLongAxisVec./fakeLongAxisVecNorm;

        shortAxisVec = [longAxisVec(2);-longAxisVec(1)];
        fakeShortAxisVec = [fakeLongAxisVec(2);-fakeLongAxisVec(1)];

        % we need to grab the modified X and Y coordinates for this

        shortX = cellStruct(traj).newX;
        shortY = cellStruct(traj).newY;

        longAxisCoords = zeros(1,numel(shortX));
        shortAxisCoords = zeros(1,numel(shortY));
        
        fakeLongAxisCoords = zeros(1,numel(shortX));
        fakeShortAxisCoords = zeros(1,numel(shortY));

        for point = 1:numel(shortX)
            longAxisCoords(point) = dot(longAxisVec,[shortX(point);shortY(point)]);
            shortAxisCoords(point) = dot(shortAxisVec,[shortX(point);shortY(point)]);
            
            fakeLongAxisCoords(point) = dot(fakeLongAxisVec,[shortX(point);shortY(point)]);
            fakeShortAxisCoords(point) = dot(fakeShortAxisVec,[shortX(point);shortY(point)]);
        end

        % save these new coordinates

        cellStruct(traj).longAxisCoords = longAxisCoords;
        cellStruct(traj).shortAxisCoords = shortAxisCoords;
        
        cellStruct(traj).fakeLongAxisCoords = fakeLongAxisCoords;
        cellStruct(traj).fakeShortAxisCoords = fakeShortAxisCoords;
        
        % save the coordinate vectors too surely?
        
        cellStruct(traj).longAxis = longAxisVec;
        cellStruct(traj).shortAxis = shortAxisVec;
        cellStruct(traj).fakeLongAxis = fakeLongAxisVec;
        cellStruct(traj).fakeShortAxis = fakeShortAxisVec;

    end
end

% now that we know which trajectories should be treated together we can
% actually do the analysis

disp('Doing the analysis')
disp('---')
for traj = 1:numTracks
    if cellStruct(traj).sameTracks == 0 && cellStruct(traj).secondPiece == 0
        % in this case doing the analysis is simple as this track is not
        % split into parts
        
        % grab some of the data into shorter variable names for ease
        
        shortX = cellStruct(traj).newX;
        shortY = cellStruct(traj).newY;
        
        % calculate the MSD in both ways and save this
        
        MSD = calcMSD(shortX,shortY);
        MSD2 = calcMSDFromOrigin(shortX,shortY);
        
        cellStruct(traj).MSD = MSD;
        cellStruct(traj).MSD2 = MSD2;
        
        % from the MSD curve (not MSD2) we calculate the linear diffusion coefficient
        % and the MSD asymptote. Save the MSD asymptote and the residual
        
        Dinit = fitInitialLinear(0:3,MSD(1:4));        
        
        [asymptote,residual,~] = calcAsymptote(MSD,numel(MSD));
        
        cellStruct(traj).Dlinear = Dinit;
        cellStruct(traj).asymptote = asymptote;
        cellStruct(traj).asymptoteError = residual;
        
        % get the long and short axis coordinates
        % THESE COORDINATES ONLY EXIST IF WE FOUND THE LONG AXIS, OTHERWISE
        % THIS BIT CAN'T RUN
        
        if ~isnan(cellStruct(traj).top)
        
            longAxisCoords = cellStruct(traj).longAxisCoords;
            shortAxisCoords = cellStruct(traj).shortAxisCoords;
            
            fakeLongAxisCoords = cellStruct(traj).fakeLongAxisCoords;
            fakeShortAxisCoords = cellStruct(traj).fakeShortAxisCoords;

            % calculate the LA and SA MSDs the MSD and save it       

            MSDlongAxis = calcMSD1D(longAxisCoords);
            MSDshortAxis = calcMSD1D(shortAxisCoords);

            cellStruct(traj).MSDlongAxis = MSDlongAxis;
            cellStruct(traj).MSDshortAxis = MSDshortAxis;
            
            MSDfakeLongAxis = calcMSD1D(fakeLongAxisCoords);
            MSDfakeShortAxis = calcMSD1D(fakeShortAxisCoords);

            cellStruct(traj).MSDfakeLongAxis = MSDfakeLongAxis;
            cellStruct(traj).MSDfakeShortAxis = MSDfakeShortAxis;

            % we can again fit an asymptote and a diffusion coefficient and
            % save these

            DlongAxis = fitInitialLinear(0:3,MSDlongAxis(1:4));
            DshortAxis = fitInitialLinear(0:3,MSDshortAxis(1:4));

            [asymptoteLongAxis,~,~] = calcAsymptote(MSDlongAxis,numel(MSDlongAxis));
            [asymptoteShortAxis,~,~] = calcAsymptote(MSDshortAxis,numel(MSDshortAxis));

            cellStruct(traj).DlinearLongAxis = DlongAxis;
            cellStruct(traj).DlinearShortAxis = DshortAxis;
            cellStruct(traj).asymptoteLongAxis = asymptoteLongAxis;
            cellStruct(traj).asymptoteShortAxis = asymptoteShortAxis;
        end
        
        % finally we need to sort out the step group. This is done like it
        % was before. First we get the intensity profile, and extend it
        % outside the actual track by taking the start/end position and
        % calculating the intensity at that point for some frames
        % before/after the tracked part of the trajectory [this is the bit
        % that will have to be thought about for multiples]
        
        [shortIntensity,sizeExtraLeft,sizeExtraRight] = makeShortIntensity(intensity(:,traj),xPos(:,traj),yPos(:,traj),imageMatch,leftIntensityBuffer,rightIntensityBuffer);
        
        % save the new left and right intensity buffers
        
        cellStruct(traj).leftIntensityBuffer = sizeExtraLeft;
        cellStruct(traj).rightIntensityBuffer = sizeExtraRight;
        
        % we then filter the intensity with a chung-kennedy filter, code
        % courtesy of herman. Currently we are doing two long-pass filters
        % for large features and then a short filter to emphasise jumps
        
        newShortIntensity = hermanCKfilter(shortIntensity,[5,20,30],20,2);
        newShortIntensity = hermanCKfilter(newShortIntensity,[5,20],20,20);
        newShortIntensity = hermanCKfilter(newShortIntensity,[5,20,30],20,2);
        newShortIntensity = hermanCKfilter(newShortIntensity,[5,20],20,20);
        newShortIntensity = hermanCKfilter(newShortIntensity,[5,20,30],20,2);
        newShortIntensity = hermanCKfilter(newShortIntensity,[5,20],20,20);
        
        % save the short intensity and the filtered intensity
        
        cellStruct(traj).shortIntensity = shortIntensity;
        cellStruct(traj).filteredIntensity = newShortIntensity;
        
        % the filtered intensity is then passed to the step function, again
        % courtesy of herman. This returns a list of the positions of each
        % step, I don't entirely remember what ns_rec is, but I think it
        % somehow records whether the step should be accepted or not
        
        [steplist,ns_rec] = hermanAutosteps(newShortIntensity,numel(newShortIntensity),1,plotYes);
        
        % identify step group and save it
    
        group = findStepGroup(cellStruct(traj).trackLen,steplist,ns_rec,newShortIntensity,BG_level,leftIntensityBuffer);
        
        cellStruct(traj).group = group;
    
        % save step sizes and locations

        if ns_rec >= 1
            cellStruct(traj).stepLocs = steplist(1:ns_rec,1);
            cellStruct(traj).stepSizes = steplist(1:ns_rec,5);
        end
        
        % we are now done with analysis.

    elseif cellStruct(traj).secondPiece == 0
        % our trajectory comes in pieces so we need to be a bit careful
        disp('dealing with a sketch split trajectory')
        
        % first we need to find the pieces of our trajectory
        
        numPieces = 2;
        currentTraj = cellStruct(traj).sameTracks;
        pieces = [traj,cellStruct(traj).sameTracks];
        
        while cellStruct(currentTraj).sameTracks ~= 0
            currentTraj = cellStruct(currentTraj).sameTracks;
            numPieces = numPieces + 1;
            pieces(numel(pieces)+1) = currentTraj;
        end
        
        disp(['there are ', num2str(numPieces),' parts to this trajectory'])
        disp('the parts are:')
        disp(pieces)
        
        % grab the x-y coords of the data into shorter variable names for ease
        % and also the LA-SA coords IF THEY EXIST
        
        shortX = cell(numPieces,1);
        shortY = cell(numPieces,1);
        
        if ~isnan(cellStruct(traj).top)
            longAxisCoords = cell(numPieces,1);
            shortAxisCoords = cell(numPieces,1);
            fakeLongAxisCoords = cell(numPieces,1);
            fakeShortAxisCoords = cell(numPieces,1);
        end
        
        % these are just needed for making short intensity
        intensities = cell(numPieces,1);
        x = cell(numPieces,1);
        y = cell(numPieces,1);
        
        for i=1:numPieces
            shortX{i} = cellStruct(pieces(i)).newX;
            shortY{i} = cellStruct(pieces(i)).newY;
            
            if ~isnan(cellStruct(traj).top)
                longAxisCoords{i} = cellStruct(pieces(i)).longAxisCoords;
                shortAxisCoords{i} = cellStruct(pieces(i)).shortAxisCoords;
                
                fakeLongAxisCoords{i} = cellStruct(pieces(i)).fakeLongAxisCoords;
                fakeShortAxisCoords{i} = cellStruct(pieces(i)).fakeShortAxisCoords;
            end
            
            intensities{i} = cellStruct(pieces(i)).intensity;
            x{i} = cellStruct(pieces(i)).x;
            y{i} = cellStruct(pieces(i)).y;
        end
        
        % calculate the MSD in the normal way
        % working out how to do it from the origin is a bit confusing right
        % now so ignore for now
        
        % save the MSD;
        
        MSD = calcMSDPieces(shortX,shortY);
        
        cellStruct(traj).MSD = MSD;
        
        % from the MSD we calculate the diffusion coefficient and asymptote
        
        Dinit = fitInitialLinear(0:3,MSD(1:4));
        
        [asymptote,residual,~] = calcAsymptote(MSD,numel(MSD));
        
        cellStruct(traj).Dlinear = Dinit;
        cellStruct(traj).asymptote = asymptote;
        cellStruct(traj).asymptoteError = residual;
        
        % calculate the LA-SA MSDs
        
        if ~isnan(cellStruct(traj).top)
            MSDlongAxis = calcMSD1DPieces(longAxisCoords);
            MSDshortAxis = calcMSD1DPieces(shortAxisCoords);

            cellStruct(traj).MSDlongAxis = MSDlongAxis;
            cellStruct(traj).MSDshortAxis = MSDshortAxis;
            
            MSDfakeLongAxis = calcMSD1DPieces(fakeLongAxisCoords);
            MSDfakeShortAxis = calcMSD1DPieces(fakeShortAxisCoords);

            cellStruct(traj).MSDfakeLongAxis = MSDfakeLongAxis;
            cellStruct(traj).MSDfakeShortAxis = MSDfakeShortAxis;

            % we can again fit an asymptote and a diffusion coefficient and
            % save these

            DlongAxis = fitInitialLinear(0:3,MSDlongAxis(1:4));
            DshortAxis = fitInitialLinear(0:3,MSDshortAxis(1:4));

            [asymptoteLongAxis,~,~] = calcAsymptote(MSDlongAxis,numel(MSDlongAxis));
            [asymptoteShortAxis,~,~] = calcAsymptote(MSDshortAxis,numel(MSDshortAxis));

            cellStruct(traj).DlinearLongAxis = DlongAxis;
            cellStruct(traj).DlinearShortAxis = DshortAxis;
            cellStruct(traj).asymptoteLongAxis = asymptoteLongAxis;
            cellStruct(traj).asymptoteShortAxis = asymptoteShortAxis;
        end
        
        % finally we need to sort out the step group. This is done like it
        % was before. First we get the intensity profile, and extend it
        % outside the actual track by taking the start/end position and
        % calculating the intensity at that point for some frames
        % before/after the tracked part of the trajectory 
        
        % for multiples working out the short intensity is a little
        % trickier.
        
        [shortIntensity,sizeExtraLeft,sizeExtraRight] = makeShortIntensityPieces(intensities,x,y,imageMatch,leftIntensityBuffer,rightIntensityBuffer);
        
        % save the actual extra left and right buffers
        
        cellStruct(traj).leftIntensityBuffer = sizeExtraLeft;
        cellStruct(traj).rightIntensityBuffer = sizeExtraRight;
        
        % we then filter the intensity with a chung-kennedy filter, code
        % courtesy of herman. Currently we are doing two long-pass filters
        % for large features and then a short filter to emphasise jumps
        
        newShortIntensity = hermanCKfilter(shortIntensity,[5,20,30],20,2);
        newShortIntensity = hermanCKfilter(newShortIntensity,[5,20,30],20,2);
        newShortIntensity = hermanCKfilter(newShortIntensity,[5,20],20,20);
        
        % save the short intensity and the filtered intensity
        
        cellStruct(traj).shortIntensity = shortIntensity;
        cellStruct(traj).filteredIntensity = newShortIntensity;
        
        % the filtered intensity is then passed to the step function, again
        % courtesy of herman. This returns a list of the positions of each
        % step, I don't entirely remember what ns_rec is, but I think it
        % somehow records whether the step should be accepted or not
        
        [steplist,ns_rec] = hermanAutosteps(newShortIntensity,numel(newShortIntensity),1,plotYes);
        
        % identify step group and save it
 
        group = findStepGroup(cellStruct(traj).trackLen,steplist,ns_rec,newShortIntensity,BG_level,leftIntensityBuffer);
        
        cellStruct(traj).group = group;

        % save step sizes and locations

        if ns_rec >= 1
            cellStruct(traj).stepLocs = steplist(1:ns_rec,1);
            cellStruct(traj).stepSizes = steplist(1:ns_rec,5);
        end
        
        % we are now done with analysis
        
    else
        % this trajectory forms part of one already analysed, so don't
        % re-analyse (all info is stored in the initial piece
        disp(['This track ',num2str(traj),' is a second part of a trajectory that has been analysed already'])
        
    end
end