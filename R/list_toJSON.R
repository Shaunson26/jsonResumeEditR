#' toJSON wrapper
#'
#' @param x list
list_toJSON <- function(x){
    jsonlite::toJSON(x, pretty = TRUE, auto_unbox = TRUE)
}
