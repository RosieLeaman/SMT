% this function strips trajectories of large jumps at the beginning and the
% end that are likely due to tracking errors

% INPUTS:
% shortX; an mx1 vector of x co-ordinates of the trajectory where m is the
% length of the trajectory
% shortY; an mx1 vector of y co-ordinates of the trajectory where m is the
% length of the trajectory
% avgPos; the average position of the trajectory

% OUTPUTS:
% allSkip; a 1xs vector containing the indices of points in the trajectory
% that should be removed to get rid of large jumps. This can include points
% at both the beginning and the end.


function allSkip = findLargeJumps(shortX,shortY,avgPos)

% to work out if there are large jumps, calculate the distances from the centre   
dists = sqrt((shortX - avgPos(1)).^2 + (shortY - avgPos(2)).^2);

% calculate the 95th percentile of distances
dist95 = prctile(dists,95);

% find from the first three frames of trajectory and last three frames
% those points that fall outside the 95th percentile
startDists = dists(1:3);
endDists = dists(end-2:end);

startSkip = find(startDists > dist95);
endSkip = find(endDists > dist95) + numel(dists)-3;

% in addition remove points that are within the 95th percentile but
% would leave a hole in the trajectory if removing those found above
startAllSkip = 1:max(startSkip);
endAllSkip = min(endSkip):numel(dists);

allSkip = [startAllSkip,endAllSkip];