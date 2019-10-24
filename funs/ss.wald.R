ss.wald <- function(alpha, power, p_C, p_T, M2){
  n.per.arm = floor((qnorm(1-alpha) + qnorm(power))^2*(p_C*(1-p_C)+p_T*(1-p_T))/(p_C-p_T-M2)^2)
}
