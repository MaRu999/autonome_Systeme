% function that calculates the next covariance matrix
% input parameters:
% jakobi_p = Jakobi matrix for pose
% covar_p = current covariance matrix
% jakobi_s = Jakobi matrix for drive
% covar_s = covariance matrix for drive
% return values:
% next = the next covariance matrix
function next = Covar_next(jakobi_p, covar_p, jakobi_s, covar_s)
    % the next covariance matrix is Jakobi pose * current covariance matrix * transposed Jakobi pose
    % + Jakobi drive * covariance matrix drive * transposed Jakobi drive
    next = (jakobi_p * covar_p * jakobi_p') + (jakobi_s * covar_s * jakobi_s');