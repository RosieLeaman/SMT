% Code written by Herman Fung

function steplist = hermanFindsteps(obs,min_duration,max_steps,frame_zero,frame_end)
    
    steplist = zeros(max_steps,4); % [step_ind, fit_chisq, counter_chisq, magic_ratio]

    % iteratively find steps; steps locked in once found; biggest step chosen in each round
    for ns = 1:max_steps
        %disp(['Finding step ',num2str(ns)]);hold on;
        %figure;plot(obs,'Linewidth',1);
        
        seg_points = sort([frame_zero; steplist(1:ns-1,1); frame_end]);  % index for frame before first frame, frame preceding steps, last frame; A(1:0) returns empty matrix
        candidates = zeros(ns,3);
        for k = 1:ns
            [candidates(k,1),candidates(k,2),candidates(k,3)] = split(obs,seg_points(k),seg_points(k+1),min_duration); % identify steps in each segment; [step_ind, min_chisq, fitted_size]
            seg = obs(seg_points(k)+1:seg_points(k+1));
        end
        
        %disp('options')
        %disp(candidates)
        [foo,candidate_ind] = max(candidates(:,3)); % return index for step with biggest size from local fit in candidate list
        
        % [foo,candidate_ind] = min(candidates(:,1)); % lowest chi
        if isnan(foo) % segments cannot be divided futher, because of min_duration
            disp('No further steps found.')
            steplist = steplist(1:ns-1,:); % remove zero (empty) entries
            break
        end
        steplist(ns,1)=candidates(candidate_ind,1); % step_ind

        % chi-squared value of fit
        seg_points = sort([frame_zero; steplist(1:ns,1); frame_end]); % add new step to list of points
        chisq_fit = 0;
        mean_fit = zeros(ns+1,1);
        for k = 1:(ns+1)
            % finds section of signal between step k and step k+1
            seg = obs(seg_points(k)+1:seg_points(k+1));
            
            % calculates the mean value on this segment
            seg_mean = nanmean(seg); % not chi-squared-minimising, use actual mean to calculate statistic
            
            % calculates some weird thing and adds it to chisq_fit
            chisq_fit = chisq_fit + nansum(((seg-seg_mean).^2)/seg_mean);
            
            % save the mean
            mean_fit(k) = seg_mean;
        end
        steplist(ns,2)=chisq_fit;
        
        %steplist(ns,4) = min(abs(diff(mean_fit)))/mean(abs(diff(old_mean_fit))); % ratio of new (actual) step size to mean of old (actual) step sizes;
        
        step_sizes = sort(abs(diff(mean_fit)));                                               
        steplist(ns,4) = step_sizes(1)/max([(nanmean(step_sizes)-3*sqrt(nanmean(step_sizes))),0]); % Poisson stepper, mean = variance ? threshold, 3 standard deviation outside mean
        
        % counter fit
        counter_points = zeros(ns+1,1);
        for k = 1:(ns+1)
            [counter_point,foo,foo2] = split(obs,seg_points(k),seg_points(k+1),2); % fit counter step in each segment
            counter_points(k,:) = counter_point;
        end
        counter_points = [frame_zero; counter_points(~isnan(counter_points)); frame_end];
        chisq_counter = 0;
        
        mean_fit = zeros(numel(counter_points)-1,1);
        
        for k = 1:length(counter_points)-1
            seg = obs(counter_points(k)+1:counter_points(k+1));
            seg_mean = nanmean(seg); % not chi-squared-minimising, use actual mean to calculate statistic 
            chisq_counter = chisq_counter + nansum(((seg-seg_mean).^2)/seg_mean);
            
            mean_fit(k) = seg_mean;
        end
        steplist(ns,3)=chisq_counter;

    end

end

% local function for finding step in segment
function [step_ind, min_chisq, fitted_size] = split(seq,pt1,pt2,min_window) % pt1 and pt2, segment endpoints (always preceding step); fitted_size, size of new step from fit
    window=pt2-pt1;
    if window>=2*min_window
        chisq=zeros(window-1,1);
        for k=1:window
            left_seq = seq(pt1+1:pt1+k);
            right_seq = seq(pt1+k+1:pt2);
            % chi-squared; assumes photon count follows Poisson distribtion (variance = mean)
            
            % here I changed Herman's code so that it uses nanmean, to
            % avoid problems with NaN which I had in a few places
            % some problem with the CK filter leaving a few NaN's
            % I have got rid of the NaN problem with CK filter but have
            % left these as nanmean just in case
            
            %left_mean = sqrt(sum(left_seq.^2)/length(left_seq)) % solution to chi-squared minimisation of left value; independent from right value
            left_mean = sqrt(nanmean(left_seq.^2));
            %right_mean = sqrt(sum(right_seq.^2)/length(right_seq));
            right_mean = sqrt(nanmean(right_seq.^2));
            
            % here I also changed it to nansum to ignore Nans again
            chisq(k) = (nansum( ((left_seq-left_mean).^2)/left_mean ) + nansum( ((right_seq-right_mean).^2)/right_mean )); % degrees of freedom = window-3 (?) not implemented
            
            % % reduced chi-squared (division by degrees of freedom) but assumes variance is 1; original form in Kerssemakers et al.
            % left_mean = mean(left_seq);
            % right_mean = mean(right_seq);
            % chisq(k) = (sum((left_seq-left_mean).^2)+sum((right_seq-right_mean).^2))/(window-1)
        end
        [min_chisq, step_ind] = min(chisq); % minimum chi-squared value and index of first occurence
        step_ind = pt1+step_ind;
        
        % here again replaced mean by nanmean
        fitted_size = abs( nanmean(seq(pt1+1:step_ind)) - nanmean(seq(step_ind+1:pt2)) );
        
        if (pt2-step_ind < min_window) | (step_ind-pt1 < min_window) % if new segments shorter than min_window
            %disp('new segments too small')
            step_ind = NaN;
            min_chisq = NaN;
            fitted_size = NaN;
        end
    else
        %disp('window was too small')
        step_ind = NaN;
        min_chisq = NaN;
        fitted_size = NaN;
    end
end
