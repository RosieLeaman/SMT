% this function is intended to calculated the MSD asymptote value
% it is apparently a somewhat dodgy approach to this

% INPUTS:
% MSD; the MSD curve
% len; the length of the trajectory

% OUTPUTS:
% asymptote; an estimate of the average value of the MSD curve during the
% confined bit
% residual; an estimate of the error of this asymptote in a least squares
% sense
% slope; really I have no idea what this is trying to convey.

function [asymptote,residual,slope] = calcAsymptote(MSD,len)

% time average the MSD with what looks like a very long average
timeAvg = zeros(1,len-20);
for i=11:len-10
    timeAvg(i-10) = mean(MSD(i-10:i+10));
end

%figure; hold on;
%plot(MSD)
%plot(11:(11+numel(timeAvg)-1),timeAvg);

% calculate the end section to estimate asymptote from (ignore end as more
% sketchy averages here)
%endAsymptote = floor(numel(MSD)/2);
endAsymptote = numel(timeAvg);
slopey = gradient(timeAvg(1:endAsymptote));
diff = slopey(2:end)-slopey(1:end-1);

% the beginning is the first time that the gradient becomes very low
beginAsymptote = min(find(abs(diff) < 0.001));


slope = mean(slopey(beginAsymptote:endAsymptote));
asymptote = mean(MSD(beginAsymptote:endAsymptote));

% 3/4/18 alternative, try just averaging from point 10 to halfway
%asymptote = mean(MSD(10:endAsymptote));

% estimate error as the residual. Closer to zero is a better estimate

residual = mean((MSD(beginAsymptote:endAsymptote)-asymptote).^2);

end