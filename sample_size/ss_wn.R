#source helper functions
source('funs/ni.d.R')
source('funs/wn.CI.R')
source('funs/sample_wn.R')
source('funs/power_wn.R')
source('funs/ni.d.R')
source("funs/recourse_wn.R")
source('funs/reject.H0.R')
source('funs/ss_wn_fun.R')

library(dplyr)
library(purrr)
library(reshape2)

alpha <- c(0.025)
beta <- c(0.1)

SS0 <- readRDS("sample_size/ss_wald_fm.rds")
SS0 <- SS0%>%
  dplyr::filter(method=='fm')

n.sim.ss <- 5000
set.seed(3425)

wn_new <- map_df(1:30, ss_wn_fun, dt= SS0, .id='idx')

SS1 <- wn_new %>%
  dplyr::select(p_C, alpha, power, p_T, M2, scenario.id, n.arm)%>%
  dplyr::mutate(method = 'wn')

saveRDS(SS1, file = sprintf('sample_size/ss_wn.rds',idx))
