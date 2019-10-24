h0.mice.sum<- function(dtname, method){
  
  if (method!='wn'){
    bind_rows(
      dtname%>%
        purrr::map_df(.f=function(x) x$ci.miss,.id = 'sim')%>%
        tidyr::unnest()%>%
        dplyr::filter(seq(1,n(),1)%in%c(seq(1,n(),2)))%>%
        tidyr::unnest())%>%
      mutate(bias = round((qbar-M2)/M2,4))%>%
      dplyr::group_by(scenario.id, strategy, missing, k.C.spec, k.T.spec, do)%>%
      dplyr::summarise(type1=mean(reject_h0), mean.bias = mean(bias))
  }
  else{
    bind_rows(
      dtname%>%
        purrr::map_df(.f=function(x) x$ci.miss,.id = 'sim')%>%
        tidyr::unnest()%>%
        dplyr::filter(seq(1,n(),1)%in%c(seq(1,n(),2)))%>%
        tidyr::unnest())%>%
      mutate(bias = round((qbar.d-M2)/M2,4))%>%
      dplyr::group_by(scenario.id, strategy, missing, k.C.spec, k.T.spec, do)%>%
      dplyr::summarise(type1=mean(reject_h0), mean.bias = mean(bias))
  }
  
}
