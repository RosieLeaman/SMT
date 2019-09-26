% calculates the 'average position' of the trajectory. Requires the x and y
% positions to have previously been stripped of leading and trailing zeros

% INPUTS:
% xPos; an mx1 vector of x positions where m is the length of the
% trajectory
% yPos; an mx1 vector of x positions where m is the length of the
% trajectory

% OUTPUTS:
% avgPos; a 1x2 vector recording the average position of the trajectory

function avgPos = calcAveragePos(xPos,yPos)
% finds the average position of the trajectory so it can be located along
% the long axis

avgPos = [0,0];
avgPos(1) = mean(xPos);
avgPos(2) = mean(yPos);

end