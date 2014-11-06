function imgArr = build_image_array(filenames)

% This file builds the higher-dimensional image array for finding PCA, with
% median filtering
% bases.
% Expects: cellstr
% Outputs: MATLAB array

noOfFiles = size(filenames);
maxNo = noOfFiles(2);

temp = fitsread(filenames{1});
imageSize = size(temp);

imgArr = zeros(imageSize(1)*imageSize(2), maxNo);

xC = floor(imageSize(1)/2)+1;
yC = floor(imageSize(2)/2)+1;

imgSize = 20;

[X, Y] = meshgrid(1:imageSize(1), 1:imageSize(2));
mask = (sqrt((X-xC).^2 + (Y-yC).^2)>imgSize)*0 + (sqrt((X-xC).^2 + (Y-yC).^2)<imgSize)*1;

for i = 1:maxNo
        image = fitsread(filenames{i});%.*mask;
        imageMask = im2bw(image/max(max(image)), 0.1);
        image = medfilt2(image) .* imageMask;
        imgArr(:,i) = image(:);
end