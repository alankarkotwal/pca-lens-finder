% Main file for pca-lens-finder.
% Author: Alankar Kotwal

% Timing
tic

% Add the path to the code folder to your Matlab path
%addpath('code');

% Getting the files
% By default, the testing and training set is located in images/
filelist = build_files('images');
filesize = size(filelist);

% We now have filenames in the cell structure filelist. Build a PCA basis.
% First get the image array
imgArr = build_image_array(filelist);
imgSize = size(fitsread(filelist{1}));

% Perform, if required, some scaling and rotation. TODO.
% Put stuff done here.

% Build the PCA basis
[basis, mean] = build_basis(imgArr, 2);

% Reconstruct all galaxy images
reconstructedImages = zeros(imgSize(1)*imgSize(2), filesize(2));
residuals = zeros(imgSize(1)*imgSize(2), filesize(2));
filteredResiduals = zeros(imgSize(1)*imgSize(2), filesize(2));
for i=1:filesize(2)
    reconstructedImages(:, i) = mean+reconstruct_image(imgArr(:,i)-mean, basis);
    residuals(:, i) = imgArr(:, i) - reconstructedImages(:, i);
    %resImage = reshape(residuals(:, i), imgSize(1), imgSize(2));
    %resImage = medfilt2(resImage);
    %filteredResiduals(:, i) = resImage(:)/max(max(resImage));
    %filteredResiduals(:, i) = im2bw(filteredResiduals(:, i)/max(max(filteredResiduals(:, i))), 0.75);
end

% In the original images, find a representative radius which encloses most
% of the original area. Set all pixels outside this radius in the
% subtracted image to zero. Then put an area threshold to remove small
% isolated regions.

% Timing
toc