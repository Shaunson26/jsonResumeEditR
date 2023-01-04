#' Include jsonResumeEditR htmlDependency
#'
#' Include jsonResumeEditR htmlDependency
#'
#' @export
use_jsonResumeEditR <- function(){

  htmltools::htmlDependency(
    name = "jsonResumeEditR",
    version = "2022.12.20",
    src = "shiny-apps/jsonResumeEditR/assets",
    script = c("javascript/clearFormData.js",
               "javascript/deleteInputGroup.js",
               "javascript/getFormData.js"),
    # stylesheet = c('css/fonts.css',
    #                'css/styles.css'),
    package = "jsonResumeEditR")

}
