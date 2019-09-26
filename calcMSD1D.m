% calculate MSD in 1D using the method where you use every gap of length n
% say and average across whole trajectory

% Inputs:
% x; vector of x co-ordinates

% Outputs:
% MSD; the MSD at every time point (ignoring the zero time-point)

function MSD = calcMSD1D(x)

T = length(x); % total time

MSD = zeros(1,T);

for n=0:T-1

    N = T-n;

    sum = 0;
    for i=1:N

        xDist = (x(i+n)-x(i))^2;

        sum = sum + xDist;

    end
    
    MSD(n+1) = sum/N;
    %MSD(n+1) = sum/(N-1);% minimal variance unbiased estimator
end