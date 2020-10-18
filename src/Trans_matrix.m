function matrix = Trans_matrix(angle, x_pos, y_pos)
    % create transformation matrix
    % angle needs to be in degrees!
    % (for rand, use cos and sin without the d)
   matrix = [
   cosd(angle) -sind(angle) x_pos;
   sind(angle) cosd(angle) y_pos;
   0 0 1;
   ];