ss_wn_fun <- function(dt, idx){
  
  SS.idx <- dt%>%
    dplyr::slice(idx)
  
  
  wn <- SS.idx %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(
      
      N_T = n.arm, N_C = N_T,
      
      t.WN = purrr::pmap(list(N_T, N_C, p_T, p_C), .f = function(..., n.sim.ss) {
        
        purrr::rerun(n.sim.ss, ni.d(...)) %>% 
          dplyr::bind_rows(.id = "sim.id")
        
      }, 
      n.sim.ss = n.sim.ss
      )
    )
  
  wn_new <- recourse_wn(wn, n.sim.ss)
  
  return(wn_new)
}


