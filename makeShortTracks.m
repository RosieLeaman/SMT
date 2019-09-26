% takes in the track output from trackmate and reduces it to only the
% frames where the fluorophore was tracked (does not record when these
% frames actually occurred)

% INPUTS:
% xPos; a nx1 vector with the x position values for this trajectory direct from trackmate, i.e. with the zero padding still in place
% xPos; a nx1 vector with the y position values for this trajectory direct from trackmate, i.e. with the zero padding still in place
% lenTrack; the length of the trajectory as calculated by calcTrackLens

% OUTPUTS:
% shortX; an mx1 vector with the x position values for this trajectory only
% for the frames where it was tracked, where m is the number of frames the
% trajectory lasted for
% shortY; an mx1 vector with the y position values for this trajectory only
% for the frames where it was tracked, where m is the number of frames the
% trajectory lasted for

function [shortX,shortY] = makeShortTracks(xPos,yPos,lenTrack)
% gets the section of track that was actually recorded, the non-zero bit
% currently assumes this is all contiguous
    shortX = zeros(1,lenTrack);
    shortY = zeros(1,lenTrack);
    index = 1;
    for i=1:900
        if xPos(i) > 0
            shortX(index) = xPos(i);
            shortY(index) = yPos(i);
            index = index + 1;
        end
    end

end