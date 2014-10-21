% Main file for pca-lens-finder.
% Author: Alankar Kotwal

% Add the path to the code folder to yout Matlab path
%addpath('code');

% Getting the files
% By default, the testing and training set is located in images/
filelist = build_files('images-full');

% We now have filenames in the cell structure filelist. Build a PCA basis.
% First get the image array
imgArr = build_image_array(filelist);

% Build the PCA basis
[basis, mean] = build_basis(imgArr, 150);

% Reconstruct galaxy images
outimage = mean+reconstruct_image(imgArr(:,4)-mean, basis);
im = reshape(outimage, 101, 101);
img = reshape(imgArr(:,3), 101, 101);
imshow(im/max(max(im)));
figure;
imshow(img/max(max(img)));