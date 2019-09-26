% calculate MSD in 1D using the method where you use every gap of length n
% say and average across whole trajectory
% this works on a cell array of the x coordinates of each piece of the
% trajectory from a broken trajectory
% in theory there is no reason it should not work on a trajectory in one
% piece.

% Inputs:
% x; cell array of vectors of x co-ordinates from each piece

% Outputs:
% MSD; the MSD at every time point (ignoring the zero time-point)

function MSD = calcMSD1DPieces(x)

% on each of these pieces we calculate the MSD sum as normal, but don't
% normalise yet. We also store how many to normalise by.

% the problem is that each part of the trajectory could be a different
% length. First we find the longest one and use this to form our base MSD
% size.

numPieces = numel(x);
maxLen = 0;

for i=1:numPieces
    if length(x{i}) > maxLen
        maxLen = length(x{i});
    end
end

MSD = zeros(1,maxLen);
normalisation = zeros(1,maxLen);

for j=1:numPieces
    % find how long this particular trajectory lasted for
    T = length(x{i});
    currentX = x{i};

    for n=0:T-1

        % number of gaps of size n is T-n
        N = T-n;

        sum = 0;
        for i=1:N

            xDist = (currentX(i+n)-currentX(i))^2;

            sum = sum + xDist;

        end

        MSD(n+1) = MSD(n+1) + sum;
        normalisation(n+1) = normalisation(n+1) + N;
        %MSD(n+1) = sum/(N-1);% minimal variance unbiased estimator
    end
    
end

MSD = MSD./normalisation;