% makes a new array from the provided intensity array (which has zeroes)
% where the track does not exist
% the new array is the provided intensity when the tracks exist, plus the
% average intensity in a circle shaped area centred on the first point the
% track existed, for extraLeft frames before the trajectory started
% and plus the same but centred on the last point it existed, for
% extraRight frames past the trajectory ended

% INPUTS:
% intensity; an nx1 vector containing the intensity values direct from
% trackmate (padded to left and right with zeros)
% xPos; an nx1 vector containing the x position values direct from
% trackmate (padded to left and right with zeros)
% yPos; an nx1 vector containing the x position values direct from
% trackmate (padded to left and right with zeros)
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

function [shortIntensity,sizeExtraLeft,sizeExtraRight] = makeShortIntensity(intensity,xPos,yPos,imageMatch,extraLeft,extraRight)

    beginTrack = min(find(intensity>0));
    beginExtra = beginTrack - extraLeft;
    if beginExtra < 1
        beginExtra = 1;
    end
    sizeExtraLeft = beginTrack-beginExtra;
    
    endTrack = max(find(intensity>0));
    endExtra = endTrack + extraRight;
%     if endExtra > numel(imageMatch)
%         endExtra = numel(imageMatch);
%     end
    if endExtra > numel(imageMatch)
        endExtra = numel(imageMatch);
    end
    sizeExtraRight = endExtra - endTrack;
    
    shortIntensity = zeros(1,endExtra-beginExtra+1);
    
    for i=beginExtra:endExtra
        shortIndex = i-beginExtra+1;
        if intensity(i) > 0
            shortIntensity(shortIndex) = intensity(i);
        elseif i < beginTrack
            %shortIntensity(shortIndex) = imageMatch(i).data(floor(xPos(beginTrack)),floor(yPos(beginTrack)));
            shortIntensity(shortIndex) = findIntensityCircle([xPos(beginTrack),yPos(beginTrack)],2,imageMatch(i).data);
        else
            %shortIntensity(shortIndex) = imageMatch(i).data(floor(xPos(endTrack)),floor(yPos(endTrack)));
            shortIntensity(shortIndex) = findIntensityCircle([xPos(endTrack),yPos(endTrack)],2,imageMatch(i).data);

        end
    end

end