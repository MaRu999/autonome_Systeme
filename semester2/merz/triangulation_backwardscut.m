function robot_pose = triangulation_backwardscut(a, m, b, alpha_p, beta_p)
    if alpha_p + beta_p > pi
        alpha_p = alpha_p - pi;
        beta_p = beta_p - pi;
    end
    xa = a(1);
    ya = a(2);
    xm = m(1);
    ym = m(2);
    xb = b(1);
    yb = b(2);
    ab = sqrt((yb - ya)^2 + (xb - xa)^2)
    theta_ab = atan2((yb - ya), (xb - xa))
    am = sqrt((ym - ya)^2 + (xm - xa)^2)
    theta_am = atan2((ym - ya), (xm - xa))
    gamma = theta_ab - theta_am
    ah = ab * (sin(alpha_p)/sin(alpha_p + beta_p))
    gh = ah * sin(beta_p)
    fm = -am * sin(gamma)
    ag = ah * cos(beta_p)
    af = am * cos(gamma)
    delta = atan2((gh - fm), (ag -af))
    theta_ph = theta_ab + delta
    if gh < fm
        theta_ph = theta_ph + pi
    end
    theta_ap = theta_ph + alpha_p + pi
    epsilon = delta - beta_p
    ap = ah * (sin(epsilon)/sin(alpha_p))
    x = xa + ap * cos(theta_ap);
    y = ya + ap * sin(theta_ap);
    robot_pose = [x;y];
