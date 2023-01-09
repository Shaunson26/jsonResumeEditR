#' Remove empty inputs from captured values
#'
#' Remove input values of '' from captured list of values
#'
#' @param x list of values
#'
#' @export
remove_empty_inputs <- function(x){

  strsplit_fields <- c('highlights', 'courses', 'keywords', 'roles')

  strsplit_fields_inds <- which(names(x) %in% strsplit_fields)

  if (length(strsplit_fields_inds) > 0){
    for(i in strsplit_fields_inds) {
      if(length(x[[i]]) == 0){
        x[[i]] <- ''
      }
    }
  }

  x[x == ''] <- NULL

  x
}
