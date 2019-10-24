sample_wn <- function(wn, n.sim.ss){
  
  wn%>%
    dplyr::mutate(
      N_C = N_T,
      t.WN=purrr::pmap(list(N_T,N_C,p_T,p_C),
                       .f = function(..., n.sim.ss){
                         purrr::rerun(n.sim.ss,ni.d(...))%>%
                           dplyr::bind_rows(.id = "sim.id")
                       },n.sim.ss = n.sim.ss)
    ) 
}

