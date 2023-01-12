#' Include jsonResumeEditR htmlDependency
#'
#' Include jsonResumeEditR htmlDependency
#'
#' @export
use_jsonResumeEditR <- function(){

  htmltools::htmlDependency(
    name = "jsonResumeEditR",
    version = "2023-01-11",
    src = "www",
    script = c("jquery-ui.min.js",
               "repeatableFields.js",
               "jsonResumeEditR.js"),
    #stylesheet = c('fonts.css', 'styles.css'),
    package = "jsonResumeEditR")

}
