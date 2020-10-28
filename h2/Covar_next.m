function next = Covar_next(jakobi_p, covar_p, jakobi_s, covar_s)
    next = jakobi_p * covar_p * jakobi_p' + jakobi_s * covar_s * jakobi_s';