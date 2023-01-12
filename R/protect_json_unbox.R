protect_json_unbox <- function(list){

  elements_for_protection <-  c('highlights', 'courses', 'keywords', 'roles')

  lapply(list, function(e1){
    # for each element
    lapply(e1, function(e2){
      needs_asis <- any(names(e2) %in% elements_for_protection)
      if (needs_asis){
        asis_inds <- which(names(e2) %in% elements_for_protection)
        for (asis_inds_i in asis_inds){
          e2[[asis_inds_i]] <- I(e2[[asis_inds_i]])
        }
      }
      e2
    })
  })
}
