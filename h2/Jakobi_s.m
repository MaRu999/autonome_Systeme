function jakobi = Jakobi_s(delta_s, delta_angle, angle, d)
     val = angle + (delta_angle/2);
     var = delta_s/(2*d);
    jakobi = [
    (0.5*cos(val) - var*sin(val)), (0.5*cos(val) + var*sin(val));
    (0.5*sin(val) + var*cos(val)), (0.5*sin(val) - var*cos(val));
    (1/d), (-1/d)
    ];