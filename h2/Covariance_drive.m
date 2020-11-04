% function that calculates the covariance matrix of the drive, as shown in skriptum on page 52
% input parameters:
% k_r = uncertainty factor for covariance matrix for righ wheel of drive
% delta_sr = distance driven for step for right wheel
% k_l = uncertainty factor for covariance matrix for left wheel of drive
% delta_sl = distance driven for step for left wheel
% return values:
% covar = covariance matrix for the drive
function covar = Covariance_drive(k_r, delta_sr, k_l, delta_sl)
    covar = [
    % k_r * amount (Betrag) vector delta_sr, 0
    (k_r * norm(delta_sr)), 0;
    % 0, k_l * amount (Betrag) vector delta_sl
    0, (k_l * norm(delta_sl))
    ];