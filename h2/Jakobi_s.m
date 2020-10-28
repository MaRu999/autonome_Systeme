function jakobi = Jakobi_s(delta_s, delta_angle, angle, d)
    jakobi = [
    0.5*cos(angle + delta_angle/2) - (delta_s/(2*d))*sin(angle + (delta_angle/2)) 0.5*cos(angle + delta_angle/2) + (delta_s/(2*d))*sin(angle + (delta_angle/2));
    0.5*sin(angle + delta_angle/2) + (delta_s/(2*d))*cos(angle + (delta_angle/2)) 0.5*sin(angle + delta_angle/2) - (delta_s/(2*d))*cos(angle + (delta_angle/2));
    1/d -1/d
    ];