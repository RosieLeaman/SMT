% calculate MSD in 2D, using the method where we only take distance from
% the origin at each time point

% Inputs:
% x; vector of x co-ordinates
% y; vector of y co-ordinates

% Outputs:
% MSD; the MSD at every time point (ignoring the zero time-point)

function MSD = calcMSDFromOrigin(x,y)

xDist = x - x(1);
yDist = y - y(1);

xDistSquared = xDist.^2;
yDistSquared = yDist.^2;

MSD = xDistSquared+yDistSquared;

end