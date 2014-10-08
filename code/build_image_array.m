function imgArr = build_image_array(filenames)

% This file builds the higher-dimensional image array for finding PCA
% bases.
% Expects: cellstr
% Outputs: MATLAB array

noOfFiles = size(filenames);

temp = fitsread(filenames(1));
imageSize = size(temp);

imgArr = zeros(imageSize(1)*imageSize(2), noOfFiles);

