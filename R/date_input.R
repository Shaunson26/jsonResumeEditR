#' Date input
#'
#' @param id The `input` slot that will be used to access the value.
#' @param label Display label for the control, or NULL for no label.
#' @param value The starting date. Either a Date object, or a string in yyyy-mm-dd format.
#' If NULL (the default), will use the current date in the client's time zone
#'
#' @return html tag
#' @export
date_input <- function(id, label, value = NULL) {
  htmltools::tags$div(
    class = 'form-group shiny-input-container',
    htmltools::tags$label(`for` = id, label),
    htmltools::tags$input(
      type = "date",
      id = id,
      name = id,
      class = 'form-control',
      value = value
    )
  )
}

