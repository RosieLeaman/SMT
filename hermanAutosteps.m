% Chi-squared minimisation-based iterative fitting of steps (in filtered trace)
% based on code provided by Jacob Kerssemakers and Marileen Dogterom, ref, Kerssemakers et al. 2006 Nature
% trace divided into segments as steps are identified; local step fitted for each segment and one selected...
% orginally based on step size from fit (not actual step size) * sqrt of fit window (orignal)
% now based on step size from fit only
% if good SNR, i.e. real step > noise step, real steps found first, additional noise steps will be small in magnitude

% Code written by Herman Fung

function [steplist,ns_rec] = hermanAutosteps(obs,frame_end,frame_zero,plotYes)

    min_duration = 5; % minumum step duration, Herman had 5
    %min_duration = 10;
    
    max_steps = 10; % number of steps to fit
    %frame_end = 1500; % throw away useless frames at tail end of movie

    grad = diff(obs);
    %[foo, frame_zero] = max(grad) % sharpest rise; laser on
    
%     plot(frame_zero,min(obs)-20,'rx')
%     plot(frame_end,min(obs)-20,'kx')

    % [foo, frame_big_dip] = min(grad); % sharpest drop
    % baseline = mean(obs(600:frame_end));

    steplist = hermanFindsteps(obs,min_duration,max_steps,frame_zero,frame_end);

    if isempty(steplist) == 1
        ns_rec = 0;
        disp('No steps found.');
        return
    else
        y = numel(steplist(:,1));

        ns_rec = find( steplist(:,4)<1 , 1 ) - 1; % number of steps before first occurence of magic_ratio < 1; NaN output in first step but logical operations involving NaN return 0
        %ns_rec = find((steplist(1:end-1,4)-steplist(2:end,4))<0,1)
        
        if isempty(ns_rec) == 1
            ns_rec = 0;
            disp('No steps or too many steps found.');
            return
        end
    end
    %ns_rec = numel(steplist(:,4))
    disp(['Number of steps based on step sizes: ',num2str(ns_rec)]);
    if steplist(ns_rec,3)/steplist(ns_rec,2) < 1
        disp('Warning: counter-fit better than fit.');
    end
    
    % calculate step levels (y)
    seg_points = sort([frame_zero; steplist(1:ns_rec,1); frame_end]);
    mean_fit = zeros(ns_rec+1,1);
    for j = 1:ns_rec+1
        seg = obs(seg_points(j)+1:seg_points(j+1));
        mean_fit(j) = sqrt(sum(seg.^2)/length(seg));
    end
    
    % ROSIE EDIT: we want to know the size of the steps for plotting a
    % distribution. We can attach this to steplist. We also want to know if
    % the first step is up or down.
    % we attach to steplist the step size (the difference between
    % mean_fit(step + 1) and mean_fit(step)
    
    % find step sizes
    steps = diff(mean_fit);
    
    % attach this to steplist as column 5
    steplist(1:ns_rec,5) = steps;

    xfit = reshape([transpose(seg_points);transpose(seg_points+1)],[],1);
    xfit = xfit(2:end-1); % generate x values to plot fit for number of steps = ns_rec
    yfit = reshape(repmat(transpose(mean_fit),2,1),[],1);
    
    if plotYes == 1
        hold on;
        plot(xfit,yfit,'LineWidth',2);
        hold off;
        axis([-Inf Inf -Inf max(obs)*1.2]);
    end

end


% two-sample t-test, unequal variance
% N=10;
% alpha=0.05;
% x1 = movmean(test,[0 N-1],'Endpoints','fill'); % moving mean, current and next N-1 frames, NaN if elements missing in window
% x2 = circshift(x1,N,2); % moving mean, previous N frames
% x2(1) = NaN; % correct first element
% s21 = movvar(test,[0 N-1],'Endpoints','fill'); % moving variance, s squared 1, current and next N-1 frames
% s22 = circshift(s1,N,2); % moving variance, previous N frames
% s22(1) = NaN;
% t = abs((x1-x2)./sqrt((x1.^2+x2.^2)/N));
% df = ((s21+s22)/N)./((s21.^2+s22.^2)/(N*(N-1)));
% tcrit = tinv(1-alpha/2,df);
% stepidx = find(t > tcrit);
