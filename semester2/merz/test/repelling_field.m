function u_rep = repelling_field(roh_min, k_rep, mids, radii, r_pos)
    u_rep = 0;
    for i=1:3
        dist_mid = norm(r_pos - mids(:,i));
        dist = dist_mid - radii(i);
        if dist >= roh_min
            u_rep = u_rep + 0;
        else
            u_rep = u_rep + (1/2) * k_rep *((1/dist) - (1/roh_min))^2;
        end
    end