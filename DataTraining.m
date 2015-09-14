function [Q sample_mean] = DataTraining(data,var_threshold,N)
%% Description
% Use data for training
% Learn the principal components that accout for the normal correlation to
% construct a normal subspace
% Construct the anomalous subspace using the rest of the principal
% components
% returns the anomalous projection matrix
%% Input parameters
% data: input data for training
% var_threshold: the threshold for captured variance, used when selecting
% the number of principal components (PCs)
% N: window size for each experiment
%% Output
% Q: anomalous projection matrix 
% sample_mean: the sample mean of data input
[L,~]=size(data);
st=1;ed=N;
sample = [];
while ed<=L
    % sensing
    sample = [sample data(st:ed)];
    st=st+N;ed=ed+N;
end
% remove mean from the sample
sample_mean = mean(sample,2);
[~,M] = size(sample);
sample = sample - repmat(sample_mean,1,M);
% apply PCA to get PCs and the amount of variance captured by each
% principal component 
[pc,~,latent] = princomp(sample');
% find the number of PCs using the threshold
p = find(latent/sum(latent)>var_threshold); 
% find the dimension of the normal subspace
k = p(end); 
% construct the normal subspace
P = pc(:,1:k);     % normal subspace
Q = eye(N)-P*P';     % anomalous projection