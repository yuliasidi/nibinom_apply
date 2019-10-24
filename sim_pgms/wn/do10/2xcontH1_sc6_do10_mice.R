library(dplyr)

ss.bounds <- readRDS("ss.bounds.rds")
alpha <- 0.025
method <- 'wn'
scenario <- 6
param <- 1
anal_type <- "mice"

ss <- ss.bounds%>%
  dplyr::filter(method == "wn", scenario.id == scenario)

do_val <- 0.1

  
 
x1 <- parallel::mclapply(X = 1:10000, 
                       mc.cores = parallel::detectCores() - 1,
                       FUN= function(x) {
 library(tidyr, warn.conflicts = F, quietly = T)
 library(dplyr, warn.conflicts = F, quietly = T)
 library(purrr, warn.conflicts = F, quietly = T)
 library(reshape2, warn.conflicts = F, quietly = T)
 library(MASS, warn.conflicts = F, quietly = T)
 library(nibinom)
 
 set.seed(10000*scenario + x)                                                   
 #generate full data with desired correlation structure
 dt0 <- sim_cont(p_C = ss$p_C, p_T = ss$p_C, n_arm = ss$n.arm, 
                 mu1 = 4, mu2 = 100, sigma1 = 1, sigma2 = 20, r12 = -0.3, b1 = 0.1, b2 = -0.01)
 ci.full <- dt0%>%wn_ci(ss$M2,'y', alpha)
 
 #define missingness parameters and do rates
 m_param <- mpars(do = do_val, atype = anal_type) 
 
 #impose missing values and perform analysis
 ci.miss.mnar1 <- m_param%>%
   slice(1)%>%
   dplyr::mutate(results = purrr::pmap(list(b_trt=bt, b_y=by, b_x1=bx1, b_x2=bx2, b_ty = b.ty), 
                                       miss_gen_an, dt = dt0, do = do_val,
                                       ci_method = wn_ci,
                                       sing_anal = F,
                                       mice_anal = T,
                                       m2 = ss$M2, seed = 10000*scenario + x,
                                       seed_mice = 10000*scenario + x,
                                       method = method,
                                       alpha = alpha,
                                       n_mi = 2,
                                       m_mi = 100,
                                       mu_T = 0.82, sd_T = 0.05))%>%
   dplyr::select(missing, results)
 
 ci.miss.mnar2 <- m_param%>%
   slice(2)%>%
   dplyr::mutate(results = purrr::pmap(list(b_trt=bt, b_y=by, b_x1=bx1, b_x2=bx2, b_ty = b.ty), 
                                       miss_gen_an, dt = dt0, do = do_val,
                                       ci_method = wn_ci,
                                       sing_anal = F,
                                       mice_anal = T,
                                       m2 = ss$M2, seed = 10000*scenario + x,
                                       seed_mice = 10000*scenario + x,
                                       method = method,
                                       alpha = alpha,
                                       n_mi = 2,
                                       m_mi = 100,
                                       mu_T = 1.25, sd_T = 0.05))%>%
   dplyr::select(missing, results)
 
 
 ci.miss <- bind_rows(ci.miss.mnar1, ci.miss.mnar2)%>%
   dplyr::mutate(scenario.id = ss$scenario.id,
                 p_C = ss$p_C,
                 M2 = ss$M2,
                 type = 't.H1',
                 do = do_val,
                 sim.id = x)
 
 ci.all <- list(ci.full, ci.miss)%>%purrr::set_names(c("ci.full","ci.miss")) 
 return(ci.all)
})


#to summarize power from the simulated data
source('funs/h0.mice.sum.R')
h0.mice.sum(x1, method = 'wn')%>%
  dplyr::select(-mean.bias)







