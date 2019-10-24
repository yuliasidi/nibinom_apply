h0.sing.sum<- function(dtname){
  bind_rows(
    dtname%>%
      purrr::map_df(.f=function(x) x$ci.miss,.id = 'sim')%>%
      tidyr::unnest()%>%
      dplyr::filter(seq(1,n(),1)%in%c(seq(1,n(),2)))%>%
      tidyr::unnest())%>%
    dplyr::mutate(bias = round((phat_d-M2)/M2,4))%>%
    dplyr::group_by(scenario.id, strategy, missing, do)%>%
    dplyr::summarise(type1=mean(reject_h0), mean.bias = mean(bias), mean_pc = mean(C_phat), mean_pt = mean(T_phat))
  
}
