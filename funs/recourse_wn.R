recourse_wn <- function(wn, n.sim.ss,store = NULL){
  
  cat('\nsampling...\n')
  

  x <- wn%>%
    sample_wn(n.sim.ss = n.sim.ss)%>%
    power_wn()  
  

  x1 <- x%>%
    dplyr::mutate(
      flag = dplyr::case_when(
        power.est-power>0 ~ 'decrease',
        power.est-power<0 ~ 'increase',
        TRUE ~ 'drop')
    )
  

  store <- dplyr::bind_rows(
    store,
    x1%>%dplyr::filter(flag=='drop')
  )
  
  x2 <- x1%>%
    dplyr::filter(flag!='drop')
  
  cat(sprintf('nrows left: %s\n',nrow(x2)))
  
  if(nrow(x2)>0){
    
    x2 <- x2%>%
      dplyr::mutate(
        N_T=ceiling(dplyr::if_else(flag=='decrease',N_T*0.99,N_T*1.01))
      )
    
    recourse_wn(x2,n.sim.ss,store)
    
  }else{
    
    return(store)
    
  }
  
}
