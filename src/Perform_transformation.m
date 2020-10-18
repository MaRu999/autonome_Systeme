function result = Perform_transformation(transformation_matix, data_distance, data_angle)
    % assumption: data_distance and data_angle are both vectors of the same length
    % since there needs to be a distance for every angle, this should be the case

    % first, get length of one vector (need to be the same lenght, doesn't matter which)
    % will tell us how many repetions we need to transform all data
    dim = length(data_distance);
    % make a vector to fill with the results
    result = [];
    % create a counting variable i
    i = 1;
    % while loop that iterates over all scan values
    while i <= dim
        % the excel sheets return strings for some reason, so a transformation to double is necessary
        % multiply distance with cosinus of angle for the first value
        val1 = str2double(data_distance{i}) * cosd(str2double(data_angle{i}));
        % multiply distance with the sinus of angle for the second value
        val2 = str2double(data_distance{i}) * sind(str2double(data_angle{i}));
        % create a vector with a 1 appended (so we can multiply with the transformation matrix)
        invec = [
        val1;
        val2;
        1;
        ];
        % append the resulting vector to our result as a new column
        result = [result transformation_matix * invec];
        % increase counter by 1
        i = i + 1;
    end