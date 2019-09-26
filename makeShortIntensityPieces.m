% makes a new array from the provided intensity array (which has zeroes)
% where the track does not exist
% the new array is the provided intensity when the tracks exist, plus the
% average intensity in a circle shaped area centred on the first point the
% track existed, for extraLeft frames before the trajectory started
% and plus the same but centred on the last point it existed, for
% extraRight frames past the trajectory ended

% for multiples we make the following modifications: the trajectory start
% is at the beginning of the first trajectory and the trajectory end is at
% the end of the last trajectory.
% for the gaps in the middle, we linearly interpolate between the last
% known x/y position and the x/y position at the start of the next
% trajectory for the number of frames that we're missing and calculate the
% intensity at these points
% note that intensity, xPos, yPos are now cell arrays with each element a
% vector that is the corresponding quantity for each piece

% INPUTS:
% intensity; a cell containing nx1 vectors containing the intensity values direct from
% trackmate (padded to left and right with zeros). One cell entry per part
% of trajectory.
% xPos; a cell containing nx1 vectors containing the x position values direct from
% trackmate (padded to left and right with zeros). One cell entry per part
% of trajectory.
% yPos; a cell containing nx1 vectors containing the x position values direct from
% trackmate (padded to left and right with zeros). One cell entry per part
% of trajectory.
% imageMatch; a struct obtained from tiffread which contains the median
% filtered video data that the trajectory was taken from
% extraLeft; the number of frames to pad the intensity to the left by
% extraRight; the number of frames to pad the intensity to the right by

% OUTPUTS:
% shortIntensity; a mx1 vector containing the intensity values padded to
% the left and right by up to the specified amount
% sizeExtraLeft; the actual amount the intensity was padded by to the left,
% as if the track starts too close to the beginning of the trajectory it
% may not be able to be padded by the requested extraLeft number of frames
% sizeExtraRight; the actual amount the intensity was padded by to the right,
% as if the track starts too close to the end of the trajectory it
% may not be able to be padded by the requested extraRight number of frames

function [shortIntensity,sizeExtraLeft,sizeExtraRight] = makeShortIntensityPieces(intensity,xPos,yPos,imageMatch,extraLeft,extraRight)

    % to find the start of the track we find the first time that the
    % intensity becomes non-zero in the first trajectory piece
    beginTrack = min(find(intensity{1}>0));
    beginExtra = beginTrack - extraLeft;
    if beginExtra < 1
        beginExtra = 1;
    end
    sizeExtraLeft = beginTrack-beginExtra;
    
    % and similarly to find the end of the track we find the first time
    % that the intensity becomes zero in the last trajectory piece
    endTrack = max(find(intensity{end}>0));
    endExtra = endTrack + extraRight;
    if endExtra > numel(imageMatch)
        endExtra = numel(imageMatch);
    end
    
    shortIntensity = zeros(1,endExtra-beginExtra+1);
    
    % at the beginning we have extra frames added, these need to be
    % calculated
    for i=beginExtra:beginTrack
        shortIndex = i-beginExtra+1;
        shortIntensity(shortIndex) = findIntensityCircle([xPos{1}(beginTrack),yPos{1}(beginTrack)],2,imageMatch(i).data);
    end
    
    % in the middle we have to be careful what trajectory we're in
    
    currentPiece = 1;
    index = beginTrack;
    while currentPiece <= numel(xPos)
        shortIndex = index-beginExtra+1;
        
        if intensity{currentPiece}(index) > 0
            shortIntensity(shortIndex) = intensity{currentPiece}(index);
            index = index + 1;
        
        % we only want this section to run if we're between two
        % trajectories, it can't run at the end of all of them
        elseif currentPiece < numel(xPos)
            % get the current values
            endCurrent = index - 1;
            xCurrent = xPos{currentPiece}(index-1);
            yCurrent = yPos{currentPiece}(index-1);
            
            % get the next values
            currentPiece = currentPiece + 1;
            find(intensity{currentPiece}>0);
            startNext = min(find(intensity{currentPiece}>0));
            xNext = xPos{currentPiece}(startNext);
            yNext = yPos{currentPiece}(startNext);
            
            gap = startNext - endCurrent - 1;
            
            disp(['gap between tracks was ',num2str(gap),' frames'])
            
            % to get the interpolating values go from the known start to
            % known end, we need a gap + 2 number of interpolants (the
            % first and last will be the end and beginning we already know)
            
            xInterps = linspace(xCurrent,xNext,gap+2);
            yInterps = linspace(yCurrent,yNext,gap+2);
            
            % then set the values at these points
            disp('finding the gap intensity')
            for j=2:(numel(xInterps)-1)
                % this is the index in shortIntensity that matches to this
                % j in the gap index
                shortIndex = index + j - 2 - beginExtra + 1;
                
                shortIntensity(shortIndex) = findIntensityCircle([xInterps(j),yInterps(j)],2,imageMatch(index + j - 2).data);
                
            end
            
            % set index further on
            index = index + gap;
            
        else
            disp('its the end')
            currentPiece = currentPiece + 1;
        end
        
    end
    
    % then get the extra intensity at the end of the trajectory
    
    for i=endTrack:endExtra
        shortIndex = i-beginExtra+1;
        
        shortIntensity(shortIndex) = findIntensityCircle([xPos{end}(endTrack),yPos{end}(endTrack)],2,imageMatch(i).data);
    end
    sizeExtraRight = endExtra - endTrack;

end