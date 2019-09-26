% calculate MSD in 2D using the method where you use every gap of length n
% say and average across whole trajectory

% Inputs:
% x; vector of x co-ordinates
% y; vector of y co-ordinates

% Outputs:
% MSD; the MSD at every time point 

function MSD = calcMSD(x,y)

T = length(x); % total time

MSD = zeros(1,T);

for n=0:T-1

    N = T-n;

    sum = 0;
    for i=1:N

        xDist = (x(i+n)-x(i))^2;

        yDist = (y(i+n)-y(i))^2;

        sum = sum + xDist + yDist;

    end
    
    MSD(n+1) = sum/N;
    %MSD(n+1) = sum/(N-1);% minimal variance unbiased estimator
end