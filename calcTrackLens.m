% trackmate just outputs the x,y,intensity values for the found
% trajectories by 0 0 0 0 x1 x2 x3 ... xn 0 0 0 0 0 where the zeros pad the
% values before and after so that the whole thing is as long as the video
% file
% This function calculates the actual length of each track i.e. the number
% of frames from x1 to xn

% INPUTS:
% xPos; the xPos matrix direct from Trackmate as read in by readTrackmateCellFiles.m
% numTracks; the number of trajectories in the file (note that this should
% be the same as size(xPos,2)

% OUTPUTS:
% lens; an 1xt vector containing the lengths of each trajectory where t is the number of trajectories

function lens = calcTrackLens(xPos,numTracks)
    % we use the xPos file as the proxy to find where for each trajectory
    % the values become non-zero
    
    lens = zeros(1,numTracks);
    for i = 1:numTracks

        ending = max(find(xPos(:,i)>0));
        
        % if there was no maximum time that xPos was zero, trajectory goes
        % to end and we set the end to be the number of elements in xPos
        % -1, just to fix the +1 later
        if numel(ending) == 0
            ending = numel(xPos(:,i))-1;
        end

        
        starting = min(find(xPos(:,i)>0));
        
        % if there was no minimum time that xPos was zero, the trajectory
        % exists from the beginning and we set the start to be zero
        if numel(starting) == 0
            starting = 0;
        end

        lens(i) = ending - starting + 1;

    end
end