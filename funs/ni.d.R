ni.d <- function(N_T,N_C,p_T,p_C){
  data_frame(
    pat_id = seq(1,N_T+N_C,1),
    y = c(rbinom(N_T,1,p_T),rbinom(N_C,1,p_C)),
    trt = rep(c('T','C'),c(N_T,N_C))
  )
  
}