library(dplyr)

ss_wald_fm <- readRDS('sample_size/ss_wald_fm.rds')
ss_wn <- readRDS('sample_size/ss_wn.rds')

ss.bounds <- ss_wald_fm%>%
  dplyr::bind_rows(ss_wn)

saveRDS(ss.bounds,'ss.bounds.rds')
