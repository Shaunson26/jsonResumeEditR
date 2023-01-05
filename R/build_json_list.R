#' Build JSON list from sections
#'
#' Build a list ready for JSON parsing
#'
#' @param form_data list of inputs from front end
#' @param sections list of section R6 objects
#'
#' @return list
#' @export
build_json_list <- function(form_data, sections){

  # basics + profiles need to together
  basics_tmp <- sections$basics$get_values(form_data)
  basics_tmp$profiles <- sections$profiles$get_values(form_data)

  c(basics = list(basics_tmp),
    lapply(sections[-c(1:2)], function(e){
      e$get_values(form_data)
    })
  )
}
