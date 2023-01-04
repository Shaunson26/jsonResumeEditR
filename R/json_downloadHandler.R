#' Download handler for exporting JSON
#'
#' @param json_list list that will be parsed into JSON
#'
#' @export
json_downloadHandler <- function(json_list){
  shiny::downloadHandler(
    filename = function() {
      paste0('jsonResumeR-', Sys.Date(), "-.json")
    },
    content = function(file) {
      jsonlite::write_json(json_list, file, pretty = TRUE, auto_unbox = TRUE)
    }
  )
}
