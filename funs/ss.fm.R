ss.fm <- function(alpha, power, p_C, p_T, M2, p_C.rmle, p_T.rmle ){
  n.per.arm = floor((qnorm(1-alpha)*sqrt((p_C.rmle*(1-p_C.rmle)+p_T.rmle*(1-p_T.rmle))) + 
                       qnorm(power)*sqrt(p_C*(1-p_C)+p_T*(1-p_T)))^2/(p_C-p_T-M2)^2)
}



