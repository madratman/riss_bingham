t_init = rand(6,1)
req_var = fmincon(@obj,t_init,[],[],[],[],[],[],@nonlcon)
