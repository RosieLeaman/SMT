% fits a linear polynomial to the initial segment
% assumes the initial segment of t and y has already been passed to it

% in effect, this just fits a linear polynomial to the given y and t values

% INPUTS:
% t; the 'x' points of the curve that needs fitting
% y; the 'y' points of the curve that needs fitting

% OUTPUTS:
% Dinit; the slope of the straight line that is the best least squares fit
% to the data y

% Note that this code does NOT return the goodness of fit, although this
% could easily be added if we wanted

function Dinit = fitInitialLinear(t,y)


polyvar = polyfit(t,y,1);

Dinit = polyvar(1);

end