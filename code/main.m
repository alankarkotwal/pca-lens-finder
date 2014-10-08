% Main file for pca-lens-finder.
% Author: Alankar Kotwal

% Add the path to the code folder to yout Matlab path
addpath('code');

% Getting the files
% By default, the testing and training set is located in images/
filelist = build_files('images');

% We now have filenames in the cell structure filelist. Build a PCA basis.
