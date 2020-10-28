function [delta_sr, delta_sl] = Get_wheel_deltas(delta_s, d, delta_angle)
    delta_sr = (2*delta_s + d * delta_angle)/2;
    delta_sl = 2*delta_s - delta_sr;
