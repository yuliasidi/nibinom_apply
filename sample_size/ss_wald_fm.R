#Sample size calculation for Wald and FM

library(dplyr)

source("funs/ss.wald.R")
source("funs/p.rmle.fm.R")
source("funs/ss.fm.R")


alpha <- c(0.025)
beta <- c(0.1)
M2 <- c(0.05, 0.075, 0.1, 0.15, 0.2)
p_C <- seq(0.6, 0.95, 0.05)

ass.for.ss <- as.data.frame(expand.grid(p_C, M2+0, alpha, 1-beta))%>%
  dplyr::rename(p_C = Var1, M2 = Var2, alpha = Var3, power = Var4 )%>%
  dplyr::mutate(p_T = p_C, q_C = 1-p_C, d=round(M2-q_C,2))%>%
  dplyr::mutate(ex = ifelse(d>0,"Y","N"))%>% #Exlcude scenarios where the qc will be > X2
  dplyr::mutate(M2.new = ifelse(d==0,M2/2,M2))%>%
  dplyr::filter(ex == "N")%>%
  dplyr::select(-d, -ex, -M2)%>%
  dplyr::rename(M2 = M2.new)

ass.for.ss <- unique(ass.for.ss)%>%
  dplyr::mutate(scenario.id = seq(1,dplyr::n(),1))%>%
  tibble::as_tibble()%>%
  dplyr::select(-q_C)

ss <- ass.for.ss%>%
  dplyr::mutate(n.arm = purrr::pmap_dbl(list(p_C = p_C, p_T = p_T, M2 = M2, alpha = alpha, power = power), 
                          .f=ss.wald))%>%
  dplyr::mutate(method = 'wald')

ss1 <- ss%>%
  dplyr::bind_rows(
    ass.for.ss%>%
      dplyr::mutate(T_n = 1, C_n = 1)%>%
      p.rmle.fm()%>%
      dplyr::select(-c(T_n, C_n))%>%
      dplyr::mutate(n.arm = purrr::pmap_dbl(list(p_C = p_C, p_T = p_T, M2 = M2, p_C.rmle = p_C.rmle, p_T.rmle = p_T.rmle,
                                 alpha = alpha, power = power), 
                            .f=ss.fm))%>%
    dplyr::select(-c(p_C.rmle, p_T.rmle))%>%
    dplyr::mutate(method = 'fm')
  
)

saveRDS(ss1, 'sample_size/ss_wald_fm.rds')
