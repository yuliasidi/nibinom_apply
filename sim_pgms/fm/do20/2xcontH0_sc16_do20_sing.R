library(dplyr)

ss.bounds <- readRDS("ss.bounds.rds")
alpha <- 0.025

method <- 'fm'
scenario <- 16
param <- 1
anal_type <- "sing"

ss <- ss.bounds%>%
  dplyr::filter(method == "fm", scenario.id == scenario)

do_val <- 0.2


system.time({
  
  
  x1 <- parallel::mclapply(X = 1:10000, 
                           mc.cores = parallel::detectCores() - 1,
                           FUN= function(x) {
     
     library(tidyr, warn.conflicts = F, quietly = T)
     library(dplyr, warn.conflicts = F, quietly = T)
     library(purrr, warn.conflicts = F, quietly = T)
     library(reshape2, warn.conflicts = F, quietly = T)
     library(mice, warn.conflicts = F, quietly = T)
     library(MASS, warn.conflicts = F, quietly = T)
     library(nibinom) 
     
     set.seed(10000*scenario + x)                                                   
     #generate full data with desired correlation structure
     dt0 <- sim_cont(p_C = ss$p_C, p_T = ss$p_C - ss$M2, n_arm = ss$n.arm, 
                     mu1 = 4, mu2 = 100, sigma1 = 1, sigma2 = 20, r12 = -0.3, b1 = 0.1, b2 = -0.01)
     ci.full <- dt0%>%fm_ci(ss$M2,'y')
     
     #define missingness parameters and do rates
     m.param <- mpars(do = do_val, atype = anal_type) 
     
     #impose missing values and perform analysis
     ci.miss <- m.param%>%
       dplyr::mutate(results = purrr::pmap(list(b_trt=bt, b_y=by, b_x1=bx1, b_x2=bx2, b_ty = b.ty), 
                                           miss_gen_an, dt = dt0, do = do_val,
                                           ci_method = fm_ci,
                                           sing_anal = T,
                                           mice_anal = F,
                                           m2 = ss$M2, seed = 10000*scenario + x,
                                           method = method,
                                           alpha = alpha
                                           ))%>%
       dplyr::select(missing, results)%>%
       dplyr::mutate(scenario.id = ss$scenario.id,
                     p_C = ss$p_C,
                     M2 = ss$M2,
                     type = 't.H0',
                     do = do_val,
                     sim.id = x)
     
     ci.all <- list(ci.full, ci.miss)%>%purrr::set_names(c("ci.full","ci.miss")) 
     
     return(ci.all)
   })
})




