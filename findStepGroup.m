% this function classifies each trajectory into one of four 'step groups'
% Group 0 : does not fit any other classification
% Group 1 : probably single fluorophore
% Group 2 : probably multiple fluorophores
% Group 3 : no step, but probably single based on fluorescence intensity

% INPUTS:
% len; the length of the trajectory in frames
% steplist; a list obtained from hermanAutosteps which is a list of every
% step identified and its size
% ns_rec; the number of steps recommended by the chi square test used in
% hermanAutosteps
% newShortIntensity; a vector containing the intensity values, padded to
% the left and right
% BG_level; the average intensity in the background of the image
% sizeExtraLeft; the amount of frames by which the intensity was padded to
% the left

% OUTPUTS:
% group; the group classification as described above

function group = findStepGroup(len,steplist,ns_rec,newShortIntensity,BG_level,sizeExtraLeft)

% identify step group
    
    endTraj = len+sizeExtraLeft;
    % groups: 0: no idea 1: single fluorophore 2: more than one fluorophore
    % 3: probably single based on fluorescence level
    group = 0;
    
    if ns_rec == 1 && steplist(1,1) >= endTraj - 20
        % this is OK there was one step after the trajectory ended
        % we are happy this is single fluorophore
        
        %title('Single fluorophore')
        group = 1;
        
    elseif ns_rec == 1 && steplist(1,1) < endTraj-20
        % there was one step and it happened before the end
        % add a little bit of leeway as the exact position is a bit hard to
        % determine
        % we can only really accept the part of the trajectory after the
        % end: see how long it is
        
        %title('Not sure')
        group = 0;
        
    elseif (ns_rec == 2 && steplist(1,5) > 0) && max(steplist(1:ns_rec,1)) >= endTraj - 20
        % there were two steps, the first step is going up
        % and the second step occurs at the end of the trajectory (plus a
        % bit of leeway)
        % this is single fluorophore
        
        group = 1;
        
    elseif ns_rec > 1
        % there was more than one step 
        % many bleaches, call it multiple
        
        group = 2;
          
    elseif ns_rec == 0
        % there are no steps
        % we can make an attempt to classify based on the level of the
        % fluorescence but its patchy
        % for now just title not sure
        
        if abs(nanmean(newShortIntensity) - BG_level) > 50
            %title(['Probably not, BG level is',num2str(BG_level)])
            group = 0;
        else
            %title(['Possibly, BG level is',num2str(BG_level)])
            group = 3;
        end

    else
        % eh
        %title('who knows')
        group = 0;
    
    end