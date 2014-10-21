function outputImage = reconstruct_image(origImage, basis)

coeffs = transpose(origImage(:))*basis;
[elements basisSize] = size(basis);

componentImages = basis .* kron(coeffs, ones([elements 1]));

outputImage = transpose(sum(transpose(componentImages)));