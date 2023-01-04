#' Container for group inputs
#'
#' Contain for grouped inputs
#'
#' @param group_name section name to identify the group
#' @param id_suffix unique value to append to id to make uniquely identifiable
#' @param ... elements to include in div
#'
#' @export
input_group_div <- function(group_name, id_suffix, ...){
  htmltools::tags$div(
    class = c('jr-input-group', glue::glue('{group_name}-input-group')),
    id = glue::glue('{group_name}-input-group-{id_suffix}'),
    ...
  )
}
