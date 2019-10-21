build_fun <- function(sc_list, do_val, atype, errtype, meth, pathout){
  
  purrr::walk(sc_list,
              .f = function(scenario.id){
                cat(
                  whisker::whisker.render(
                    readLines(sprintf('tmpls/tmpl%s_%s.tmpl', errtype, atype)),
                    data = list(sc_id = scenario.id,
                                val = do_val,
                                method = meth)
                  ),
                  file = file.path(pathout,
                                   sprintf("2xcont%s_sc%s_do%s_%s.R", 
                                           errtype, scenario.id, round(100*do_val,0), atype)
                  ),
                  sep='\n') 
              })
  
}
