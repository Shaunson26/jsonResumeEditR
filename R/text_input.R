#' Text input
#'
#' Create a text input
#'
#' @param id The input slot that will be used to access the value.
#' @param label Display label for the control, or NULL for no label.
#' @param value Initial value.
#' @param width The width of the input, e.g. '400px', or '100%'
#' @param placeholder	A character string giving the user a hint as to what can be
#' entered into the control. Internet Explorer 8 and 9 do not support this option.
text_input <- function(id, label, value=NULL, placeholder=NULL, width = NULL){

  htmltools::tags$div(
    class = 'jr-input-container',
    htmltools::tags$label(`for` = id, label),
    htmltools::tags$input(
      type = "text",
      id = id,
      name = id,
      class = 'form-control',
      placeholder = placeholder,
      style = ifelse(!is.null(width), paste0('width:', width), ''),
      value = value
    )
  )

}
