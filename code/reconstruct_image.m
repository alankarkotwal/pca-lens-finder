function outputImage = reconstruct_image(origImage, basis)

% Reconstruct an image given the basis and coefficients.
% Expects: MATLAB array, and a basis array
% Returns: MATLAB array

coeffs = transpose(origImage(:))*basis;
[elements ~] = size(basis);

componentImages = basis .* kron(coeffs, ones([elements 1]));

outputImage = transpose(sum(transpose(componentImages)));