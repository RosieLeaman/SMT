% this function steal parts of detectBugs3 to find the long axis of the bug
% in the image
% it is INTENDED to work with calculateTrajectoryInfo for tracking
% therefore it ASSUMES that there is one cell per image, and that there is
% no background junk (i.e. the cell will be the only connected component in
% the filtered image)

% it takes in an image (just one frame)
% and returns the x-y coordinates of the top and bottom extrema of the long
% axis

% NOTE 30/11/17: There is currently an issue in which the threshold for
% filtering the image depends on what type the image is, but I can't work
% out how to make MATLAB automatically detect what type it is. It needs to
% be divided by either max of uint8 or uint16 depending on what type the
% image is
% UPDATE 8/12/17: This has been fixed using the function class(image)

% INPUTS:
% loaded_im; the frame from the video to be used to identify the bacteria

% OUTPUTS:
% top; a 1x2 matrix containing the position of the 'top' of the bacteria
% bottom; a 1x2 matrix containing the position of the 'bottom' of the
% bacteria

function [top,bottom] = findBugLength(loaded_im)

% settings

min_px_in_bug = 40;
max_px_in_bug = 2000;

xMax = size(loaded_im,2);
yMax = size(loaded_im,1);

original_im = loaded_im; % save the original image for later

% new filtering approach
smoothed_im = medfilt2(loaded_im, [5 5]);
%figure;imshow(smoothed_im,[min(smoothed_im(:)),max(smoothed_im(:))]);title('smoothed image')

% work out if our image is 8bit or 16bit

imType = class(loaded_im);

thresh = double(mean(smoothed_im(:)))/double(intmax(imType));

%thresh = double(mean(smoothed_im(:)))/double(intmax('uint16'));
%thresh = double(mean(smoothed_im(:)))/double(intmax('uint8'));

filtered_im = imbinarize(smoothed_im,thresh);

%figure;imshow(filtered_im);title('filtered image')

% find connected components
clusters = bwconncomp(filtered_im);

% remove clusters that are too big or too small to be bugs
numPixels = cellfun(@numel,clusters.PixelIdxList);

for i=1:length(clusters.PixelIdxList)
    if numPixels(i) > max_px_in_bug || numPixels(i) < min_px_in_bug
        filtered_im(clusters.PixelIdxList{i})=0;
    end
end

% we apply a 2x2 median filter to the image as this smoothes it
% slightly and removes finding sticky out artifacts as the extrema
filtered_im = medfilt2(filtered_im, [2 2]);

clusters = bwconncomp(filtered_im);

% if we have more than one cluster, get user to select the bug
% or currently just panic and run

if clusters.NumObjects ~= 1
    if clusters.NumObjects == 0
        disp('WARNING: No cell found.')
    else
        disp('WARNING: Found multiple objects.')
    end
    top = NaN;
    bottom = NaN;
else
    % we need the orientation information about the region
    s = regionprops(clusters,'Orientation');
    
    % we will find the extrema by first rotating so the long axis is along
    % the long axis of the picture
    
    % first we rotate the image by 90-the orientation (orientation is in 
    % degrees
    % this will point the long axis up
    
    theta = 90 - s(1).Orientation;
    rotIm = imrotate(filtered_im,theta);
    
    %figure;imshow(rotIm);title('immediately after rotation')
    
    % find clusters in the new image, this is the rotated cell
    clusters2 = bwconncomp(rotIm);
    
    % we want information about its extrema
    s2 = regionprops(clusters2,'Extrema','Centroid');

    % extrema [top-left top-right right-top right-bottom bottom-right bottom-left left-bottom left-top]

    %figure;imshow(rotIm);hold on;
    
    % find the top extrema, and the bottom extrema
    TR = s2.Extrema(2,:);
    TL = s2.Extrema(1,:);
    BL = s2.Extrema(6,:);
    BR = s2.Extrema(5,:);
    
%     plot(TR(1),TR(2),'go');
%     plot(TL(1),TL(2),'gs');
%     
%     plot(BL(1),BL(2),'ro');
%     plot(BR(1),BR(2),'rs');
    
    % set the top, and bottom, ends of the long axis to be the average of
    % these extrema (should be central in bug)
    top = (TR + TL)/2;
    bottom = (BL+BR)/2;
    
%     plot(top(1),top(2),'gx');
%     plot(bottom(1),bottom(2),'rx');
%     plot([top(1),bottom(1)],[top(2),bottom(2)],'b-');
    
    % rotate these points back
    % following example in detectBugs3
    
    % we first make the coordinates relative to the rotated image centre
    
    rotCentre = [round(size(rotIm,2)/2),round(size(rotIm,1)/2)];
    %centroid = s.Centroid;
    
    relTop = top - rotCentre;
    relBottom = bottom - rotCentre;
    
    % we fix our y axis as ours is upside down
    
    relTop(2) = -relTop(2);
    relBottom(2) = -relBottom(2);
    
    % make our rotation matrix, but note the -, because we're rotating
    % clockwise
    theta2 = -(theta*pi)/180;
    
    R = [[cos(theta2),-sin(theta2)];[sin(theta2),cos(theta2)]];
    
    % apply our rotation matrix
    % note it has to be applied to the transpose as our vectors are row
    % vectors not column
    
    newTop = R*relTop';
    newBottom = R*relBottom';
    
    % fix the y axis back
    
    newTop(2) = -newTop(2);
    newBottom(2) = -newBottom(2);
    
    % make un-relative by adding back on the normal image centre
    
    centre = [xMax/2,yMax/2];
    
    % remember here that we have to transpose our vectors back to row
    % vectors
    newTop = newTop' + centre;
    newBottom = newBottom' + centre;
    
%     figure;imshow(filtered_im);title('filtered');hold on;
%     plot(newTop(1),newTop(2),'gx');
%     plot(newBottom(1),newBottom(2),'rx');
%     plot([newTop(1),newBottom(1)],[newTop(2),newBottom(2)],'r-');

    top = newTop;
    bottom = newBottom;

end