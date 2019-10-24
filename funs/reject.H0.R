reject.H0 <- function(df){
  df%>%summarise(sum=sum(reject.h0)/n())
}