function res = ProjectionResidual(testData,Q,sample_mean)
%% Description
% Calculates the projection residual of testData onto the normal subspace
% Returns the norm of the projection residual
%% Input parameters
% testData: input data for testing
% Q: anomalous projection matrix
% sample_mean: the sample mean of data input
%% Output
% res: projection residual of testData, i.e., its degree of anomalous
y = Q * (testData - sample_mean );
res = norm(y);