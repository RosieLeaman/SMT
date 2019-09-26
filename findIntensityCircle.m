% calculates the average intensity of the image in a circle shaped
% area with given centre and radius

% INPUTS:
% centre; a 1x2 row vector with the co-ordinates of the centre of the
% circle we want to find the intensity of
% radius; the radius of the circle
% image; a single frame obtained from a tiffread struct containing the
% image 

% OUTPUTS:
% intensity; the average intensity in a circle placed on image
% with centre centre and radius radius

function intensity = findIntensityCircle(centre,radius,image)

sum = 0;
count = 0;
for i=1:size(image,1)
    for e=1:size(image,2)
        if (i-centre(2))^2+(e-centre(1))^2 <= radius^2
            sum = sum + image(i,e);
            count = count + 1;
        end
    end
end

intensity = sum/count;

end