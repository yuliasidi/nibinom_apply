library(dplyr)
library(purrr)

source('funs/build_fun.R')

ll <- seq(1, 30, 1)

#########################################
## Wald - H0 CCA/sing value imputation ##
#########################################
build_fun(sc_list = ll, do_val = 0.2, meth = 'wald', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/wald/do20')
build_fun(sc_list = ll, do_val = 0.15, meth = 'wald', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/wald/do15')
build_fun(sc_list = ll, do_val = 0.10, meth = 'wald', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/wald/do10')
build_fun(sc_list = ll, do_val = 0.05, meth = 'wald', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/wald/do5')

#########################################
## FM - H0 CCA/sing value imputation  ##
#########################################
build_fun(sc_list = ll, do_val = 0.2, meth = 'fm', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/fm/do20')
build_fun(sc_list = ll, do_val = 0.15, meth = 'fm', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/fm/do15')
build_fun(sc_list = ll, do_val = 0.10, meth = 'fm', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/fm/do10')
build_fun(sc_list = ll, do_val = 0.05, meth = 'fm', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/fm/do5')

#########################################
## WN - H0 CCA/sing value imputation  ##
#########################################
build_fun(sc_list = ll, do_val = 0.2, meth = 'wn', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/wn/do20')
build_fun(sc_list = ll, do_val = 0.15, meth = 'wn', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/wn/do15')
build_fun(sc_list = ll, do_val = 0.10, meth = 'wn', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/wn/do10')
build_fun(sc_list = ll, do_val = 0.05, meth = 'wn', atype = 'sing', errtype = 'H0',pathout = 'sim_pgms/wn/do5')


#########################################
## Wald - H0 MICE                      ##
#########################################
k.assign <- readRDS("k.assign.rds")
k.assign <- as.list(k.assign)

build_fun(sc_list = k.assign, do_val = 0.2, meth = 'wald', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/wald/do20')
build_fun(sc_list = k.assign, do_val = 0.15, meth = 'wald', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/wald/do15')
build_fun(sc_list = k.assign, do_val = 0.10, meth = 'wald', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/wald/do10')
build_fun(sc_list = k.assign, do_val = 0.05, meth = 'wald', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/wald/do5')


#########################################
## FM - H0 MICE                        ##
#########################################
k.assign <- readRDS("k.assign.rds")
k.assign <- as.list(k.assign)

build_fun(sc_list = k.assign, do_val = 0.2, meth = 'fm', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/fm/do20')
build_fun(sc_list = k.assign, do_val = 0.15, meth = 'fm', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/fm/do15')
build_fun(sc_list = k.assign, do_val = 0.10, meth = 'fm', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/fm/do10')
build_fun(sc_list = k.assign, do_val = 0.05, meth = 'fm', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/fm/do5')


#########################################
## WN - H0 MICE                        ##
#########################################
k.assign <- readRDS("k.assign.rds")
k.assign <- as.list(k.assign)

build_fun(sc_list = k.assign, do_val = 0.2, meth = 'wn', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/wn/do20')
build_fun(sc_list = k.assign, do_val = 0.15, meth = 'wn', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/wn/do15')
build_fun(sc_list = k.assign, do_val = 0.10, meth = 'wn', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/wn/do10')
build_fun(sc_list = k.assign, do_val = 0.05, meth = 'wn', atype = 'mice', errtype = 'H0',pathout = 'sim_pgms/wn/do5')



#########################################
## Wald - H1 CCA/sing value imputation ##
#########################################
build_fun(sc_list = ll, do_val = 0.2, meth = 'wald', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/wald/do20')
build_fun(sc_list = ll, do_val = 0.15, meth = 'wald', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/wald/do15')
build_fun(sc_list = ll, do_val = 0.10, meth = 'wald', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/wald/do10')
build_fun(sc_list = ll, do_val = 0.05, meth = 'wald', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/wald/do5')

#########################################
## FM - H1 CCA/sing value imputation  ##
#########################################
build_fun(sc_list = ll, do_val = 0.2, meth = 'fm', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/fm/do20')
build_fun(sc_list = ll, do_val = 0.15, meth = 'fm', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/fm/do15')
build_fun(sc_list = ll, do_val = 0.10, meth = 'fm', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/fm/do10')
build_fun(sc_list = ll, do_val = 0.05, meth = 'fm', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/fm/do5')

#########################################
## WN - H1 CCA/sing value imputation  ##
#########################################
build_fun(sc_list = ll, do_val = 0.2, meth = 'wn', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/wn/do20')
build_fun(sc_list = ll, do_val = 0.15, meth = 'wn', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/wn/do15')
build_fun(sc_list = ll, do_val = 0.10, meth = 'wn', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/wn/do10')
build_fun(sc_list = ll, do_val = 0.05, meth = 'wn', atype = 'sing', errtype = 'H1',pathout = 'sim_pgms/wn/do5')


#########################################
## Wald - H1 MICE                      ##
#########################################
k.assign <- readRDS("k.assign.rds")
k.assign <- as.list(k.assign)

build_fun(sc_list = k.assign, do_val = 0.2, meth = 'wald', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/wald/do20')
build_fun(sc_list = k.assign, do_val = 0.15, meth = 'wald', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/wald/do15')
build_fun(sc_list = k.assign, do_val = 0.10, meth = 'wald', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/wald/do10')
build_fun(sc_list = k.assign, do_val = 0.05, meth = 'wald', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/wald/do5')


#########################################
## FM - H1 MICE                        ##
#########################################
k.assign <- readRDS("k.assign.rds")
k.assign <- as.list(k.assign)

build_fun(sc_list = k.assign, do_val = 0.2, meth = 'fm', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/fm/do20')
build_fun(sc_list = k.assign, do_val = 0.15, meth = 'fm', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/fm/do15')
build_fun(sc_list = k.assign, do_val = 0.10, meth = 'fm', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/fm/do10')
build_fun(sc_list = k.assign, do_val = 0.05, meth = 'fm', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/fm/do5')


#########################################
## WN - H0 MICE                        ##
#########################################
k.assign <- readRDS("k.assign.rds")
k.assign <- as.list(k.assign)

build_fun(sc_list = k.assign, do_val = 0.2, meth = 'wn', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/wn/do20')
build_fun(sc_list = k.assign, do_val = 0.15, meth = 'wn', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/wn/do15')
build_fun(sc_list = k.assign, do_val = 0.10, meth = 'wn', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/wn/do10')
build_fun(sc_list = k.assign, do_val = 0.05, meth = 'wn', atype = 'mice', errtype = 'H1',pathout = 'sim_pgms/wn/do5')

