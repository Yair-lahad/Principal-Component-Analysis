function encodedVecs=getPCA(matrix,samples,nReducedDim)
%this function perform Principal component analysis for given matrix
% input- Matrix, number of samples,number of reduced dimensions for pca
% ouput- encoded vecs reduced to prefered dimentions number

meanSample=mean(matrix,2);
matrix=matrix-meanSample;
covMat = matrix*matrix'./(samples - 1); % creating covariance squared matrix
[eigenVecs,D]=eigs(covMat,nReducedDim); % returns largest nReducedDim eigenVectors
encodedVecs= eigenVecs' * matrix;
end