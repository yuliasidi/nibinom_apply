power_wn <- function(wn){
  
  wn%>%
    mutate(
      t.wn.CI = pmap(list(t.WN, M2 = M2), wn.CI, y = 'y'),
      power.WN = map(t.wn.CI, reject.H0),
      power.WN = map_dbl(power.WN,as.numeric),
      power.est = round(power.WN,2)
    )
  
}
