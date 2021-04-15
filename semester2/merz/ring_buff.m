function buff = ring_buff(k, total)
    buff = mod(k, total);
    if buff == 0
        buff = total;
    end