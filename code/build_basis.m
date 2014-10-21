function [basis, mean] = build_basis(imgArr, k)

% This function calculates the top k basis vectors of the PCA basis. k=0
% means all basis vectors.
% Expects: MATLAB array, int
% Outputs: [MATLAB array, MATLAB array]

% Get sizes
[imgSize noOfImages] = size(imgArr);

% Mean subtraction
mean = transpose(sum(transpose(imgArr)))/noOfImages;
imgArrTemp = imgArr - kron(mean, ones([1 noOfImages]));

% Generate XT*X and find its eigenvectors
L = transpose(imgArrTemp)*imgArrTemp;
[W,D] = eig(L);

% Get eigenvectors and eigenvalues of C and normalize them
V = imgArrTemp*W;
norms = sqrt(sum(V.^2));
V = V ./ kron(norms, ones([imgSize 1]));


% Sort eigenvectors by their eigenvalues
[~,sortOrder]=sort(diag(D), 'descend');
Vs = V(:, sortOrder);

% Get top k eivenvectors
if(k==0)
    basis=Vs;
else
    basis = Vs(:, 1:k);
end