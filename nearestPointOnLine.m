% this function takes in a pair of points that define a line between them
% and then calculates the closest point P on that line to a point off the
% line

% note the input vectors are assumed to be ROW VECTORS
% it returns the point, and also optionally the scale factor

% if we change our basis so that bottom = 0, top' = top - bottom, z =
% point - bottom and call the vector that goes from 0 to top' v then the
% point P is given by (z.v/norm(v))v (see notes Maths labbook 1 page 14)

% INPUTS:
% top; a 1x2 row vector containing the location of one end of the line (in
% this case the top of the bacteria)
% bottom; a 1x2 row vector containing the location of the other end of the
% line (in our case the bottom of the bacteria)
% point; a 1x2 row vector which is the point we would like to calculate the
% nearest point to

% OUTPUTS:
% nearest; a 1x2 row vector which is the point on the line between top and
% bottom closest to point
% alpha; the fraction along the line between top and bottom which nearest
% is at

function [nearest,alpha] = nearestPointOnLine(top,bottom,point)

% change our basis and make these column vectors

v = (top - bottom)';
z = (point - bottom)';

% calculate the scale factor
alpha = (dot(v,z)/dot(v,v));

% apply it to vector v
nearest = alpha*v;

% make it un-relative by adding bottom back on, and transpose back to row
% vectors
nearest = nearest' + bottom;


