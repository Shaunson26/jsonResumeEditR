#' Build JSON list from sections
#'
#' Build a list ready for JSON parsing
#'
#' @description
#' getFormData() returns a named list of values e.g. `$basics-name-1`, `$profiles-network-2`.
#' The prefix is used to segregate sections (e.g. basics vs work), while the suffix used to group
#' related sub-sections (e.g. multiple work inputs). If there are empty sections, then their
#' return values will be "".
#'
#' Each section object has methods to select the relevant values and wrangle them
#'
#' @param form_data list of inputs from front end
#' @param sections list of section R6 objects
#'
#' @return list
#' @export
build_json_list <- function(form_data, sections){

  # includes empty fields e.g. ""
  got_values <-
    lapply(sections, function(e){
      e$get_values(form_data)
    })

  # empty fields return a list element of NULL, so they need removal otherwise
  # empty sections will be included in the final JSON resume
  # 1: Nested elements
  for(i in seq_along(got_values)){
    if (is.list(got_values[[i]])){
      e_length <- sapply(got_values[[i]], length)
      is_empty = e_length == 0
      got_values[[i]][is_empty] <- NULL
    }
  }
  # 2: top level elements
  e_length <- sapply(got_values, length)
  is_empty = e_length == 0
  got_values[is_empty] <- NULL

  # return
  got_values

}
