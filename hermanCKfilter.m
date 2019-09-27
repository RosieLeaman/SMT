
%% Chung-Kennedy filter, same as CK_filter()
%   windows, [a,b,c,d], list of window sizes for calculating moving averages (predictors)
%   M, window of squared Euclidean distances to weigh predictors
%   p, exponent for tuning weights

% Code written by Herman Fung

function new_z = hermanCKfilter(z,windows,M,p)

    window_count = length(windows);
    frame_count = length(z);

    % Initialise array for predictors
    for_avg = zeros(window_count,frame_count);
    rev_avg = zeros(window_count,frame_count);

    for m = 1:window_count
        window_size = windows(m);
        for n = 1:frame_count
            % Forward predictors, moving average based on previous frames given window size
            if n == 1
                for_avg(m,n) = z(1);
            elseif n-window_size <= 0 
                for_avg(m,n) = mean( z(1:n-1) );
            else 
                for_avg(m,n) = mean( z((n-window_size):(n-1)) );
            end
            % Backward predictors, moving average based on subsequent frames given window size
            if n == frame_count
                rev_avg(m,n) = z(n);
            elseif n+window_size > frame_count 
                rev_avg(m,n) = mean( z(n+1:frame_count) );
            else 
                rev_avg(m,n) = mean( z((n+1):(n+window_size)) );
            end
        end
    end

    % Initialise array for weights
    for_weights = zeros(window_count,frame_count);
    rev_weights = zeros(window_count,frame_count);
    
    for m = 1:window_count    

        % Moving sum of squared Euclidean distances; all predictors equally probable (no correction on weights from window to window)

        for_dist = (z-for_avg(m,:)).^2;
        rev_dist = (z-rev_avg(m,:)).^2;
                
        for n = 1:frame_count
            if n == 1
                sum_dist = 1; % non-zero number
            elseif n-M < 0 
                sum_dist = sum(for_dist(1:n));
            else 
                sum_dist = sum(for_dist(n-M+1:n));
            end

            % see note below for reverse weights
            
            if sum_dist > 0
                for_weights(m,n) = ( sum_dist ^ (-p) );
            else
                for_weights(m,n) = 0;
            end
            
            if n == frame_count
                sum_dist = 1; % non-zero number
            elseif n+M+1 > frame_count
                sum_dist = sum(rev_dist(n:frame_count));
                
            else 
                sum_dist = sum(rev_dist(n:n+M-1));
            end

            % ROSIE edit: there was a problem where sometimes sum_dist
            % happened to be zero because for whatever reason (often near
            % ends of trajectories) the signal happened to be exactly equal
            % to the average for a few frames
            % this lead to a division by zero here and lots of NaNs that
            % then propagated into many many NaNs when applying the filter
            % multiple times
            % so here as an edit I say that if sum_dist happens to be zero
            % then make the weight zero
            % this removed the NaN, not sure if legit
            
            if sum_dist > 0
                rev_weights(m,n) = ( sum_dist ^ (-p) );
            else
                rev_weights(m,n) = 0;
            end
    
        end
    
    end    
    
    % Normalise weights for each frame
    norm_factor = repmat( sum(for_weights,1)+sum(rev_weights,1) , window_count , 1 );
   
    for_weights2 = for_weights ./  norm_factor;
    rev_weights2 = rev_weights ./  norm_factor;
    
%     rev_weightsProb = numel(find(rev_weights==0))
%     for_weightsProb = numel(find(for_weights==0))
%     for_weights2Prob = numel(find(isnan(for_weights2)))
%     rev_weights2Prob = numel(find(isnan(rev_weights2)))
%     normProb = numel(find(norm_factor == 0))
    
    % Apply weights to each predictor and sum for new intensity of each frame
    new_z = sum(for_weights2 .* for_avg , 1) + sum(rev_weights2 .* rev_avg , 1);
    
    prob = numel(find(isnan(new_z)));
    

end
