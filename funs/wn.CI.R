wn.CI <- function(df, M2, y){
  
  df%>%
    group_by(sim.id, trt)%>%
    summarise(phat = mean(y, na.rm = T), n = sum(!is.na(y)))%>%
    recast(sim.id ~ trt + variable, measure.var = c("phat",'n'))%>%
    dplyr::mutate(z = qnorm(1-alpha),
                  l.C = (C_phat + z^2/(2*C_n) - 
                           z*sqrt((C_phat*(1-C_phat)+z^2/(4*C_n))/C_n))/(1+z^2/C_n),
                  u.C = (C_phat + z^2/(2*C_n) + 
                           z*sqrt((C_phat*(1-C_phat)+z^2/(4*C_n))/C_n))/(1+z^2/C_n),
                  
                  l.T = (T_phat + z^2/(2*T_n) - 
                           z*sqrt((T_phat*(1-T_phat)+z^2/(4*T_n))/T_n))/(1+z^2/T_n),
                  u.T = (T_phat + z^2/(2*T_n) + 
                           z*sqrt((T_phat*(1-T_phat)+z^2/(4*T_n))/T_n))/(1+z^2/T_n),
                  
                  ci.l = C_phat-T_phat-sqrt((C_phat-l.C)^2+(u.T-T_phat)^2),
                  ci.u = C_phat-T_phat+sqrt((u.C-C_phat)^2+(T_phat-l.T)^2),
                  reject.h0 = case_when(ci.u < M2 ~ 1, TRUE ~ 0))
}

